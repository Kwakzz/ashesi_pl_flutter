import 'package:ashesi_premier_league/controller/coaches.dart';
import 'package:ashesi_premier_league/widgets/app_bar.dart';
import 'package:ashesi_premier_league/widgets/future_builder.dart';
import 'package:ashesi_premier_league/widgets/list_tile.dart';
import 'package:flutter/material.dart';


class Coaches extends StatefulWidget {

  const Coaches({
    super.key
  });

  @override
  CoachesState createState() => CoachesState();
}

class CoachesState extends State<Coaches> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBarWithPrevButton(
          title: 'Coaches',
          prevContext: context,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              getCoaches();
            });
          },
          child: AppFutureBuilder(
            future: getCoaches(),
            builder: (coaches) {
              return ListView.builder(
                itemCount: coaches.length,
                itemBuilder: (context, index) {

                  final coach = coaches[index];

                  return CoachListTile(coach: coach);
                },
              ); 
            },
            errorText: "coaches",
            reloadPageFunction: () {
              setState(() {
                getCoaches();
              });
            },
          )
        ),
       backgroundColor: Colors.white
      ),
    );
  }
}