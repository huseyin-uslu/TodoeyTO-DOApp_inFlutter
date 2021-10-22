import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen(Key? key) : super(key: key);
  static const textStyleConstantV1 = TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  String textSeperaterForResizing(
      {required double width, required String text}) {
    List<String> textList = [];

    int maxLength = width ~/ 12;

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
    double mixedSize = height * width;

    String? text;

    return Container(
        color: const Color(0xFF757575),
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30))),
          child: Padding(
            padding: EdgeInsets.all(width / 8),
            child: Column(
              children: [
                Text(
                  "Add Task",
                  style: textStyleConstantV1.copyWith(
                      fontSize: mixedSize / 7000,
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
                      //TODO: TEXT RESIZING
                    },
                    child: Container(
                      width: double.infinity,
                      height: (height / 11.5),
                      child: Center(
                        child: Text(
                          "Add",
                          textAlign: TextAlign.center,
                          style: textStyleConstantV1.copyWith(
                              fontSize: mixedSize / 10000),
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
