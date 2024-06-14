import 'package:flutter/material.dart';

class Inpit_Form extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final int? maxLength;
  const Inpit_Form({Key? key, this.controller, this.maxLength, this.hint})
      : super(key: key);
  @override
  State<Inpit_Form> createState() => _Inpit_FormState();
}

class _Inpit_FormState extends State<Inpit_Form> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: TextField(
        // readOnly: widget.model.enableReadOnly ?? false,
        controller: widget.controller,
        maxLength: widget.maxLength,
        style: TextStyle(),
        keyboardType: TextInputType.text,
        focusNode: FocusNode(),

        decoration: InputDecoration(
          hintText: widget.hint,
          counterText: '',
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: TextStyle(),
        ),
      ),
    );
  }
}
