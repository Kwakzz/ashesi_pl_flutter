import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:flutter/material.dart';


class Results extends StatefulWidget {
  const Results({ Key? key }) : super(key: key);

  @override
  ResultsState createState() => ResultsState();
}

class ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: RegularAppBar(
          title: 'Results',
          prevContext: context,
        ),
        body: ListView(
          children: const [
            SizedBox(height: 20),

            Result(
              team1LogoLink: "https://res.cloudinary.com/dvghxq3ba/image/upload/v1703097680/Team%20Logos/elite_logo_pmbtg5.png",
              team1Name: "ELI",
              team2LogoLink: "https://res.cloudinary.com/dvghxq3ba/image/upload/v1703097681/Team%20Logos/lu_logo_oailhh.png",
              team2Name: "LU",
            ),
          ],
        ),
       backgroundColor: Colors.white
      ),
    );
  }
}