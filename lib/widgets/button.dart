import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text.dart';


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


class JoinUsButton extends StatelessWidget {

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
            horizontal: 40,
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Register/Sign In",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 197, 50, 50),
          ),
        ),
      )
    );
  }

}


/// This is used as a button in the Home page. It is used to navigate to the different pages in the app.
class HomePageButton extends StatelessWidget {

  /// This is used as a button in the Home page. It is used to navigate to the different pages in the app.
  const HomePageButton(
    {
      super.key,
      required this.nextPage,
      required this.text,
    }
  );

  final Widget nextPage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => nextPage
          )
        );
      },
      child: HeaderText(
        text: text,
        color: const Color.fromARGB(255, 197, 50, 50),
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
    );
          
  }

}