import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:aula_flutter_task_list/utils/layout.builders.dart';

class Home extends StatelessWidget {
  List _toDoList = ["Rafael","Batista"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  List get getList{
    return _toDoList;
  }
  set setList(String value){
    _toDoList.add(value);
  }
}