import 'package:airline_application/model/flight.dart';
import 'package:flutter/material.dart';

class CustomCardView extends StatelessWidget {
  final Flight flight;

  CustomCardView({Key? key, required this.flight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              place(flight.startPlace, 'Departure'),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/emirates.png',
                  width: 150,
                  height: 150,
                ),
              ),
              place(flight.destinationPlace, 'Destination'),
            ],
          ),
          Row(
            children: [
              secondaryWidget('Flight No:', flight.flightNo),
              centerImagevIew('Duration: ${flight.duration}'),
              secondaryWidget(
                  'Ticket Price:', '₹${flight.ticketPrice.toString()}'),
            ],
          ),
          Divider(
            thickness: 0.3,
            color:
                Colors.grey, // Use a standard color or customize it as needed
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Total Price:'),
              Text('₹${flight.ticketPrice.toString()}'),
            ],
          )
        ],
      ),
    );
  }

  Widget place(String heading, String subHeading) {
    return Container(
      child: Column(
        children: [
          Text(
            heading,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Text(
            subHeading,
            style: TextStyle(fontSize: 10, color: Colors.grey),
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
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          Text(
            heading,
            style: TextStyle(fontSize: 12, color: Colors.black),
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
              width: 150,
              height: 150,
            ),
          ),
          Text(
            duration,
            style: TextStyle(fontSize: 8, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
