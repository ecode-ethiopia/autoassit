import 'package:autoassit/Models/vehicleModel.dart';
import 'package:autoassit/Providers/VehicleProvider.dart';
import 'package:autoassit/Screens/Customer/Widgets/custom_modal_action_button.dart';
import 'package:autoassit/Screens/Customer/Widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      height: MediaQuery.of(context).size.height / 0.2,
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Center(
                child: Text(
              "Update Milage(ODO)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )),
            SizedBox(
              height: 10,
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
              onSave: () {
                // Dialogs.successDialog(
                //     context, "Done", "Details Updated Successfully !");
                 final body = {
                    "_id": vehicleModel.cusid,
                    "odo": milage.text
                  };

                  print(body);
              },
            )
          ],
        ),
      ),
    );
  }
}
