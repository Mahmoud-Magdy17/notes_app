import 'dart:ui';

import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final DateTime creationDate;
  @HiveField(3)
  final Color color;

  NoteModel({
    required this.title,
    required this.content,
    required this.creationDate,
    required this.color,
  });
}
