
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultInput extends StatefulWidget{
  final String label;
  var isPassword;
  var isMail;

  DefaultInput({Key? key, required this.label, this.isPassword, this.isMail}) : super(key: key);

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontSize: 20, color: Colors.red),
            textAlign: TextAlign.left,
          ),
          TextField(
            obscureText: widget.isPassword ?? false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.label,
            ),
          ),
        ],
      ),
    );
  }
}