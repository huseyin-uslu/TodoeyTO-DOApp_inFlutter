import 'dart:ffi';

import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen(Key? key) : super(key: key);
  static const textStyleConstantV1 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

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

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double percentager = width > height ? width : height;

    String text = "";
    String _convertedText = "";

    return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: const Color(0xFF757575),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: Padding(
            padding: EdgeInsets.all(percentager / 8),
            child: Column(
              children: [
                Text(
                  "Add Task",
                  style: textStyleConstantV1.copyWith(
                      fontSize: percentager / 30,
                      color: Colors.lightBlueAccent),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    onChanged: (string) {
                      text = string;
                    },
                  ),
                ),
                TextButton(
                    onPressed: () {
                      _convertedText = textSeperaterForResizing(
                          percentager: percentager, text: text);
                    },
                    child: Container(
                      width: double.infinity,
                      height: (percentager / 11.5),
                      child: Center(
                        child: Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: textStyleConstantV1.copyWith(
                              fontSize: percentager / 30),
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
