import 'package:airline_application/presentation/results_screen.dart';
import 'package:airline_application/presentation/widgets/class_selection_row.dart';
import 'package:airline_application/presentation/widgets/custom_drop_down_string.dart';
import 'package:airline_application/presentation/widgets/date_time_picker.dart';
import 'package:airline_application/utils/r.dart';
import 'package:flutter/material.dart';

class FlightApp extends StatefulWidget {
  const FlightApp({Key? key}) : super(key: key);

  @override
  State<FlightApp> createState() => FlightAppState();
}

class FlightAppState extends State<FlightApp> {
  R r = R();
  DatePickerTextField datePickerTextField = const DatePickerTextField();
  ClassSelectionRow classSelectionRow = const ClassSelectionRow();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                bottom(),

              ],
            ),
          ),
        ),

    );
  }

  Widget header() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(45),
        bottomRight: Radius.circular(45),
      ),

      child: DefaultTabController(
        length: 2,
        child: Container(
          decoration: BoxDecoration(
            color: R.primaryColor,
            image: const DecorationImage(
              image: AssetImage('assets/images/earth_image.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Plan your",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "journey",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/landing.png',
                        width: 150,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: R.primaryColor, // You can adjust the color as needed
                child: const TabBar(
                  tabs: [
                    Tab(text: 'Round-Trip'),
                    Tab(text: 'One-way'),
                  ],
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottom() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                fromTo('FROM','', ['USA', 'IND','MLB'], 'SelectedValue1', (value) {}),
                Image.asset(
                  'assets/images/flight.png',
                  width: 50,
                  height: 50,
                ),
                fromTo('TO','MLB', ['USA', 'IND','MLB'], 'SelectedValue1', (value) {}),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [timeWidget("DEPART"), timeWidget("RETURN")],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Text("PASSENGERS AND LUGGAGE",
                      style: TextStyle(fontSize: 10, color: R.tertiaryColor)),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, right: 10),
                    child: CustomDropDownString(
                      items: const ['1', '2', '3', '4', '5', '6'],
                      onItemSelected: (String? value) {},
                      labelText: 'SEAT',
                      prefixIcon: const Icon(Icons.people),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 30, right: 10),
                    child: CustomDropDownString(
                      items: const ['1', '2', '3', '4', '5', '6', '7', '8', '9'],
                      onItemSelected: (String? value) {},
                      labelText: 'KGS',
                      prefixIcon: const Icon(Icons.monitor_weight),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 30, top: 20),
                  child: Text("CLASSES",
                      style: TextStyle(fontSize: 10, color: R.tertiaryColor)),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: classSelectionRow,
                ),
              ],
            ),
            SizedBox(
              width: screenWidth * 9 / 10,
              height: screenHeight * 1 / 15,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResultsScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(R.primaryColor),
                ),
                child: const Text(
                  'Search Flights',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget fromTo(String labelText,String mainText, List<String> dropdownItems, String selectedValue, void Function(String?) onChanged) {
    return  Expanded(child: Container(
      margin: const EdgeInsets.only(left: 20,right: 20),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          children: [
            CustomDropDownString(
              items: dropdownItems,
              onItemSelected: onChanged,
              labelText: labelText,
            ),
          ],
        )
      ],

    ),));
  }

  Widget timeWidget(String fromOrToText) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              fromOrToText,
              style: TextStyle(fontSize: 10, color: R.tertiaryColor),
            ),
            datePickerTextField,
          ],
        ),
      ),
    );
  }
}
