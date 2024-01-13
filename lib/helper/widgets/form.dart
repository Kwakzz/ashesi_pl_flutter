// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text.dart';


/// Class for creating a form field.
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


/// Class for creating a form field for passwords.  
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


/// Class for creating a button for submitting forms.
class SubmitFormButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const SubmitFormButton({
    super.key, 
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 6),
        width: MediaQuery.of(context).size.width * 0.6,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color.fromRGBO(197, 50, 50, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      )
    );
  }
}


class AppDropDownButton extends StatelessWidget {

  final String? value;
  final List<String> items;
  final void Function(String?)? onChanged;
  final String? hintText;

  const AppDropDownButton({
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