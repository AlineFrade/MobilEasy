import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:MobilEasy/pages/.env.dart';
import 'package:MobilEasy/pages/directions_model.dart';

class DirectionsRepository {
  static const String _baseUrl = 
      'https://maps.googleapis.com/maps/api/directions/json';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'mode':  'walking',
        'key': googleAPIKey,
      }
    );

    if(response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
