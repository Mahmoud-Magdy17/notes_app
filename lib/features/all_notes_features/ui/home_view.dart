import 'package:flutter/material.dart';
import 'package:notes_app/features/all_notes_features/ui/widgets/custom_notes_builder.dart';

import '../../../core/widgets/custom_app_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          CustomAppBar(
            title: 'Text',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          Expanded(
            child: CustomNotesBuilder(),
          ),
        ],
      ),
    );
  }
}
