import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text.dart';


// ignore: must_be_immutable
class RegularAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String title;
  Color color;

  final BuildContext prevContext;

  RegularAppBar(
    {
      super.key, 
      required this.prevContext,
      required this.title,
      this.color = const Color.fromARGB(255, 197, 50, 50),
    }
  );

  

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: HeaderText(
        text: title,
        color: Colors.white,
      ),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 15,
        ),
        onPressed: () {
          Navigator.of(prevContext).pop(); 
        },
        iconSize: 15,
      ),
      backgroundColor: color
    );
  }
}

class RegularAppBarNoBack extends StatelessWidget implements PreferredSizeWidget {
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String title;

  const RegularAppBarNoBack(
    {
      super.key, 
      required this.title,
    }
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: HeaderText(
        text: title,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }
}


class APLAppBar extends StatelessWidget implements PreferredSizeWidget {
  const APLAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 80,
      title: Stack(
        children: [
          Image.asset(
            "assets/menu_rectangle.jpg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 60.0, // Adjust the top position as needed
            left: 36.0, // Adjust the left position as needed
            child: Text(
              'Ashesi Premier League',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900
              )
            ),
          ),
        ],
      ),
    );
  }
}