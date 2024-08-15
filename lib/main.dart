import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/constants.dart';
import 'features/all_notes_features/ui/home_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'assets/fonts/Poppins/Poppins-Regular.ttf',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
