import 'package:ashesi_premier_league/helper/functions/date_time.dart';
import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:ashesi_premier_league/helper/widgets/future_builder.dart';
import 'package:ashesi_premier_league/helper/widgets/menu_widgets.dart';
import 'package:ashesi_premier_league/helper/widgets/text.dart';
import 'package:ashesi_premier_league/requests/season.dart';
import 'package:flutter/material.dart';


class Fixtures extends StatefulWidget {
  const Fixtures({ Key? key }) : super(key: key);

  @override
  FixturesState createState() => FixturesState();
}

class FixturesState extends State<Fixtures> {

  Future<List<Map<String,dynamic>>> _getFixtures () async {
    return await getSeasonFixtures();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: RegularAppBar(
          title: 'Fixtures',
          prevContext: context,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _getFixtures();
            });
          },
          child: AppFutureBuilder(
            future: _getFixtures(),
            builder: (data) {
              return ListView.separated(

                itemCount: data.length,
                separatorBuilder: (context, index) => const SizedBox(),
                itemBuilder: (context, index) {
                  final fixture = data[index];

                  // Check if it's the first fixture or the date has changed
                  if (index == 0 || fixture['match_day']['date'] != data[index - 1]['match_day']['date']) {
                    // Display the date as a section header
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const SizedBox(height: 20),

                        Center(
                          child: HeaderText(
                            // Format the date as needed
                            text: "${formatDateIntoWords(fixture['match_day']['date']).toString().toUpperCase()} - MATCH DAY ${fixture['match_day']['number']}",
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Fixture(fixture: fixture),
                      ],
                    );
                  } else {
                    // Just display the fixture
                    return Fixture(fixture: fixture);
                  }
                },
              );

            },
            couldNotLoadText: "fixtures",
            reloadPageFunction: () {
              setState(() {
                _getFixtures();
              });
            },
          ),
        ),
       backgroundColor: Colors.white
      ),
    );
  }
}