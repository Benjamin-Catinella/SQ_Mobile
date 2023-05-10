import 'package:flutter/material.dart';

class DefaultInput extends StatefulWidget {
  final String label;
  final bool? isPassword;
  final String? isMail;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const DefaultInput(
      {Key? key,
      required this.label,
      this.isPassword,
      this.isMail,
      this.controller,
      this.validator
      })
      : super(key: key);

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 12, color: Colors.red),
          textAlign: TextAlign.left,
        ),
        TextFormField(
          obscureText: widget.isPassword ?? false,
          controller: widget.controller,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: widget.label,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
