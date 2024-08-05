import 'dart:ui';

class NoteModel {
  final String title;
  final String content;
  final DateTime creationDate;
  final Color color;

  NoteModel({
    required this.title,
    required this.content,
    required this.creationDate,
    required this.color,
  });
}
