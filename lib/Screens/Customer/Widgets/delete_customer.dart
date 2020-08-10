import 'dart:convert';
import 'package:autoassit/Controllers/ApiServices/variables.dart';
import 'package:autoassit/Models/customerModel.dart';
import 'package:autoassit/Providers/CustomerProvider.dart';
import 'package:autoassit/Providers/JobProvider.dart';
import 'package:autoassit/Screens/HomePage/home.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class DeleteCustomer extends StatefulWidget {
  DeleteCustomer({Key key}) : super(key: key);

  @override
  _DeleteCustomerState createState() => _DeleteCustomerState();
}

class _DeleteCustomerState extends State<DeleteCustomer> {

  Customer customerModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    customerModel = Provider.of<CustomerProvider>(context, listen: false).customerModel;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
    Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Text(
        "Delete ?",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
    ),
    Text("Are you sure you want to remove ${customerModel.fName} ?"),
    SizedBox(
      height: 15,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: MediaQuery.of(context).size.width / 10,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8E8CD8), Color(0xFF8E8CD8)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: Text(
                'No'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            startDeleteJCustomer();
          },
          child: Container(
            height: MediaQuery.of(context).size.width / 10,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8E8CD8), Color(0xFF8E8CD8)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: Text(
                'Yes'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    ),
    SizedBox(
      height: 15,
    ),
        ],
      );
  }

  Future<void> startDeleteJCustomer() async {
    final body = {
      "_id": customerModel.cusid
      };

    print(body);

    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    final response = await http.post('${URLS.BASE_URL}/job/deleteJob',
        body: jsonEncode(body), headers: requestHeaders);
    print("workingggggggggggg");
    var data = response.body;
    // print(body);
    print(json.decode(data));

    Map<String, dynamic> res_data = jsonDecode(data);

    try {
      if (response.statusCode == 200) {
        
        Provider.of<JobProvider>(context, listen: false).startGetJobs();
        Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage()),
                    (Route<dynamic> route) => false);
        // successDialog("Done", "Job Deleted !");
      } else {
        // Dialogs.errorDialog(context, "F", "Something went wrong !");
        Navigator.of(context).pop();
        print("job coudlnt create !");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> successDialog(String title, String dec) {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        animType: AnimType.TOPSLIDE,
        tittle: title,
        desc: dec,
        // btnCancelOnPress: () {},
        btnOkOnPress: () {
          Navigator.pop(context);
        }).show();
  }
}
