import 'package:autoassit/Models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:autoassit/Models/jobModel.dart';

class JobProvider with ChangeNotifier {

  Job _jobModel;

  // ignore: unnecessary_getters_setters
  Job get jobModel => _jobModel;

  // ignore: unnecessary_getters_setters
  set jobModel(Job value) {
    _jobModel = value;
  }


}