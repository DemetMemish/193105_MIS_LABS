
import 'package:flutter/foundation.dart';

class ExamItem {
  final String id;
  final String titleOfExam;
  final DateTime dateOfExam;
  final DateTime timeOfExam;

  ExamItem({
    required this.id,
    required this.titleOfExam,
    required this.dateOfExam,
    required this.timeOfExam,

  });
}