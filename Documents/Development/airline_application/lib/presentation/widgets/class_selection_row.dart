import 'package:airline_application/utils/r.dart';
import 'package:flutter/material.dart';

class ClassSelectionRow extends StatefulWidget {
  const ClassSelectionRow({Key? key}) : super(key: key);

  @override
  _ClassSelectionRowState createState() => _ClassSelectionRowState();
}

class _ClassSelectionRowState extends State<ClassSelectionRow> {
  String selectedClass = '';
  R r = R();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {
            selectClass('ECONOMY');
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return R.primaryColor2;
                }
                return Colors.grey; // Default text color
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return R.tertiaryColor;
                }
                return null; // defer to the defaults
              },
            ),
          ),
          child: Text(
            'ECONOMY',
            style: TextStyle(
              color: selectedClass == 'ECONOMY' ? R.primaryColor2 : null,
            ),
          ),
        ),
        Text('  |  ', style: TextStyle(color: R.tertiaryColor)), // Separator
        TextButton(
          onPressed: () {
            selectClass('BUSINESS');
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return R.primaryColor2;
                }
                return Colors.grey; // Default text color
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return R.tertiaryColor;
                }
                return null; // defer to the defaults
              },
            ),
          ),
          child: Text(
            'BUSINESS',
            style: TextStyle(
              color: selectedClass == 'BUSINESS' ? R.primaryColor2 : null,
            ),
          ),
        ),
        Text('   |   ', style: TextStyle(color: R.tertiaryColor)),
        TextButton(
          onPressed: () {
            selectClass('FIRST CLASS');
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return R.primaryColor2;
                }
                return Colors.grey; // Default text color
              },
            ),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return R.tertiaryColor;
                }
                return null; // defer to the defaults
              },
            ),
          ),
          child: Text(
            'FIRST CLASS',
            style: TextStyle(
              color: selectedClass == 'FIRST CLASS' ? R.primaryColor2 : null,
            ),
          ),
        ),
      ],
    );
  }

  void selectClass(String buttonClass) {
    setState(() {
      selectedClass = buttonClass;
    });
  }
}
