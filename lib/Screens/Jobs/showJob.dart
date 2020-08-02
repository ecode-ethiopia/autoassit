import 'package:autoassit/Controllers/ApiServices/Job_services/getjobsbyId.dart';
import 'package:autoassit/Models/jobModel.dart';
import 'package:autoassit/Screens/Jobs/additems.dart';
import 'package:flutter/material.dart';
import 'package:autoassit/Screens/Jobs/Widgets/addTask_page.dart';

class ShowJob extends StatefulWidget {
  final jobid;
  ShowJob({Key key, this.jobid}) : super(key: key);

  @override
  _ShowJobState createState() => _ShowJobState();
}

class _ShowJobState extends State<ShowJob> {
  List<Job> job = List();

  @override
  void initState() {
    callAPI();
    super.initState();
  }

  callAPI() {
    GetJobsByIdService.getJobsById().then((jobsFromServer) {
      setState(() {
        job = jobsFromServer;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
            Widget>[
          // Container(
          //   height: 25,
          //   color: Color(0xFFef5350),
          // ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height / 17.5,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Job NO " + job[index].jobno,
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            _buildFields('Date - ' + job[index].date),
                            _buildFields('Vehicle No - ' + job[index].vNumber),
                            _buildFields('Vehicle Name - ' + job[index].vName),
                            _buildFields(
                                'Customer Name - ' + job[index].cusName),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24.0, bottom: 24.0),
                        child: _buttons(),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height / 1.2,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(0),
                            // itemCount: job[index].serviceData.length,
                            itemBuilder: (context, index2) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20),
                                child: Row(
                                  children: <Widget>[
                                    // Container(
                                    //   decoration: CustomIconDecoration(
                                    //       iconSize: iconSize,
                                    //       lineWidth: 1,
                                    //       firstData: index == 0 ?? true,
                                    //       lastData:
                                    //           index == _taskList.length - 1 ??
                                    //               true),
                                    //   child: Container(
                                    //     decoration: BoxDecoration(
                                    //         borderRadius: BorderRadius.all(
                                    //             Radius.circular(50)),
                                    //         boxShadow: [
                                    //           BoxShadow(
                                    //             offset: Offset(0, 3),
                                    //             color: Color(0x20000000),
                                    //             blurRadius: 5,
                                    //           )
                                    //         ]),
                                    //     child: Icon(
                                    //       _taskList[index].isFinish
                                    //           ? Icons.fiber_manual_record
                                    //           : Icons.radio_button_unchecked,
                                    //       size: iconSize,
                                    //       color: Color(0xFFef5350),
                                    //     ),
                                    //   ),
                                    // ),
                                    Container(
                                        width: 80,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text("werew"),
                                        )),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 12.0, bottom: 12.0),
                                        child: Container(
                                          padding: const EdgeInsets.all(14.0),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(12)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Color(0x20000000),
                                                    blurRadius: 5,
                                                    offset: Offset(0, 3))
                                              ]),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                // Text(job[index].serviceData[index2].serviceName),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                // Text(job[index].productData[index2].productName),
                                              ]),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          ))
                    ],
                  );
                },
                
          )
          )
        ]
        ),
      ),
    );
  }

  Widget _buildFields(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'Montserrat',
      ),
    );
  }

  Widget _buttons() {
    return Row(children: <Widget>[
      Expanded(
        child: MaterialButton(
          color: Color(0xFFef5350),
          textColor: Colors.white,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(14.0),
          child: Text('Add Job Tasks'),
        ),
      ),
      SizedBox(
        width: 32,
      ),
      Expanded(
        child: MaterialButton(
          color: Colors.white,
          textColor: Color(0xFFef5350),
          onPressed: () {},
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xFFef5350)),
              borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.all(14.0),
          child: Text('Change Task Status'),
        ),
      )
    ]);
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(icon: Icon(Icons.settings), onPressed: () {}),
              IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
            ]));
  }
}

class CustomIconDecoration extends Decoration {
  final double iconSize;
  final double lineWidth;
  final bool firstData;
  final bool lastData;

  CustomIconDecoration({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  })  : this.iconSize = iconSize,
        this.lineWidth = lineWidth,
        this.firstData = firstData,
        this.lastData = lastData;

  @override
  BoxPainter createBoxPainter([onChanged]) {
    return IconLine(
        iconSize: iconSize,
        lineWidth: lineWidth,
        firstData: firstData,
        lastData: lastData);
  }
}

class IconLine extends BoxPainter {
  final double iconSize;
  final bool firstData;
  final bool lastData;

  final Paint paintLine;

  IconLine({
    @required double iconSize,
    @required double lineWidth,
    @required bool firstData,
    @required bool lastData,
  })  : this.iconSize = iconSize,
        this.firstData = firstData,
        this.lastData = lastData,
        paintLine = Paint()
          ..color = Colors.red
          ..strokeCap = StrokeCap.round
          ..strokeWidth = lineWidth
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final leftOffset = Offset((iconSize / 2) + 20 , offset.dy);
    final double iconSpace = iconSize / 1.8;

    final Offset top = configuration.size.topLeft(Offset(leftOffset.dx, 0.0));
    final Offset centerTop = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy - iconSpace));

    final Offset centerBottom = configuration.size
        .centerLeft(Offset(leftOffset.dx, leftOffset.dy + iconSpace));
    final Offset end =
        configuration.size.bottomLeft(Offset(leftOffset.dx, leftOffset.dy * 2));

    if (!firstData) canvas.drawLine(top, centerTop, paintLine);
    if (!lastData) canvas.drawLine(centerBottom, end, paintLine);
  }
}