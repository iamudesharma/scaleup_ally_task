import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormFieldHepler extends StatefulWidget {
  const FormFieldHepler({
    Key? key,
    required this.fieldKey,
    required this.hintText,
    this.isPassowrd = false,
    required this.controller,
    required this.textInputType,
    required this.validator,
  }) : super(key: key);

  final String fieldKey;
  final String hintText;
  final bool isPassowrd;
  final TextEditingController controller;
  final TextInputType textInputType;

  final FormFieldValidator<String> validator;

  @override
  _FormFieldHeplerState createState() => _FormFieldHeplerState();
}

class _FormFieldHeplerState extends State<FormFieldHepler> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      controller: widget.controller,
      keyboardType: widget.textInputType,
      name: widget.fieldKey,
      obscureText: widget.isPassowrd ? _obscureText : false,
      validator: widget.validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: widget.hintText,
        labelText: widget.hintText,
        suffixIcon: widget.isPassowrd
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
