import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  List l1 = ["a", 'b', 'c', 'd', 'e'];
  String? Select;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Button",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: DropdownButton(
            items: l1
                .map((e) => DropdownMenuItem(child: Text("$e"), value: e))
                .toList(),
            value: Select,
            hint: Text("---Select---"),
            isExpanded: true,

            style: TextStyle(
              fontSize: 20
            ),
            onChanged: (value) {
              setState(() {
                Select = value as String;
              });
            }
            ),
      ),
      backgroundColor: Colors.red[100],
    );
  }
}
