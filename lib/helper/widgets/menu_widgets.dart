// ignore_for_file: must_be_immutable
import 'package:ashesi_premier_league/helper/functions/date_time.dart';
import 'package:ashesi_premier_league/helper/widgets/text.dart';
import 'package:ashesi_premier_league/pages/pl/view_news.dart';
import 'package:ashesi_premier_league/pages/pl/view_player.dart';
import 'package:ashesi_premier_league/pages/pl/view_team.dart';
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
      padding: const EdgeInsets.only(right:10, left:10, top:2.5, bottom:2.5),
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
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
            fontWeight: FontWeight.w400,
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

/// This list tile is used in the ViewTeam page.
class ViewTeamListTile extends StatelessWidget {

  /// This list tile is used in the ViewTeam page.
  ViewTeamListTile(
    {
      super.key, 
      required this.title,
      this.trailing,
      required this.onTap,
      required this.iconData,
      required this.team
    }
  );

  final String title;
  Widget? trailing;
  final void Function()? onTap;
  final IconData iconData;
  final Map<String,dynamic> team;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right:10, left:10, top:2.5, bottom:2.5),
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white
      ),
      
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Color(int.parse('0xFF${team['color']}')),
            fontWeight: FontWeight.w400,
          ),
        ),
        leading: Icon(
          iconData,
          color: Color(int.parse('0xFF${team['color']}')),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Color(int.parse('0xFF${team['color']}')),
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
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(bottom: 5, left: 30, right: 30),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 1,
            style: BorderStyle.solid
          )
        )
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
    return Center(
      child: Container(
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10, right: 10),
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
                    fontSize: 12,
                    color:Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const TextSpan(
                  text: " ",        
                ),
                TextSpan(
                  text: player['last_name'].toString().toUpperCase(),
                  style: GoogleFonts.poppins(
                    fontSize: 13,
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
              color:  Colors.black87,
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
            size: 9,
          ),
          onTap: (){
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => ViewPlayer(player: player)
              )
            );
          },
        )
      )
    );
  }

}


/// This list tile is used to display the team's name and image in the Teams page.
class TeamListTile extends StatelessWidget {

  /// This list tile is used to display the team's name and image in the Teams page.
  const TeamListTile(
    {
      super.key, 
      required this.team
    }
  );

  final Map<String,dynamic> team;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ViewTeam(team: team)
          )
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.2,
              style: BorderStyle.solid
            )
          )
        ),
        
        child: Column(
          children: [
            Image.network(
              team['logo_url'],
              width: 50,
              height: 50,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Icon(Icons.error, color: Colors.white,);
              }
            ),

            const SizedBox(height: 5,),

            Text(
              team['name'],
              style: GoogleFonts.poppins(
                fontSize: 12,
                color:  Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      )
    );
  }

}


/// This list tile is used to display player details like name, age.
class PlayerDetailsTile extends StatelessWidget {

  /// This list tile is used to display player details like name, age.
  const PlayerDetailsTile(
    {
      super.key, 
      required this.playerDetail,
      required this.title,
      required this.team
    }
  );

  final String playerDetail;
  final String title;
  final Map<String,dynamic> team;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5),
      color: Colors.white,
      child: ListTile(
        title: Text(
          title.toString().toUpperCase(),
          style: GoogleFonts.poppins(
            fontSize: 12,
            color:  Color(int.parse('0xFF${team['color']}')),
            fontWeight: FontWeight.w500,
          ),
        ),          
        trailing: Text(
          playerDetail,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color:  Color(int.parse('0xFF${team['color']}')),
            fontWeight: FontWeight.w400,
          ),
        ),
      )
    );
  }

}


/// This is rectangle is used on the ViewPlayer page. It contains the player's name and image.
class PlayerRectangle extends StatelessWidget {

  /// This is rectangle is used on the ViewPlayer page. It contains the player's name and image.
  // ignore: prefer_const_constructors_in_immutables
  PlayerRectangle(
    {
      super.key, 
      required this.player
    }
  );

  final Map<String,dynamic> player;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(right:30),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image:const AssetImage("assets/menu_rectangle.jpg"),
            colorFilter: ColorFilter.mode(Color(int.parse('0xFF${player['team']['color']}')).withOpacity(1), BlendMode.hue),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    player['first_name'],
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text(
                    player['last_name'],
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900
                    )
                  ),
                ],
              )
            ),

            ClipRect(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Image.network(
                  player['image'] ?? "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png",
                  width: 100,
                  height: 100,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.error, color: Colors.white,);
                  }
                ),
              )
            )
          ],
        ),
      )
  
    );
  }

}


/// This is rectangle is used on the ViewTeam page. It contains the club's name and logo.
class TeamRectangle extends StatelessWidget {

  /// This is rectangle is used on the ViewTeam page. It contains the club's name and logo.
  // ignore: prefer_const_constructors_in_immutables
  TeamRectangle(
    {
      super.key, 
      required this.team
    }
  );

  final Map<String,dynamic> team;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(left:30, right:30),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image:const AssetImage("assets/menu_rectangle.jpg"),
            colorFilter: ColorFilter.mode(Color(int.parse('0xFF${team['color']}')).withOpacity(1), BlendMode.hue),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Expanded(
              child: Text(
                team['name'],
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900
                )
              ),
            ),

            ClipRect(
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.network(
                  team['logo_url'],
                  width: 120,
                  height: 120,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.error, color: Colors.white,);
                  }
                ),
              )
            )
          ],
        ),
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
          height: 130,
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
                    fontSize: 25,
                    fontWeight: FontWeight.w900
                  )
                ),
              ),

              ClipRect(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Image.network(
                    playerImageLink,
                    width: 130,
                    height: 130,
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
                  height: 120,
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
                      fontSize: 25,
                      fontWeight: FontWeight.w900
                    )
                  ),
                  Text(
                    "Today",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    )
                  ),
                ],
              ),
              

              ClipRect(
                child: Image.network(
                  team2LogoLink,
                  width: MediaQuery.of(context).size.width*0.2,
                  height: 120,
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
      required this.fixture
    }
  );

  final Map<String,dynamic> fixture;

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Column(
        children:[

          const SizedBox(height: 15),

          Text(
            "${fixture['competition']['name']} (${fixture['competition']['gender']})",
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
            height: 70,

            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRect(
                  child: Image.network(
                    fixture['home_team']['logo_url'],
                    width: MediaQuery.of(context).size.width*0.2,
                    height: 40,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                ),

                Text(
                  fixture['home_team']['name_abbreviation'],
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
                    fixture['match_time'].substring(0, 5),
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 197, 50, 50),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    )
                  ),
                  
                ),

                Text(
                  fixture['away_team']['name_abbreviation'],
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),
                

                ClipRect(
                  child: Image.network(
                    fixture['away_team']['logo_url'],
                    width: MediaQuery.of(context).size.width*0.2,
                    height: 40,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                )
              ],
            )
          ),

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
      required this.result
    }
  );


  final Map<String,dynamic> result;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:[

          const SizedBox(height: 15),

          Text(
            "${result['competition']['name']} (${result['competition']['gender']})",
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
                    result['home_team']['logo_url'],
                    width: MediaQuery.of(context).size.width*0.2,
                    height: 40,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                ),

                Text(
                  result['home_team']['name_abbreviation'],
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
                          text: result['home_team_score'].toString(),
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 197, 50, 50),
                            fontSize: 15, // Set the font size for '2'
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: '   FT   ',
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 197, 50, 50),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: result['away_team_score'].toString(),
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 197, 50, 50),
                            fontSize: 15, // Set the font size for '1'
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


                Text(
                  result['away_team']['name_abbreviation'],
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),
                ),
                

                ClipRect(
                  child: Image.network(
                    result['away_team']['logo_url'],
                    width: MediaQuery.of(context).size.width*0.2,
                    height: 40,
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

/// This widget is used to customize the feature news item in the News page.
/// It contains the news title, image, and tag.
class FeatureNewsItem extends StatelessWidget{

  const FeatureNewsItem(
    {
      super.key,
      required this.news
    }
  );

  final Map<String,dynamic> news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ViewNews(news: news)
          )
        );
      },
      child: Container(
        height: 300,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: [
            Image.network(
              news['featured_image'],
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Icon(Icons.error, color: Colors.white,);
              }
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    news['title'],
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Text(
                    news['tag']['name'],
                    style: GoogleFonts.poppins(
                      color: const Color.fromARGB(255, 197, 50, 50),
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
      
    );
  }

}

class NewsListTile extends StatelessWidget{

  const NewsListTile(
    {
      super.key,
      required this.news
    }
  );

  final Map<String,dynamic> news;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:GestureDetector(
        onTap: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => ViewNews(news: news)
            )
          );
        },
        child: Container(
          height: 110,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: Row(
            children: [
              Image.network(
                news['featured_image'],
                width: 100,
                height:110,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Icon(Icons.error, color: Colors.white,);
                }
              ),
              

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        news['title'],
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700
                        ),
                      ),

                      const SizedBox(height: 7.5,),

                      // aligns the date to the left
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${formatDateIntoWords(news['pub_date'])} - ${news['tag']['name']}",
                          style: GoogleFonts.poppins(
                            color:  Colors.black54,
                            fontSize: 10,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                )
              )
            ],
          )
        )
      )
    );
  }

}


class NewsItem extends StatelessWidget {

  const NewsItem(
    {
      super.key,
      required this.news
    }
  );

  final Map<String,dynamic> news;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network(
          news['featured_image'],
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            news['title'],
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 10),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "${news['tag']['name']} | ${formatDateIntoWords(news['pub_date'])}",
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
        ),

        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            news['text'],
            style: GoogleFonts.poppins(
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 20),
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
            size: 18,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.instagram,
            color: Colors.white,
            size: 18,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
            size: 18,
          ),
        ),
        IconButton(
          onPressed: () {},
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



/// This is used to display player rankings in the Stats page.
class PlayerRankings extends StatelessWidget {

  /// This is used to display player rankings in the Stats page.
  const PlayerRankings(
    {
      super.key,
      required this.players,
      required this.stat
    }
  );

  final List<Map<String, dynamic>> players;
  final String stat;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: <DataColumn>[

        // pos
        const DataColumn(
          label: HeaderText(
            text: 'Pos',
            color: Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

        // name
        const DataColumn(
          label: HeaderText(
            text: 'Name',
            color: Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

        // team
        const DataColumn(
          label: HeaderText(
            text: 'Team',
            color: Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),

            // goals      
        DataColumn(
          label: HeaderText(
            text: stat,
            color: const Color.fromARGB(255, 53, 52, 52),
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],

      rows: players.map((player) => DataRow(
          cells: [

            // pos
            DataCell(
              HeaderText(
                // index + 1 because index starts at 0
                text: (players.indexOf(player) + 1).toString(),
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),

            // name
            DataCell(
              HeaderText(
                // pick only the first of the player's first names
                text:'${player['first_name'].toString().split(' ')[0]} ${player['last_name']}',
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),

            // team
            DataCell(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    player['team_logo_url'],
                    width: 20,
                    height: 20,
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return const Icon(Icons.error, color: Colors.white,);
                    }
                  ),
                  HeaderText(
                    text: player['team_name_abbreviation'].toString(),
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ]
              )
            ),

            // goals
            DataCell(
              HeaderText(
                text: player['no_of_goals'].toString(),
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ).toList(),
    );
  }
  
}

class HighestRankedPlayer extends StatelessWidget {

  const HighestRankedPlayer(
    {
      super.key,
      required this.player,
    }
  );

  final Map<String, dynamic> player;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.only(left:30, right:30),
      decoration:  BoxDecoration(
        image: DecorationImage(
          image:const AssetImage("assets/menu_rectangle.jpg"),
          colorFilter: ColorFilter.mode(Color(int.parse('0xFF${player['team_color']}')).withOpacity(1), BlendMode.hue),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [



          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  player['first_name'],
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Text(
                  player['last_name'],
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900
                  )
                ),
              ],
            )
          ),

          ClipRect(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Image.network(
                player['image'] ?? "https://www.footyrenders.com/render/cole-palmer-5.png",
                width: 130,
                height: 130,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Icon(Icons.error, color: Colors.white,);
                }
              ),
            )
          )
        ],
      ),
    );
  }

}