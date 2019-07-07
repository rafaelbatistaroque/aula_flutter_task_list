import 'package:flutter/material.dart';

Widget buildAppBar(){
  return AppBar(
    title: Text("Lista de tarefas"),
    backgroundColor: Colors.blueAccent,
    centerTitle: true,
  );
}
Widget buildBody(){
  return Column(
    children: <Widget>[
      Container(padding: EdgeInsets.fromLTRB(17, 1, 7, 1),
      child: buildInputTask(),
      )
    ],
  )
}
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
              child: Text("Adic."),
              textColor: Colors.white,
              onPressed: (){},
            )
          ],
        );
}