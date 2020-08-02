import 'package:autoassit/Controllers/ApiServices/Job_services/get_jobs_service.dart';
import 'package:autoassit/Models/jobModel.dart';
import 'package:autoassit/Screens/HomePage/homeWidgets/progress_indicator.dart';
import 'package:autoassit/Screens/Jobs/showJob.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';

class ProjectCardTile extends StatefulWidget {
  @override
  _ProjectCardTileState createState() => _ProjectCardTileState();
}

class _ProjectCardTileState extends State<ProjectCardTile> {
  // final List title = [
  //   "Honda - civic",
  //   "Bmw c200",
  //   "Bajaj Threewheeler",
  // ];

  List<Job> job = List();

  @override
  void initState() {
    callAPI();
    super.initState();
  }

  callAPI() {
    GetJobsController.getJobs().then((jobsFromServer) {
      setState(() {
        job = jobsFromServer;
      });
    });
  }

  final List colors = [Colors.blue, Colors.black, Colors.green];

  @override
  Widget build(BuildContext context) {
    var rng = new math.Random.secure();
    return ListView.builder(
        shrinkWrap: true,
        itemCount: job.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 1.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            child: GestureDetector(
              onTap: () async {
                final jobid = job[index].jobId;
                SharedPreferences jobs = await SharedPreferences.getInstance();
                jobs.setString("jobid", jobid);
                print("jobid set");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShowJob(
                          jobid: jobid,
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: ListTile(
                  leading: Container(
                    child: Center(
                      child: Text(
                        "Job No"+" "+job[index].jobno,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: new BorderRadius.circular(8.0),
                        color: colors[rng.nextInt(3)]),
                    width: 70.0,
                    height: 80.0,
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        job[index].vName + " / " + job[index].vNumber,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            fontFamily: "SF"),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            job[index].cusName,
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                             "0 Tasks",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FAProgressBar(
                        size: 4,
                        currentValue: 75,
                        progressColor: Colors.green,
                        backgroundColor: Color(0xffF0F0F0),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
