import 'package:flutter/material.dart';
import 'package:aula_flutter_task_list/domain/task.dart';

final toDoCrtl = TextEditingController();
Task taskClass = Task();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  void _addTask() {
    setState(() {
      Map<String, dynamic> newTask = Map();

      newTask["title"] = toDoCrtl.text;
      print(toDoCrtl.text);
      toDoCrtl.text = "";
      newTask["completed"] = false;
      taskClass.setList(newTask);
    });
  }

//Builder of AppBar
  Widget buildAppBar() {
    return AppBar(
      title: Text("Lista de tarefas"),
      backgroundColor: Colors.blueAccent,
      centerTitle: true,
    );
  }

//Builder of Body
  Widget buildBody() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 1, 10, 1),
          child: buildInputTask(),
        ),
        Container(
          child: buildListTask(),
        )
      ],
    );
  }

//Builder of InputBox and button Add of tasks
  Widget buildInputTask() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
          controller: toDoCrtl,
          decoration: InputDecoration(
              labelText: "Nova tarefa",
              labelStyle: TextStyle(color: Colors.blueAccent)),
        )),
        RaisedButton(
          color: Colors.blueAccent,
          child: Text("Adicionar"),
          textColor: Colors.white,
          onPressed: _addTask,
        )
      ],
    );
  }

//Builder of task list added
  Widget buildListTask() {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: taskClass.getList.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(taskClass.getList[index]["title"]),
              value: taskClass.getList[index]["completed"],
              secondary: CircleAvatar(
                  child: Icon(taskClass.getList[index]["completed"]
                      ? Icons.check_circle
                      : Icons.error, size: 35,)),
              onChanged: (bool check) {
                setState(() {
                  taskClass.checkList(index, check); 
                });
              },
            );
          }),
    );
  }
}
