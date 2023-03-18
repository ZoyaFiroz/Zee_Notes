import 'package:flutter/material.dart';

class TODO extends StatefulWidget {
  const TODO({super.key});

  @override
  State<TODO> createState() => _TODOState();
}

class _TODOState extends State<TODO> {
  final _textEditingController = TextEditingController();
  bool validated = true;
  String errtext = "";
  String todoEditing = "";
  List<Todo> todos = [
    Todo(title: 'Java'),
    Todo(title: 'Python'),
    Todo(title: 'Flutter'),
  ];
  void addTodo() {
    setState(() {
      todos.add(Todo(
        title: _textEditingController.text,
      ));

      _textEditingController.clear();
    });
  }

  void _deleteTodoItem(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  Widget mycard(String task) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            "$task",
            style: TextStyle(fontSize: 18.0, fontFamily: "Raleway"),
          ),
        ),
      ),
    );
  }

  void showalertdialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              title: Text("Add Task"),
              content: Container(
                height: 160,
                child: Column(children: [
                  TextField(
                    controller: _textEditingController,
                    autofocus: true,
                    style: TextStyle(fontSize: 20.0, fontFamily: "Raleway"),
                    decoration:
                        InputDecoration(errorText: validated ? null : errtext),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_textEditingController.text.isEmpty) {
                              setState(() {
                                errtext = "Can't Be Empty";
                                validated = false;
                              });
                            } else if (_textEditingController.text.length >
                                12) {
                              setState(() {
                                errtext = "To Many Characters";
                                validated = false;
                              });
                            } else {
                              addTodo();
                            }
                          },
                          child: Text("ADD"))
                    ],
                  ),
                ]),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO LIST"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: mycard(todos[index].title),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteTodoItem(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showalertdialog,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
      ),
    );
  }
}

class Todo {
  String title;

  Todo({
    required this.title,
  });
}
