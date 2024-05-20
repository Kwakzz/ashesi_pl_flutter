// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text.dart';


class AppFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  bool obscureText = false;
  final FormFieldValidator <String>?  validator;
  final TextInputType? keyboardType;
  final bool enabled;
  Widget? suffixIcon;
  bool readOnly;
  

  AppFormField({
    super.key, 
    required this.controller,
    required this.hintText,
    this.labelText,
    this.validator,
    this.keyboardType,
    this.enabled = true,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.only(top: 6, bottom: 20),
        child: TextFormField (
          readOnly: readOnly,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.grey,
            ),
            labelText: labelText,
            labelStyle: GoogleFonts.montserrat(
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: Colors.black,
          ),
          validator: validator,
          enabled: enabled,
        ),
      )
    );
  }
}


class PasswordFormField extends StatefulWidget {

  final TextEditingController controller;
  final FormFieldValidator <String>?  validator;

  const PasswordFormField({
    super.key, 
    required this.controller,
    this.validator
  });

  @override
  PasswordFormFieldState createState() => PasswordFormFieldState();


}

class PasswordFormFieldState extends State <PasswordFormField> {

  bool obscureText = true;


  @override
  Widget build(BuildContext context) {
    return AppFormField(
      controller: widget.controller, 
      obscureText: obscureText,
      hintText: "Password must be at least 8 characters long",
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          color: Colors.black,
          size: 16,
        ),
      ),
    );
  }


}


class AppDropDownFormField extends StatelessWidget {

  final String? value;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? hintText;

  const AppDropDownFormField({
    super.key, 
    this.value,
    required this.items,
    required this.onChanged,
    this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.only(top: 6, bottom: 20),
        child: DropdownButtonFormField(
          value: value,
          items: items.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: RegularText(
                text: value,
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          
        ),
      )
    );
  }

}