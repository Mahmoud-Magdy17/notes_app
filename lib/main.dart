import 'package:flutter/material.dart';

import 'features/all_notes_features/ui/home_view.dart';

void main() {
  runApp(const NotesApp());
}
 
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'assets/fonts/Poppins/Poppins-Regular.ttf'
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
