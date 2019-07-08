import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class Task {
  final List _toDoList = [];
    
  List get getList{
    return _toDoList;
  }
  void setList(Map task) => _toDoList.add(task);

  void checkList(int index, bool check){
    _toDoList[index]["completed"] = check;
  }

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
}