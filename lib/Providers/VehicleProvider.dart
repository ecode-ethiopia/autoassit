import 'package:autoassit/Models/vehicleModel.dart';
import 'package:flutter/material.dart';

class VehicleProvider with ChangeNotifier {

  Vehicle _vehicleModel;

  // ignore: unnecessary_getters_setters
  Vehicle get vehicleModel => _vehicleModel;

  // ignore: unnecessary_getters_setters
  set vehicleModel(Vehicle value) {
    _vehicleModel = value;
  }


}