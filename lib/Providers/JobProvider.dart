import 'dart:convert';

import 'package:autoassit/Controllers/ApiServices/variables.dart';
import 'package:autoassit/Models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:autoassit/Models/jobModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:shared_preferences/shared_preferences.dart';

class JobProvider with ChangeNotifier {

  Job _jobModel;
  List<Job> _jobList = [];

  // ignore: unnecessary_getters_setters
  Job get jobModel => _jobModel;

  List<Job> get listJobs => _jobList;

  // ignore: unnecessary_getters_setters
  set jobModel(Job value) {
    _jobModel = value;
  }

  

  Future<void> startGetJobs() async {
    _jobList = [];
    SharedPreferences initializeToken = await SharedPreferences.getInstance();

    final body = {
        "token": initializeToken.getString("authtoken")
      };

      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
      
     String _url = "${URLS.BASE_URL}/job/getOngoingJobs";
    return http.post(_url,body: jsonEncode(body),headers: requestHeaders).then((res) async {
      print("getting jobssssssssssssssss ");
      // print(res.body);
      var convertedData = convert.jsonDecode(res.body);
      // print(convertedData);
        List data = convertedData;

        _jobList = data.map((item) => Job.fromJson(item)).toList();


      notifyListeners();
    }).catchError((onError){
      print(onError);
    });
  }


}