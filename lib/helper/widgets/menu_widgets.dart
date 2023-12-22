// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'special_button.dart';

/// This is the default list style used in menus. It is used the APL tab.
class MenuListTile extends StatelessWidget {

  /// This is the default list style used in menus. It is used the APL tab.
  MenuListTile(
    {
      super.key, 
      required this.title,
      this.trailing,
      required this.onTap,
      required this.iconData
    }
  );

  final String title;
  Widget? trailing;
  final void Function()? onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right:10, left:10, top:5, bottom:5),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 197, 50, 50),
      ),
      
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: Icon(
          iconData,
          color: Colors.white,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 9,
        ),
        onTap: onTap,
      )
    );
  }

}


/// This list tile is specific to the More Tab. Items like Privacy Policy, Notifications and Contact Us use this list tile
class MoreListTile extends StatelessWidget {

  /// This list tile is specific to the More Tab. Items like Privacy Policy, Notifications and Contact Us use this list tile
  MoreListTile(
    {
      super.key, 
      required this.title,
      this.trailing,
      required this.onTap,
    }
  );

  final String title;
  Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 1.5,
            style: BorderStyle.solid
          )
        )
      ),
      
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 10,
        ),
        onTap: onTap,
      )
    );
  }

}


/// This list tile is used to display a player's name, team and image in the Players page.
class PlayerListTile extends StatelessWidget {

  /// This list tile is used to display a player's name, team and image in the Players page.
  const PlayerListTile(
    {
      super.key, 
      required this.player
    }
  );

  final Map<String,dynamic> player;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
            style: BorderStyle.solid
          )
        )
      ),
      
      child: ListTile(
        title: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: player['first_name'] ?? "No first name",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color:Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: " ",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color:Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: player['last_name'].toString().toUpperCase(),
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color:Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
        )
        ),
        subtitle: Text(
          player['team']['name'] ?? "No team",
          style: GoogleFonts.poppins(
            fontSize: 12,
            color:  Color(int.parse('0xFF${player['team']['color']}')),
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: ClipRect(
          child: Image.network(
            player['image'] ?? "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
            width: 50,
            height: 50,
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Icon(Icons.error, color: Colors.white,);
            }
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.black,
          size: 10,
        ),
        onTap: (){},
      )
    );
  }

}




/// This is a special navigation button. It contains text and the image of a player on a patterned background. 
class MenuRectangle extends StatelessWidget {

  /// This is a special navigation button. It contains text and the image of a player on a patterned background. 
  MenuRectangle(
    {
      super.key, 
      required this.title,
      this.trailing,
      required this.onTap,
      required this.playerImageLink
    }
  );

  final String title;
  Widget? trailing;
  final void Function()? onTap;
  final String playerImageLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left:30, right:30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/menu_rectangle.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900
                  )
                ),
              ),

              ClipRect(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Image.network(
                    playerImageLink,
                    width: 150,
                    height: 150,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                )
              )
            ],
          ),
        )
      )
    );
  }

}


/// This rectangle is used at the top of the APL tab page and displays the next APL fixture. 
class NextFixture extends StatelessWidget {

  /// This rectangle is used at the top of the APL tab page and displays the next APL fixture.
  const NextFixture(
    {
      super.key, 
      required this.onTap,
      required this.team1LogoLink,
      required this.team2LogoLink,
    }
  );

  final void Function()? onTap;
  final String team1LogoLink;
  final String team2LogoLink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Container(
          height: 150,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left:30, right:30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage("assets/menu_rectangle.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ClipRect(
                child: Image.network(
                  team1LogoLink,
                  width: MediaQuery.of(context).size.width*0.2,
                  height: 150,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.error, color: Colors.white,);
                  }
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "VS",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w900
                    )
                  ),
                  Text(
                    "Today",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    )
                  ),
                ],
              ),
              

              ClipRect(
                child: Image.network(
                  team2LogoLink,
                  width: MediaQuery.of(context).size.width*0.2,
                  height: 150,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.error, color: Colors.white,);
                  }
                ),
              )
              
            ],
          ),
        )
      )
    );
  }

}


/// This is used to display fixtures in the Fixtures page.
class Fixture extends StatelessWidget{

  /// This is used to display fixtures in the Fixtures page.
  const Fixture(
    {
      super.key,
      required this.team1LogoLink,
      required this.team1Name,
      required this.team2LogoLink,
      required this.team2Name,
    }
  );

  final String team1LogoLink;
  final String team2LogoLink;
  final String team1Name;
  final String team2Name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:[

          Text(
            "Premier League",
            style: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 13,
              fontWeight: FontWeight.w500
            )
          ),

          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                  style: BorderStyle.solid
                )
              )
            ),
            height: 100,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRect(
                  child: Image.network(
                    team1LogoLink,
                    width: MediaQuery.of(context).size.width*0.2,
                    height: 50,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                ),

                Text(
                  team1Name,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.2,
                      style: BorderStyle.solid
                    )
                  ),
                  child: Text(
                    "18:00",
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 197, 50, 50),
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  
                ),

                Text(
                  team2Name,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),
                

                ClipRect(
                  child: Image.network(
                    team2LogoLink,
                    width: MediaQuery.of(context).size.width*0.2,
                    height: 50,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                )
              ],
            )
          )
        ]
      )

    );
  }

}


/// This is used to display results in the Results page.
class Result extends StatelessWidget{

  /// This is used to display results in the Results page.
  const Result(
    {
      super.key,
      required this.team1LogoLink,
      required this.team1Name,
      required this.team2LogoLink,
      required this.team2Name,
    }
  );

  final String team1LogoLink;
  final String team2LogoLink;
  final String team1Name;
  final String team2Name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:[

          Text(
            "Premier League",
            style: GoogleFonts.poppins(
              color: Colors.black87,
              fontSize: 13,
              fontWeight: FontWeight.w500
            )
          ),


          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                  style: BorderStyle.solid
                )
              )
            ),
            height: 100,
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRect(
                  child: Image.network(
                    team1LogoLink,
                    width: MediaQuery.of(context).size.width*0.2,
                    height: 50,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                ),

                Text(
                  team1Name,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),

                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: '2',
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 197, 50, 50),
                            fontSize: 20, // Set the font size for '2'
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '   FT   ',
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 197, 50, 50),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: '1',
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 197, 50, 50),
                            fontSize: 20, // Set the font size for '1'
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Text(
                  team2Name,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),
                

                ClipRect(
                  child: Image.network(
                    team2LogoLink,
                    width: MediaQuery.of(context).size.width*0.2,
                    height: 50,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                )
              ],
            )
          )
        ]
      )

    );
  }

}


/// This rectangle contains a has a background image, and the following words:
/// JOIN THE APL. Get the latest updates on the best university football league in Ghana.
class JoinTheAPLRectangle extends StatelessWidget {

  /// This rectangle contains a has a background image, and the following words:
/// JOIN THE APL. Get the latest updates on the best university football league in Ghana.
  const JoinTheAPLRectangle(
    {
      super.key, 
    }
  );


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 350,
          width: MediaQuery.of(context).size.width,
          child: const Image(
            image: AssetImage("assets/kasanoma_girls.png"),
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Column(
            children: [

              Text(
                "APL\nJOIN THE",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 35,
                  letterSpacing: -1.0,
                  height: -1.0,
                  fontWeight: FontWeight.w900
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50,),

              Text(
                "best university football league in Ghana\nGet the latest updates on the",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 15,
                  height: -1.0,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50,),

              JoinUsButton(onPressed: (){}),
            ]
          ),
        )
      ],
    );
  }

}


/// This row contains the icons of all the social media platforms the APL is available on. Clicking an icon navigates you to the APL's profile page for that platform.
class SocialMediaIconsRow extends StatelessWidget {

  /// This row contains the icons of all the social media platforms the APL is available on. Clicking an icon navigates you to the APL's profile page for that platform.
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
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.snapchat,
            color: Colors.white,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.instagram,
            color: Colors.white,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 20,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.youtube,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }

}