import 'package:ashesi_premier_league/helper/widgets/app_bar.dart';
import 'package:flutter/material.dart';


class Latest extends StatefulWidget {
  const Latest(
    {
      super.key
    }
  );

  @override
  LatestState createState() => LatestState();
}

class LatestState extends State<Latest> {

  // @override
  // void initState() {
  //   super.initState();
  //   initializeWidgetOptions();
  // }

  /// Checks if the user is logged in
  // Future<void> initializeWidgetOptions() async {

  //   SharedPreferences prefs = await SharedPreferences.getInstance();

    
  // }

  @override
  Widget build(BuildContext context) {
    
    return const Scaffold(
      appBar: APLAppBar(),
    );
  }
}