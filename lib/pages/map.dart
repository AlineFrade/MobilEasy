import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(-19.92548473052761, -43.99315289911171);

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  late GoogleMapController _googleMapController;
  // Marker _origin;
  // Marker _destination;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  static const _initialCameraPosition = CameraPosition(
    target: currentLocation,
    zoom: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 100, 0),
        title: const Text('Navegação'),
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _googleMapController = controller,
        markers: const {
          // if(_origin != null) _origin,
          // if(_destination != null) _destination,
        },
        //onLongPress: _addMarker(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.green,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
  
  _addMarker(LatLng pos) {

  }
}