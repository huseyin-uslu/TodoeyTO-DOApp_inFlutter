import 'package:flutter/material.dart';

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
