import 'package:autoassit/Screens/HomePage/homeWidgets/project_card_tile.dart';
import 'package:flutter/material.dart';

class JobRecords extends StatefulWidget {
  @override
  _JobRecordsState createState() => _JobRecordsState();
}

class _JobRecordsState extends State<JobRecords>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  String state = "Followers";

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // appBar: SearchAppBar(
      //   color1: Colors.grey[100],
      //   color2: Colors.white,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: _buildTabBar(context),
          ),
          Flexible(
            child: _buildTabView(context),
          ),
        ],
      ),
    );
  }

  Widget _buildTabView(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: <Widget>[
        FollowersContent(),
        FollowingContent(),
      ],
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.transparent,
      labelColor: Color(0xFFFF6038),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      unselectedLabelColor: Color(0xFF020433),
      isScrollable: true,
      tabs: <Widget>[
        getTabs('On-Going'),
        getTabs('Completed'),
      ],
    );
  }

  getTabs(String title) {
    return Tab(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22.0,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}

class FollowersContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: ProjectCardTile()
      
      // ListView(
      //   children: <Widget>[
      //     Text("ongoing"),
      //     Text("ongoing"),
      //     Text("ongoing"),
      //     Text("ongoing"),
      //     Text("ongoing"),
      //     Text("ongoing"),
      //     Text("ongoing"),
      //     // UserCardItem(),
      //     // UserCardItem(),
      //     // UserCardItem(),
      //     // UserCardItem(),
      //     // UserCardItem(),
      //     // UserCardItem(),
      //   ],
      // ),
    );
  }
}

class FollowingContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: ListView(
        children: <Widget>[
        Text("completed"),
        Text("completed"),
        Text("completed"),
        Text("completed"),
        Text("completed"),
        Text("completed"),
        Text("completed"),
        Text("completed"),

        ],
      ),
    );
  }
}

// class UserCardItem extends StatelessWidget {
//   final bool isFollowed;
//   final bool withBorder;
//   UserCardItem({
//     this.isFollowed = false,
//     this.withBorder = false,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return UserCard(
//       (!isFollowed)
//           ? RoundedBorderButton(
//               "FOLLOW",
//               color1: Color.fromRGBO(255, 94, 58, 1),
//               color2: Color.fromRGBO(255, 149, 0, 1),
//               textColor: Colors.white,
//               width: 100,
//               shadowColor: Colors.transparent,
//             )
//           : RoundedBorderButton(
//               "MESSAGE",
//               color1: Colors.grey[100],
//               color2: Colors.grey[100],
//               textColor: Colors.blueGrey[800],
//               width: 100,
//               shadowColor: Colors.transparent,
//             ),
//       withBorder: withBorder,
//     );
//   }
// }
