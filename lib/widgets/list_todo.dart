import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final String todo;

  TodoList({required this.todo});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 47,
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white24,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1.5,
            blurRadius: 20,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            isDone = !isDone;
          });
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 46),
        ),
        child: Row(
          children: [
            isDone
                ? Image.asset('assets/checklist.png')
                : Image.asset('assets/uncheck.png'),
            SizedBox(width: 10),
            Text(
              widget.todo,
              style: TextStyle(
                color: Colors.white,
                decoration: isDone ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
