import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_todo_app/model/todo_model.dart';
import 'package:simple_todo_app/widgets/list_todo.dart';

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<TodoModel> todos = [];
  TextEditingController todoController = TextEditingController(text: '');

  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            title: Text('add new ToDo'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    todos.add(
                      TodoModel(
                        todo: todoController.text,
                        isDone: false,
                      ),
                    );
                    todoController.text = '';
                  });
                },
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ],
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                      hintText: 'Write a todo',
                      labelText: 'new todo',
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: 51,
          left: 37,
          right: 46,
          bottom: 58,
        ),
        child: Text(
          'What are you here to Acomplish today?',
          style: GoogleFonts.bebasNeue(
            fontSize: 48,
            color: Colors.white,
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: todos
              .map(
                (item) => TodoList(
                  todo: item.todo,
                ),
              )
              .toList(),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightBlue, Colors.purpleAccent],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showFormDialog(context);
          },
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              header(),
              content(),
            ],
          ),
        ),
      ),
    );
  }
}
