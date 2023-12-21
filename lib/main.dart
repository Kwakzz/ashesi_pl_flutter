import 'package:flutter/material.dart';

import 'pages/nav_tabs/entry.dart';

// check if user is logged in
// if logged in, show entry page
// if not logged in, show login page


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Entry()
    )
  );
}
