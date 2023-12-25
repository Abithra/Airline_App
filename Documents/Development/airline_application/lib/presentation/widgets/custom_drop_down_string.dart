import 'package:flutter/material.dart';

class CustomDropDownString extends StatefulWidget {
  final List<String> items;
  final ValueChanged<String?> onItemSelected;
  final String labelText;
  final Icon? prefixIcon;

  const CustomDropDownString({
    Key? key,
    required this.items,
    required this.onItemSelected,
    required this.labelText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  CustomDropDownState createState() => CustomDropDownState();
}

class CustomDropDownState extends State<CustomDropDownString> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height:screenHeight/1/10 ,
      width: screenWidth*1/3,
      child: DropdownButtonFormField<String>(
        value: _selectedItem,
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item.toString()),
          );
        }).toList(),
        onChanged: (String? value) {
          setState(() {
            _selectedItem = value;
            widget.onItemSelected(value);
          });
        },
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon,
        ),
      ),
    );
  }
}
