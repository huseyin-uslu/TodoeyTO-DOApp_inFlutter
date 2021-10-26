import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_app/components/item_of_todo_list.dart';
import 'package:todoey_app/screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool stateCheckBox = false;
  TextDecoration? lineThrough = TextDecoration.none;
  final List<String> _taskList = [];
  int _taskCount = 0;

  @override
  Widget build(BuildContext context) {
    _taskCount = 5;
    for (int i = 0; i < _taskCount; i++) {
      _taskList
          .add("HELLO GUYS , I'M HUSEYIN. YOU CAN CALL ME WHATEVER YOU WANT");
    }

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one, color: Colors.white),
        onPressed: () {
          setState(() {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const AddTaskScreen(null));

            // _taskCount++;
            // _taskList.add(textSeperaterForResizing(
            //     context: context, text: "Hello World I'dsadsadadsa"));
          });
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.all(30).copyWith(right: 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.list,
                            size: 30,
                            color: Colors.lightBlueAccent,
                          )),
                      const Text("Todoey App",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      Text(
                        _taskCount != 0
                            ? "$_taskCount tasks"
                            : "$_taskCount task",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: getItemsOfToDoList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String textSeperaterForResizing(
      {required double percentager, required String text}) {
    List<String> textList = [];

    int maxLength = percentager ~/ 12;

    String newText = "";
    int partCharacters = 0;
    int charactersLeft = text.length;

    if (text.length > maxLength) {
      while (charactersLeft > maxLength) {
        charactersLeft -= maxLength;

        if (charactersLeft > 5) {
          textList
              .add(text.substring(partCharacters, partCharacters + maxLength));
        } else {
          textList.add(text.substring(
              partCharacters, partCharacters + maxLength + charactersLeft));
        }
        partCharacters += maxLength;
      }

      for (int i = 0; i < textList.length; i++) {
        newText = newText + textList[i] + " -" + "\n";
      }

      return newText.substring(0, newText.length - 2);
    } else {
      return text;
    }
  }

  List<ItemOfToDoList> getItemsOfToDoList() {
    List<ItemOfToDoList> list = [];
    for (int i = 0; i < _taskCount; i++) {
      list.add(ItemOfToDoList(
        text: textSeperaterForResizing(percentager: 300, text: _taskList[i]),
      ));
    }
    return list;
  }
}
