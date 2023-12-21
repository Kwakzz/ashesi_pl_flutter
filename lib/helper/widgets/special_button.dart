import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


/// This button is displayed in on the "More" tab's page when a user isn't logged in. It contains the words, "Register/Sign In". It navigates the user to the Register/Sign In page.
class JoinUsButton extends StatelessWidget {

  /// This button is displayed in on the "More" tab's page when a user isn't logged in. It contains the words, "Register/Sign In". It navigates the user to the Register/Sign In page.
  const JoinUsButton({
    super.key,
    required this.onPressed,
  });

  final Function () onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 70,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Register/Sign In",
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 197, 50, 50),
          ),
        ),
      )
    );
  }

}