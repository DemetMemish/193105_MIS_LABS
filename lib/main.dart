import 'package:flutter/material.dart';
import 'model/ExamItem.dart';
import 'widgets/new_exam_item.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<ExamItem> _examItems = [
    ExamItem(id: "Subject1", titleOfExam: "Mobile App in Flutter",
        dateOfExam: DateTime.now(), timeOfExam: DateTime.now()),
    ExamItem(id: "Subject2", titleOfExam: "Operating Systems",
        dateOfExam: DateTime.now(), timeOfExam: DateTime.now()),
  ];

  void _addExamItemFunction(BuildContext ct) {
    showModalBottomSheet(
        context: ct,
        builder: (_) {
          return GestureDetector(onTap: () {}, child: NewExamItem(_addNewExamItemToList), behavior: HitTestBehavior.opaque);
        });
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e); // TODO: show dialog with error
    }
  }

  void _addNewExamItemToList(ExamItem examItem) {
    setState(() {
      _examItems.add(examItem);
    });
  }


  Widget _createBody() {
    return Center(
      child: _examItems.isEmpty
          ? Text("No elements")
          : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 10,
            ),
            child: ListTile(
              title: Text(_examItems[index].titleOfExam),
              subtitle: Text("${_examItems[index].dateOfExam} ${_examItems[index].timeOfExam}"),
            ),
          );
        },
        itemCount: _examItems.length,
      ),
    );
  }

  PreferredSizeWidget _createAppBar() {
    return AppBar(
      // The title text which will be shown on the action bar
        title: Text("List of Exams"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _addExamItemFunction(context),
          ),
          AddButton(
              'Logout',
              _signOut
          ),
        ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createBody(),
    );
  }

}
