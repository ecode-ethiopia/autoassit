import 'package:autoassit/Models/taskModel.dart';
import 'package:autoassit/Providers/taskProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeTaskStatus extends StatefulWidget {
  ChangeTaskStatus({Key key}) : super(key: key);

  @override
  _ChangeTaskStatusState createState() => _ChangeTaskStatusState();
}

class _ChangeTaskStatusState extends State<ChangeTaskStatus> {
  String status = "";
  TaskModel taskmodel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskmodel = Provider.of<TaskProvider>(context, listen: false).taskModel;
    initStatus();
  }

  initStatus(){
    setState(() {
      status = taskmodel.status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Padding(
                  padding: const EdgeInsets.only(top:20.0,bottom: 20),
                  child: Center(
                      child: Text(
                    "Update Task Status",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                  )),
                ),
        GestureDetector(
                onTap: () {
                  initFoodCats("on-Progress");
                  print("status is $status");
                },
                  child: taskStatus(
                    'On-Progress',
                   status== "on-Progress"? Icons.radio_button_checked:Icons.radio_button_unchecked,
                  ),
        ),
        GestureDetector(
                onTap: () {
                  initFoodCats("Completed");
                  print("status is $status");
                },
                  child: taskStatus(
            'Completed',
            status== "Completed"? Icons.radio_button_checked:Icons.radio_button_unchecked,
          ),
        ),
        GestureDetector(
                onTap: () {
                  initFoodCats("Aborted");
                  print("status is $status");
                },
                  child: taskStatus(
            'Aborted',
            status== "Aborted"? Icons.radio_button_checked:Icons.radio_button_unchecked,
          ),
        ),
        InkWell(
                    onTap: () async {
                         print(taskmodel.status);
                        //  if(serviceIndexes.isNotEmpty && prodIndexes.isNotEmpty){
                        //         final body = {
                        //     "jobId": jobModel.jobId,
                        //     "jobNo": jobModel.jobno,
                        //     "date": DateTime.now().toString(),
                        //     "vnumber": jobModel.vNumber,
                        //     "vName": jobModel.vName,
                        //     "cusId": jobModel.cusId,
                        //     "cusName": jobModel.cusName,
                        //     "procerCharge": procerCharge.toString(),
                        //     "labourCharge": "$labourCharge",
                        //     "total": "$fullTaskCharge",
                        //     "status": "on-Progress",
                        //     "services": serviceIndexes,
                        //     "products": prodIndexes,
                        //     "token": userModel.token
                        //   };

                        //   print(body);

                        //   Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

                        //   final response = await http.post('${URLS.BASE_URL}/task/newtask',
                        //       body: jsonEncode(body), headers: requestHeaders);
                        //   print("workingggggggggggg");
                        //   var data = response.body;
                        //   // print(body);
                        //   print(json.decode(data));

                        //   Map<String, dynamic> res_data = jsonDecode(data);

                        //   try {
                        //     if (response.statusCode == 200) {
                        //       // clearcontrollers();
                             
                        //       // jobModel = Job.fromJson(res_data);
                              
                        //       setState(() {
                        //       double totnow = double.parse(jobModel.total);
                        //       int taskCountnw = int.parse(jobModel.taskCount);
                        //       double procer = double.parse(jobModel.procerCharge);
                        //       double labour = double.parse(jobModel.labourCharge);
                        //       jobtot = totnow + fullTaskCharge;
                        //       taskCount = taskCountnw + 1;
                        //       jobProcerCharge = procer + procerCharge;
                        //       joblabourCharge = labour + labourCharge;
                        //       jobModel.taskCount = taskCount.toString();
                        //       jobModel.total = jobtot.toString();
                        //       jobModel.procerCharge = jobProcerCharge.toString();
                        //       jobModel.labourCharge = joblabourCharge.toString();
                        //       }); 
                        //       Provider.of<JobProvider>(context, listen: false).updateTaskCountAndJobtot("$taskCount", "$jobtot");
                        //       print("$taskCount----$jobtot");
                             
                        //       // Provider.of<JobProvider>(context, listen: false).startGetJobs();
                        //       Provider.of<TaskProvider>(context, listen: false).startGetTasks(jobModel.jobId);
                        //        successDialog("Done", "Task added succefully");
                   
                        //     } else {
                        //       // Dialogs.errorDialog(context, "F", "Something went wrong !");
                        //       print("job coudlnt create !");
                              
                        //     }
                        //   } catch (e) {
                        //     print(e);
                        //   }
                        //  }else{
                        //    print("empty");
                        //     Dialogs.errorDialog(context, "Error", "select services & products first !");
                        //  }
                    },
                    child: Container(
          height: MediaQuery.of(context).size.width / 10,
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8E8CD8), Color(0xFF8E8CD8)],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Center(
            child: Text(
              'Update Status'.toUpperCase(),
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),),
         SizedBox(
                  height: 15,
                ),
      ],
    );
  }

  initFoodCats(String val) {
   setState(() {
        status = val;
      });
  }

  Widget taskStatus(String task, IconData iconData) {
    return Padding(
           padding: const EdgeInsets.only(left:20.0,bottom: 24.0),
           child: Row(
             children:<Widget>[
               Icon(
                 iconData,
                 color: Color(0xFFef5350),
                 size: 20,
               ),
               SizedBox(
                 width: 28,
               ),
               Text(task,
                style: TextStyle(
                  fontSize:17,
                ),
               )
             ]
           ),
         );
  }

   Widget _taskCompleteList(String task) {
    return Container(
      foregroundDecoration: BoxDecoration(color: Color(0x60FDFDFD)),
      child: Padding(
             padding: const EdgeInsets.only(left:20.0,top: 20.0),
             child: Row(
               children:<Widget>[
                 Icon(
                   Icons.radio_button_checked,
                   color:Color(0xFFef5350),
                   size: 20,
                 ),
                 SizedBox(
                   width: 28,
                 ),
                 Text(task,
                  style: TextStyle(
                    fontSize:17,
                  ),
                 )
               ]
             ),
           ),
    );
  }
}