import 'package:flutter/material.dart';
import 'package:aula_flutter_task_list/pages/home.dart';

//Builder of AppBar
Widget buildAppBar(){
  return AppBar(
    title: Text("Lista de tarefas"),
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
  );
}
//Builder of Body
Widget buildBody(){
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
Widget buildInputTask(){
  return Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                labelText: "Nova tarefa",
                labelStyle: TextStyle(color:  Colors.blueAccent)
                ),
              )
            ),
            RaisedButton(
              color: Colors.blueAccent,
              child: Text("Adicionar"),
              textColor: Colors.white,
              onPressed: (){},
            )
          ],
        );
}
//Builder of task list added
Widget buildListTask(){
  Home homePage = Home();
  
  return Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: 10),
            itemCount: homePage.getList.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(homePage.getList[index]),
              );
            },
          ),
        );
}