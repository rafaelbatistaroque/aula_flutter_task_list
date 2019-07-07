import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:aula_flutter_task_list/pages/home.dart';

void main(){
  runApp(MaterialApp(
    title: "Task List",
    debugShowCheckedModeBanner: false,
    home: Home()
    )
  );
}