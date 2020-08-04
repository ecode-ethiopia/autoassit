import 'dart:convert';
import 'package:autoassit/Controllers/ApiServices/variables.dart';
import 'package:autoassit/Models/taskModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';

class TaskProvider with ChangeNotifier {

  Task _taskModel;
  List<Task> _taskList = [];

  // ignore: unnecessary_getters_setters
  Task get taskModel => _taskModel;

  List<Task> get listTasks => _taskList;

  // ignore: unnecessary_getters_setters
  set taskModel(Task value) {
    _taskModel = value;
  }

  Future<void> startGetTasks() async {
    _taskList = [];
    SharedPreferences initializeToken = await SharedPreferences.getInstance();

    final body = {
        "token": initializeToken.getString("authtoken")
      };

      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
      
     String _url = "${URLS.BASE_URL}/job/getTaskByJobId";
    return http.post(_url,body: jsonEncode(body),headers: requestHeaders).then((res) async {
      print("getting jobssssssssssssssss ");
      // print(res.body);
      var convertedData = convert.jsonDecode(res.body);
      // print(convertedData);
        List data = convertedData;

        _taskList = data.map((item) => Task.fromJson(item)).toList();


      notifyListeners();
    }).catchError((onError){
      print(onError);
    });
  }


}