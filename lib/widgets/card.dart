// ignore_for_file: must_be_immutable
import 'package:ashesi_premier_league/pages/pl/result_details.dart';
import 'package:ashesi_premier_league/util/date_time.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class PlayerCard extends StatelessWidget {

  // ignore: prefer_const_constructors_in_immutables
  PlayerCard(
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


class TeamCard extends StatelessWidget {

  // ignore: prefer_const_constructors_in_immutables
  TeamCard(
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


class StatsTabCard extends StatelessWidget {

  StatsTabCard(
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
          height: 110,
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
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                  )
                ),
              ),

              ClipRect(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Image.network(
                    playerImageLink,
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
      )
    );
  }

}



class NextFixtureCard extends StatelessWidget {

  const NextFixtureCard(
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


class FixtureCard extends StatelessWidget{

  const FixtureCard(
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


class MatchResultCard extends StatelessWidget{

  const MatchResultCard(
    {
      super.key,
      required this.result
    }
  );


  final Map<String,dynamic> result;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
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

      ),
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ResultDetails(result: result)
          )
        );
      },
    );
  }

}



class JoinTheAPLCard extends StatelessWidget {


  const JoinTheAPLCard(
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
                  fontSize: 12,
                  height: -1.0,
                  fontWeight: FontWeight.w600
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50,),

              // JoinUsButton(onPressed: (){}),
            ]
          ),
        )
      ],
    );
  }

}


class HighestRankedPlayerCard extends StatelessWidget {

  const HighestRankedPlayerCard(
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
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Text(
                  player['last_name'],
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 20,
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


class HighestRankedTeamCard extends StatelessWidget {

  const HighestRankedTeamCard (
    {
      super.key,
      required this.team,
    }
  );

  final Map<String, dynamic> team;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 130,
      padding: const EdgeInsets.only(left:30, right:30),
      decoration:  BoxDecoration(
        image: DecorationImage(
          image:const AssetImage("assets/menu_rectangle.jpg"),
          colorFilter: ColorFilter.mode(Color(int.parse('0xFF${team['team_color']}')).withOpacity(1), BlendMode.hue),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [



          Expanded(
            child: Text(
              team['team_name'],
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w900
              )
            ),
          ),

          ClipRect(
            child: Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: Image.network(
                team['team_logo_url'],
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


class MatchResultCardForHomePage extends StatelessWidget {

  const MatchResultCardForHomePage(
    {
      super.key, 
      required this.result
    }
  );

  final Map<String,dynamic> result; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => ResultDetails(result: result)
          )
        );
      },
      child: Center(
        child: Container(
          height: 180,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(left:30, right:30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/menu_rectangle.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children:[

              const SizedBox(height: 10),

              Text(
                formatDateIntoWords(result['match_day']['date']).toString().toUpperCase(),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2
                )
              ),

              const SizedBox(height: 5),

              Text(
                "${result['competition']['name'].toString().toUpperCase()} (${result['competition']['gender']})",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400
                )
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  ClipRect(
                    child: Image.network(
                      result['home_team']['logo_url'],
                      width: MediaQuery.of(context).size.width*0.2,
                      height: 120,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Icon(Icons.error, color: Colors.white,);
                      }
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 0.5,
                        style: BorderStyle.solid
                      )
                    ),
                    child: Row (
                      children: [
                        Text(
                          result['home_team_score'].toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800
                          ),
                        ),

                        const SizedBox(width: 10,),

                        Text(
                          "FT",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600
                          )
                        ),

                        const SizedBox(width: 10,),

                        Text(
                          result['away_team_score'].toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800
                          ),
                        ),
                      ],
                    )
                  ),
                  

                  ClipRect(
                    child: Image.network(
                      result['away_team']['logo_url'],
                      width: MediaQuery.of(context).size.width*0.2,
                      height: 120,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Icon(Icons.error, color: Colors.white,);
                      }
                    ),
                  )
                  
                ],
              ),
            ]
          )
        )
      )
    );
  }

}



class MatchDetailsCard extends StatelessWidget {

  const MatchDetailsCard(
    {
      super.key, 
      required this.result
    }
  );

  final Map<String,dynamic> result; 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      color: const Color.fromARGB(255, 197, 50, 50),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left:30, right:30,),
      child: Column(
        children:[

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ClipRect(
                child: Image.network(
                  result['home_team']['logo_url'],
                  width: MediaQuery.of(context).size.width*0.2,
                  height: 120,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.error, color: Colors.black,);
                  }
                ),
              ),

              Container(
                padding: const EdgeInsets.fromLTRB(12, 7, 12, 7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Row (
                  children: [
                    Text(
                      result['home_team_score'].toString(),
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 197, 50, 50),
                        fontSize: 20,
                        fontWeight: FontWeight.w800
                      ),
                    ),

                    const SizedBox(width: 10,),

                    Text(
                      "FT",
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 197, 50, 50),
                        fontSize: 12,
                        fontWeight: FontWeight.w600
                      )
                    ),

                    const SizedBox(width: 10,),

                    Text(
                      result['away_team_score'].toString(),
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 197, 50, 50),
                        fontSize: 20,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),


              ),
              

              ClipRect(
                child: Image.network(
                  result['away_team']['logo_url'],
                  width: MediaQuery.of(context).size.width*0.2,
                  height: 120,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Icon(Icons.error, color: Colors.black,);
                  }
                ),
              )
              
            ],
          ),

          const SizedBox(height: 5),

          Text(
            "${result['competition']['name'].toString().toUpperCase()} (${result['competition']['gender']})",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 2
            )
          ),

          Text(
            "Kickoff at ${formatTime(result['match_time'])}",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            )
          ),

          Text(
            formatDateIntoWords(result['match_day']['date']),
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            )
          ),


          Text(
            "Referee: ${result['referee']['first_name']} ${result['referee']['last_name']}",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w400,
            )
          ),


        ]
      )
      
    
    );
  }

}


class MatchEventCard extends StatelessWidget {


  const MatchEventCard(
    {
      super.key,
      required this.event,
    }
  );

  final Map<String, dynamic> event;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 110,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(left:30, right:30),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/menu_rectangle.jpg"),
            colorFilter: ColorFilter.mode(Color(int.parse('0xFF${event['player']['team']['color']}')).withOpacity(1), BlendMode.hue),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                
                children:[

                  Text(
                    event['event_type'].toString().toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontStyle: FontStyle.italic,
                      color: 
                        (event['event_type'] == "Yellow Card") ? Colors.yellow : (event['event_type'] == "Red Card") ? Colors.red : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    "${event['player']['first_name']} ${event['player']['last_name'].toString().toUpperCase()}",
                    style: GoogleFonts.poppins(
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w800
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    "${event['minute'].toString()}'",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]
              ),
            ),

            ClipRect(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: Image.network(
                  event['player']['image'] ?? "https://www.footyrenders.com/render/cole-palmer-5.png",
                  width: 140,
                  height: 140,
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



