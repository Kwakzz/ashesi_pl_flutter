// ignore_for_file: must_be_immutable
import 'package:ashesi_premier_league/pages/pl/view_coach.dart';
import 'package:ashesi_premier_league/pages/pl/view_news.dart';
import 'package:ashesi_premier_league/pages/pl/view_player.dart';
import 'package:ashesi_premier_league/pages/pl/view_team.dart';
import 'package:ashesi_premier_league/util/date_time.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class PLTabListTile extends StatelessWidget {

  PLTabListTile(
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
      padding: const EdgeInsets.only(right:10, left:10, top:0.5, bottom:0.5),
      margin: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 197, 50, 50),
      ),
      
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 11,
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
          size: 8,
        ),
        onTap: onTap,
      )
    );
  }

}


class ViewTeamListTile extends StatelessWidget {

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


class MoreListTile extends StatelessWidget {

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


class CoachListTile extends StatelessWidget {

  const CoachListTile(
    {
      super.key, 
      required this.coach
    }
  );

  final Map<String,dynamic> coach;

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
                  text: coach['first_name'] ?? "No first name",
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
                  text: coach['last_name'].toString().toUpperCase(),
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
            coach['team']['name'] ?? "No team",
            style: GoogleFonts.poppins(
              fontSize: 12,
              color:  Colors.black87,
              fontWeight: FontWeight.w400,
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
                builder: (context) => ViewCoach(coach: coach)
              )
            );
          },
        )
      )
    );
  }

}



class SquadListTile extends StatelessWidget {

  const SquadListTile (
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
            player['position']['name'] ?? "No position",
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


class PlayerListTile extends StatelessWidget {

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


class TeamListTile extends StatelessWidget {

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


class TeamStatsTile extends StatelessWidget {

  const TeamStatsTile(
    {
      super.key, 
      required this.stat,
      required this.title,
      required this.team
    }
  );

  final String stat;
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
          stat,
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


class PlayerDetailsTile extends StatelessWidget {

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


/// This displays a news item in the News page. It contains the news title, image, and tag.
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
          height: 100,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white
          ),
          child: Row(
            children: [
              Image.network(
                news['featured_image'],
                width: 100,
                height:100,
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