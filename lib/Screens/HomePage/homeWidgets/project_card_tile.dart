import 'package:autoassit/Controllers/ApiServices/Job_services/get_jobs_service.dart';
import 'package:autoassit/Models/jobModel.dart';
import 'package:autoassit/Providers/JobProvider.dart';
import 'package:autoassit/Screens/HomePage/homeWidgets/progress_indicator.dart';
import 'package:autoassit/Screens/Jobs/showJob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton/flutter_skeleton.dart';
import 'package:provider/provider.dart';

import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';

class ProjectCardTile extends StatefulWidget {
  @override
  _ProjectCardTileState createState() => _ProjectCardTileState();
}

class _ProjectCardTileState extends State<ProjectCardTile> {
  List<Job> job = List();
  List<Job> _jobList = [];
  bool isfetching = true;
  bool isEmpty = false;

  @override
  void initState() {
    super.initState();
    // callAPI();
    Provider.of<JobProvider>(context, listen: false).startGetJobs();
  }

  // callAPI() {
  //   GetJobsController.getJobs().then((jobsFromServer) {
  //     setState(() {
  //       job = jobsFromServer;
  //     });

  //     if(jobsFromServer.isNotEmpty){
  //       print("not empty");
  //        setState(() {
  //       isfetching = false;
  //     });
  //     print("is fetcing  $isfetching");
  //     }
  //   });
  // }

  final List colors = [Colors.blue, Colors.black, Colors.green];

  @override
  Widget build(BuildContext context) {
    _jobList = [];
    _jobList = Provider.of<JobProvider>(context).listJobs;
    if (_jobList.isNotEmpty) {
      setState(() {
        isfetching = false;
        isEmpty = false;
      });
    }

    var rng = new math.Random.secure();
    return Column(
      children: [
        isfetching
            ? 
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
                      child: ListSkeleton(
                  style: SkeletonStyle(
                    theme: SkeletonTheme.Light,
                    isShowAvatar: false,
                    isCircleAvatar: false,
                    barCount: 3,
                    colors: [Color(0xFF8E8CD8), Color(0xFF81C784), Color(0xffFFE082)],
                    isAnimation: true
                  ),
                ),
            )
            : isEmpty ? Text("empty hutto"): ListView.builder(
                shrinkWrap: true,
                itemCount: _jobList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: GestureDetector(
                      onTap: () async {
                        final jobid = _jobList[index].jobId;
                        SharedPreferences jobs =
                            await SharedPreferences.getInstance();
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
                                "Job No ${_jobList[index].jobno}",
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
                                "${_jobList[index].vName} ${_jobList[index].vNumber}",
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
                                    _jobList[index].cusName,
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "${_jobList[index].taskCount}",
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
                }),
      ],
    );
  }
}
