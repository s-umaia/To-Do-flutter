import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/DilogBox.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_application_1/utils/todoTile.dart';
import 'package:flutter_application_1/data/database.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box("mybox");

  ToDoDataBase db =ToDoDataBase();

  @override
  void initState() {
    if(_myBox.get("TODOLIST")== null){
      db.createIntialData();
    }else{
      db.loadData();
    }
    super.initState();
  }
  final _controller = TextEditingController();


  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }
void deleteTask (int index) {
  setState(() {
    db.toDoList.removeAt(index);
  });
    db.updateDataBase();
}
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 184, 232),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 158, 92, 178),
        title: Text('TO DO '),
        // elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
