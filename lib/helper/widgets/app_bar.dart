import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'text.dart';


class RegularAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  @override
  Size get preferredSize => const Size.fromHeight(60);
  final String title;

  final BuildContext prevContext;

  const RegularAppBar(
    {
      super.key, 
      required this.prevContext,
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
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
          size: 15,
        ),
        onPressed: () {
          Navigator.of(prevContext).pop(); 
        },
        iconSize: 15,
      ),
      backgroundColor: Colors.white,
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