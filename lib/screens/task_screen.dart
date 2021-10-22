import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_app/screens/add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool stateCheckBox = false;
  TextDecoration? lineThrough = TextDecoration.none;
  int _taskCount = 0;
  final List<String> _taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one, color: Colors.white),
        onPressed: () {
          setState(() {
            showModalBottomSheet(
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
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(30).copyWith(right: 0),
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
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
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

  List<ItemOfToDoList> getItemsOfToDoList() {
    List<ItemOfToDoList> list = [];
    for (int i = 0; i < _taskCount; i++) {
      list.add(ItemOfToDoList(
        text: _taskList[i],
      ));
    }
    return list;
  }
}

class ItemOfToDoList extends StatefulWidget {
  const ItemOfToDoList({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  _ItemOfToDoListState createState() => _ItemOfToDoListState();
}

class _ItemOfToDoListState extends State<ItemOfToDoList> {
  bool _isTicked = false;
  TextDecoration _textDecoration = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10).copyWith(bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.text,
              style: TextStyle(
                decoration: _textDecoration,
              )),
          Checkbox(
            value: _isTicked,
            onChanged: (bool? value) {
              setState(() {
                _isTicked = value!;
                _textDecoration == TextDecoration.none
                    ? _textDecoration = TextDecoration.lineThrough
                    : _textDecoration = TextDecoration.none;
              });
            },
          ),
        ],
      ),
    );
  }
}
