import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'web.dart';



class SocialMediaIconsRow extends StatelessWidget {

  const SocialMediaIconsRow(
    { 
      super.key, 
    }
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {

          },
          icon: const Icon(
            FontAwesomeIcons.snapchat,
            color: Colors.white,
            size: 18,
          ),
        ),

        IconButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => WebPage(
                  pageName: "Instagram",
                  url: "https://www.instagram.com/ashesi_football/",
                )
              )
            );
          },
          icon: const Icon(
            FontAwesomeIcons.instagram,
            color: Colors.white,
            size: 18,
          ),
        ),

        IconButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => WebPage(
                  pageName: "X",
                  url: "https://twitter.com/AshesiFootball",
                )
              )
            );
          },
          icon: const Icon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 18,
          ),
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => WebPage(
                  pageName: "YouTube",
                  url: "https://youtube.com/@ashesifootballassociation1182?feature=shared",
                )
              )
            );
          },
          icon: const Icon(
            FontAwesomeIcons.youtube,
            color: Colors.white,
            size: 18,
          ),
        ),
      ],
    );
  }

}