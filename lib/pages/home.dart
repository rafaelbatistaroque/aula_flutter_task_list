import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _toDoList = [];
  final toDoCrtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  @override
  void initState() {
    super.initState();
    _readData().then((data){
      setState(() {
       _toDoList = json.decode(data); 
      });
    });
  }

  void _addTask() {
    setState(() {
      Map<String, dynamic> newTask = Map();

      newTask["title"] = toDoCrtl.text;
      print(toDoCrtl.text);
      toDoCrtl.text = "";
      newTask["completed"] = false;
      _toDoList.add(newTask);

      _saveData();
    });
  }
//Management file and directory
  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }
  Future<File> _saveData() async{
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }
  Future<String> _readData() async{
    try{
      final file = await _getFile();
      return file.readAsString();
    }catch (e){
      return null; 
    }
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
          itemCount: _toDoList.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(_toDoList[index]["title"]),
              value: _toDoList[index]["completed"],
              secondary: CircleAvatar(
                  child: Icon(_toDoList[index]["completed"]
                      ? Icons.check_circle
                      : Icons.error, size: 35,)),
              onChanged: (bool check) {
                setState(() {
                  _toDoList[index]["completed"] = check;
                  _saveData();
                });
              },
            );
          }),
    );
  }
}
