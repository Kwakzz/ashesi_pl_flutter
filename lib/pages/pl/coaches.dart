import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/requests/coaches.dart';
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
        appBar: RegularAppBar(
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
            builder: (data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {

                  final coach = data[index];

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