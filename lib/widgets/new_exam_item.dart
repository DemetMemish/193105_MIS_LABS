import 'dart:math';

import 'package:flutter/material.dart';

import 'package:lab3/model/ExamItem.dart';

import 'add_button.dart';

class NewExamItem extends StatefulWidget {
  final Function addItem;

  NewExamItem(this.addItem);
  @override
  State<StatefulWidget> createState() => _NewExamItemState();
}

class _NewExamItemState extends State<NewExamItem> {
  final _titleOfExamController = TextEditingController();
  final _dateOfExamController = TextEditingController();
  final _timeOfExamController = TextEditingController();

  late String titleOfExam;
  late DateTime dateOfExam;
  late DateTime timeOfExam;

  var _chars = 'Anastasija193049';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));


  void _submitData() {
    if (_dateOfExamController.text.isEmpty) {
      return;
    }

    final newTitleOfExam = _titleOfExamController.text;
    final newDateOfExam = DateTime.parse(_dateOfExamController.text);
    final newTimeOfExam = DateTime.parse(_timeOfExamController.text);

    if (newTitleOfExam.isEmpty) {
      return;
    }

    final newItem = ExamItem(id: getRandomString(10), titleOfExam: newTitleOfExam, dateOfExam: newDateOfExam, timeOfExam: newTimeOfExam );
    widget.addItem(newItem);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: _titleOfExamController,
            decoration: InputDecoration(labelText: "Title of Exam"),
             onChanged: (val) {
               titleOfExam = val;
             },
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            controller: _dateOfExamController,
            decoration: InputDecoration(labelText: "Date Of Exam"),
            keyboardType: TextInputType.datetime,
             onChanged: (val) {
               dateOfExam = DateTime.parse(val);
             }
          ),
          TextField(
            controller: _timeOfExamController,
            decoration: InputDecoration(labelText: "Time Of Exam"),
            keyboardType: TextInputType.datetime,
             onChanged: (val) {
               timeOfExam = DateTime.parse(val);
             },
            onSubmitted: (_) => _submitData(),
          ),
          AddButton("Add Exam", _submitData)
        ],
      ),
    );
  }
}
