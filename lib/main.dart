import 'package:flutter/material.dart';

import 'pages/nav_tabs/entry.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Entry()
    )
  );
}
