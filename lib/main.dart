import 'package:flutter/material.dart';
import 'feed_screen.dart';

void main() {
  runApp(RoyalClipsApp());
}

class RoyalClipsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: FeedScreen(),
    );
  }
}