import 'package:MobilEasy/pages/directions_model.dart';
import 'package:MobilEasy/pages/directions_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

const LatLng currentLocation = LatLng(-19.92548473052761, -43.99315289911171);

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late GoogleMapController _googleMapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;
  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  late stt.SpeechToText _speech;
  String _recognizedText = "";
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _initSpeechState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    _originController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  static const _initialCameraPosition = CameraPosition(
    target: currentLocation,
    zoom: 14,
  );

  Future<void> _getDirections() async {
    try {
      List<Location> originLocations = await locationFromAddress(_originController.text);
      List<Location> destinationLocations = await locationFromAddress(_destinationController.text);

      if (originLocations.isNotEmpty && destinationLocations.isNotEmpty) {
        final origin = LatLng(originLocations[0].latitude, originLocations[0].longitude);
        final destination = LatLng(destinationLocations[0].latitude, destinationLocations[0].longitude);

        setState(() {
          _origin = Marker(
            markerId: const MarkerId('origin'),
            infoWindow: const InfoWindow(title: 'Origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
            position: origin,
          );
          _destination = Marker(
            markerId: const MarkerId('destination'),
            infoWindow: const InfoWindow(title: 'Destination'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: destination,
          );
        });

        final directions = await DirectionsRepository().getDirections(origin: origin, destination: destination);

        setState(() {
          _info = directions;
        });

        _googleMapController.animateCamera(
          CameraUpdate.newLatLngBounds(_info!.bounds, 100.0),
        );
      }
    } catch (e) {
      print('Erro ao obter direções: $e');
    }
  }

  void _initSpeechState() async {
    bool available = await _speech.initialize();
    if (!mounted) return;

    setState(() {
      _isListening = available;
    });
  }

  void _startListening() {
    _speech.listen(onResult: (result) {
      setState(() {
        _recognizedText = result.recognizedWords;
      });
    });
    setState(() {
      _isListening = true;
    });
  }
  
  void _clearText() {
    setState(() {
      _recognizedText = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 100, 0),
        title: const Text('Navegação'),
        actions: [
          TextButton(
            onPressed: _origin == null
                ? null
                : () => _googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: _origin!.position,
                          zoom: 14.5,
                          tilt: 50.0,
                        ),
                      ),
                    ),
            child: const Text(
              'Centralizar Origem',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: _destination == null
                ? null
                : () => _googleMapController.animateCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(
                          target: _destination!.position,
                          zoom: 14.5,
                          tilt: 50.0,
                        ),
                      ),
                    ),
            child: const Text(
              'Centralizar Destino',
              style: TextStyle(color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {
              _clearText();
              _startListening();
            },
            icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
            iconSize: 30,
            color: _isListening ? Colors.green : Colors.grey,
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin!,
              if (_destination != null) _destination!,
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: const PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info!.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
          ),
          if (_info != null)
            Positioned(
              top: 180.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Text(
                  '${_info!.totalDistance}, ${_info!.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.8,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          Positioned(
            top: 10.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              children: [
                Container(
                  height: 50.0,
                  width: double.infinity,
                  child: TextField(
                    controller: _originController,
                    decoration: InputDecoration(
                      hintText: 'Endereço de origem',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  child: TextField(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      hintText: 'Endereço de destino',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  height: 40.0,
                  width: 70.0,
                  child: FloatingActionButton(
                    onPressed: _getDirections,
                    child: Text('Iniciar'),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  _recognizedText,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.green,
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info!.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
