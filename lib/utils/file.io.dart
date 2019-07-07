import 'dart:convert';
import 'dart:io';
import 'package:aula_flutter_task_list/pages/home.dart';
import 'package:path_provider/path_provider.dart';

Home homePage = new Home();

Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }
  Future<File> _saveData() async{
    String data = json.encode(homePage.getList);
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