import 'package:autoassit/Controllers/ApiServices/variables.dart';
import 'package:autoassit/Models/vehicleModel.dart';
import 'package:autoassit/Providers/VehicleProvider.dart';
import 'package:autoassit/Screens/Customer/Widgets/custom_modal_action_button.dart';
import 'package:autoassit/Screens/Customer/Widgets/custom_textfield.dart';
import 'package:autoassit/Utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateMilage extends StatefulWidget {
  UpdateMilage({Key key}) : super(key: key);

  @override
  _UpdateMilageState createState() => _UpdateMilageState();
}

class _UpdateMilageState extends State<UpdateMilage> {
  final milage = TextEditingController();

  Vehicle vehicleModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicleModel =
        Provider.of<VehicleProvider>(context, listen: false).vehicleModel;
    assignValues();
  }

  assignValues() {
    milage.text = vehicleModel.odo;
    print("Values set");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Update Milage(ODO)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
                labelText: 'Update Milage (ODO)', controller: milage),
            SizedBox(
              height: 10,
            ),
            CustomModalActionButton(
              onClose: () {
                Navigator.of(context).pop();
              },
              onSave: () async {
               
                await startUpdateODO(context);
              },
            )
          ],
        ),
      ),
    );
  }

  Future startUpdateODO(BuildContext context) async {
    if (milage.text != vehicleModel.odo) {
      final body = {"_id": vehicleModel.vID, "odo": milage.text};
    
      Map<String, String> requestHeaders = {
        'Content-Type': 'application/json'
      };
    
      final response = await http.post(
          '${URLS.BASE_URL}/vehicle/updateODO',
          body: jsonEncode(body),
          headers: requestHeaders);
      print("workingggggggggggg");
      var data = response.body;
      // print(body);
      print(json.decode(data));
    
      Map<String, dynamic> res_data = jsonDecode(data);
      try {
        if (response.statusCode == 200) {
          setState(() {
            vehicleModel.odo = milage.text;
          });
          Provider.of<VehicleProvider>(context, listen: false)
              .updateODO("${milage.text}");
    
          print("${vehicleModel.odo}}");
    
          Dialogs.successDialog(
              context, "Done", "ODO Updated succefully");
        } else {
          // Dialogs.errorDialog(context, "F", "Something went wrong !");
          print("ODO coudlnt update !");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("doesnt hve to update");
    
      Navigator.of(context).pop();
    }
  }
}
