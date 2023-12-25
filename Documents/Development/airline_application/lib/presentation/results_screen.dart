import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:airline_application/model/flight.dart';

import '../utils/r.dart';
import 'landing_screen.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  ResultsScreenState createState() => ResultsScreenState();
}

class ResultsScreenState extends State<ResultsScreen> {
  R r =R();
  Future<List<Flight>> _loadFlights() async {
    try {
      FlightData flightData = await FlightDataService.loadFlights();
      return flightData.flights;
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FlightApp()),
            );
          },
          icon: const Icon(Icons.arrow_back),



        ),
        title: const Text("Flights"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20,right: 20,bottom: 30),
            child:  Text(
              '5 flights are available from Melbourne to Colombo',
              style: TextStyle(fontSize: 18.0, color: R.tertiaryColor),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: R.primaryColor,
                borderRadius: BorderRadius.only(
              topLeft:   Radius.circular(40),topRight:   Radius.circular(40),
                ),
              ),
              child: FutureBuilder<List<Flight>>(
                future: _loadFlights(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error loading flights: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No flights available'),
                    );
                  } else {
                    List<Flight> flights = snapshot.data!;
                    return ListView.builder(
                      itemCount: flights.length,
                      itemBuilder: (context, index) {
                        Flight flight = flights[index];
                        return CustomCardView(
                          startPlace: flight.startPlace,
                          destinationPlace: flight.destinationPlace,
                          flightNo: flight.flightNo,
                          duration: flight.duration,
                          ticketPrice: flight.ticketPrice,
                        );
                      },
                    );
                  }
                },
              ),
            )
          ),
        ],
      ),
    );
  }
}


class CustomCardView extends StatelessWidget {
  final String startPlace;
  final String destinationPlace;
  final String flightNo;
  final String duration;
  final double ticketPrice;

  CustomCardView({
    Key? key,
    required this.startPlace,
    required this.destinationPlace,
    required this.flightNo,
    required this.duration,
    required this.ticketPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5,left: 20,right: 20,bottom: 5),
      width: MediaQuery.of(context).size.width*3/5,
      height: MediaQuery.of(context).size.height*1/3,
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 30,right: 30,top: 20),
            child:   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                place(startPlace, 'Departure'),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/emirates.png',
                    // width: 100,
                    // height: 100,
                  ),
                ),
                place(destinationPlace, 'Destination'),
              ],
            ),
          ),
            Container(
              margin: const EdgeInsets.only(left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  secondaryWidget('Flight No:', flightNo),
                  centerImagevIew('Duration: $duration'),
                  secondaryWidget('Ticket Price:', '₹${ticketPrice.toString()}'),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              color: R.tertiaryColor,
            ),
            Container(
              margin: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Total Price:'),
                  Text('₹${ticketPrice.toString()}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget place(String heading, String subHeading) {
    return Container(
      child: Column(
        children: [
          Text(
            heading,
            style: const TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            subHeading,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget secondaryWidget(String heading, String subHeading) {
    return Container(
      child: Column(
        children: [
          Text(
            subHeading,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            heading,
            style: const TextStyle(fontSize: 12, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget centerImagevIew(String duration) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/fly.png',
              width: 130,
              height: 130,
            ),
          ),
          Text(
            duration,
            style: const TextStyle(fontSize: 8, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
