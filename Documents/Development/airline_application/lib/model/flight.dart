import 'dart:convert';
import 'package:flutter/services.dart';

class Flight {
  final String startPlace;
  final String destinationPlace;
  final String dateOfTheFlight;
  final String flightNo;
  final String duration;
  final double ticketPrice;

  Flight({
    required this.startPlace,
    required this.destinationPlace,
    required this.dateOfTheFlight,
    required this.flightNo,
    required this.duration,
    required this.ticketPrice,
  });

  factory Flight.fromJson(Map<String, dynamic> json) {
    return Flight(
      startPlace: json['startPlace'],
      destinationPlace: json['destinationPlace'],
      dateOfTheFlight: json['dateOfTheFlight'],
      flightNo: json['flightNo'],
      duration: json['duration'],
      ticketPrice: json['ticketPrice'].toDouble(),
    );
  }
}

class FlightData {
  final List<Flight> flights;

  FlightData({required this.flights});

  factory FlightData.fromJson(List<dynamic> json) {
    List<Flight> flights =
        json.map((flight) => Flight.fromJson(flight)).toList();
    return FlightData(flights: flights);
  }
}

class FlightDataService {
  static Future<FlightData> loadFlights() async {
    try {
      String jsonString = await rootBundle.loadString('assets/flight_details.json');
      print('Loaded JSON: $jsonString');
      List<dynamic> jsonList = json.decode(jsonString);
      return FlightData.fromJson(jsonList);
    } catch (error) {
      print('Error loading flights: $error');
      throw error;
    }
  }
}

