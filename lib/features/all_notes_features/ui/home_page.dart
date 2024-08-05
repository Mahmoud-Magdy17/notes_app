import 'package:flutter/material.dart';
import 'package:notes_app/features/all_notes_features/ui/widgets/custom_notes_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          "Notes",
        ),
      ),
      body: CustomNotesBuilder(),
    );
  }
}
