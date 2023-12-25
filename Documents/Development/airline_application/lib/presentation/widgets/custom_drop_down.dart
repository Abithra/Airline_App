import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<int> items;
  final ValueChanged<int?> onItemSelected;
  final String labelText;
  final Icon? prefixIcon;

  const CustomDropDown({
    Key? key,
    required this.items,
    required this.onItemSelected,
    required this.labelText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDown> {
  int? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<int>(
            value: _selectedItem,
            items: widget.items.map((int item) {
              return DropdownMenuItem<int>(
                value: item,
                child: Text(item.toString()), // Convert int to String
              );
            }).toList(),
            onChanged: (int? value) {
              setState(() {
                _selectedItem = value;
                widget.onItemSelected(value);
              });
            },
            decoration: InputDecoration(
              labelText: widget.labelText,
              prefixIcon: widget.prefixIcon,
            ),
          )
        ],
      ),
    );
  }
}
