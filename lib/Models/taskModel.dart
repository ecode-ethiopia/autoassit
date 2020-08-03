import 'package:autoassit/Models/productModel.dart';
import 'package:autoassit/Models/servicesModel.dart';
import 'package:flutter/foundation.dart';

class Task with ChangeNotifier{
  String jobId;
  String jobno;
  String date;
  String vNumber;
  String vName;
  String cusId;
  String cusName;
  String taskCount;
  String procerCharge;
  String labourCharge;
  String total;
  String status;
  List<Service> services;
  List<Product> products;  
  String garageId;
  String garageName;
  String supervisorName;

  Task(
      {this.jobId,
      this.jobno,
      this.date,
      this.vNumber,
      this.vName,
      this.cusId,
      this.cusName,
      this.taskCount,
      this.procerCharge,
      this.labourCharge,
      this.total,
      this.status,
      this.services,
      this.products,
      this.garageId,
      this.garageName,
      this.supervisorName
});

Task.fromJson(Map<String, dynamic> map)
      :  jobId= map["_id"],
      jobno= map["jobNo"],
      date= map["date"],
      vNumber= map["vnumber"],
      vName= map["vName"],
      cusId= map["cusId"],
      cusName= map["cusName"],
      taskCount= map["taskCount"],
      total= map["total"],
      procerCharge= map["procerCharge"],
      labourCharge= map["labourCharge"],
      status= map["status"],
      services = (map['services'] as List)
            ?.map((i) => Service.fromJson(i))
            ?.toList(),
      products = (map['products'] as List)
            ?.map((i) => Product.fromJson(i))
            ?.toList(),
      garageId= map["garageId"],
      garageName= map["garageName"],
      supervisorName= map["supervisorName"];

}