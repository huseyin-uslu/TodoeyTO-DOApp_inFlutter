import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool stateCheckBox = false;
  TextDecoration? lineThrough = TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one, color: Colors.white),
        onPressed: () {},
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
                  children: const <Widget>[
                    Flexible(
                      child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Expanded(
                              child: Icon(
                            Icons.list,
                            color: Colors.lightBlueAccent,
                          ))),
                    ),
                    Text("Todoey App",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                    Text(
                      "12 tasks",
                      style: TextStyle(color: Colors.white, fontSize: 20),
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
                    children: [
                      Row(children: [
                        Text(
                          "Do anything you want!",
                          style: TextStyle(decoration: lineThrough!),
                        ),
                        Checkbox(
                            value: stateCheckBox,
                            onChanged: (bo) {
                              setState(() {
                                stateCheckBox = bo!;
                                if (lineThrough == TextDecoration.lineThrough) {
                                  lineThrough = TextDecoration.none;
                                } else {
                                  lineThrough = TextDecoration.lineThrough;
                                }
                              });
                            })
                      ]),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
