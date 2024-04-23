import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({super.key});


  @override
  State<FeedPage> createState() => _FeedPageState();
}


class _FeedPageState extends State<FeedPage> {

  final List<List<String>> rsoNames = [ 
      ["Association of Computing Machinery", "acm mission" ],
      ["(eye)Teach", "(eye)Teach mission" ],
      ["ACHA Men's Division II Hockey Club at the University of Illinois Urbana-Champaign", "mission for this rso with a super long name"] 
    ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Feed Page"),
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(15.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: RSOCard(rsoTitle: rsoNames[index][0], rsoMission: rsoNames[index][1],),
                    );
                  },
                  childCount: rsoNames.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class RSOCard extends StatelessWidget {
  const RSOCard({super.key, required this.rsoTitle, required this.rsoMission});

  final String rsoTitle;
  final String rsoMission;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Get.to(() => RSOPage(title: rsoTitle, mission: rsoMission,)); },
      child: Container(
        height: 140.0,
        width: 0.0,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          // color: Colors.orange,
          border: Border.all(color: Colors.orange, width: 2.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 15.0,
              top: 20.0,
              child: Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/uiuclogo.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 125.0,
              top: 20.0,
              child: SizedBox(
                height: 120.0,
                width: 230.0,
                child: Text(
                  rsoTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 125.0,
              bottom: 20.0,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.green,
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "Open",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red,
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "Not Registered",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RSOPage extends StatelessWidget {
  const RSOPage({
    super.key,
    required this.title,
    required this.mission,
  });

  final String title;
  final String mission;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () { Get.back(); },
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/uiuclogo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: 250.0,  
                      height: 80.0,
                      child: Text(title),
                    ),
                  ],
                ),
              ),
              const TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.black87,
                  tabs: [
                    Text("About", style: TextStyle(fontSize: 25.0),),
                    Text("Home", style: TextStyle(fontSize: 25.0),),
                    Text("Events", style: TextStyle(fontSize: 25.0),),
                  ],
                ),
                Container(
                  height: 500.0,
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("General"),
                            Divider(),
                            Text("Group Type: ${title}"),
                            Text("Mission"),
                            Divider(),
                            Text(mission),
                            Text("Contact Info"),
                            Divider(),
                            Text("Officers"),
                            Divider(),
                          ],
                        ),
                      ),
                      Text("Home/Announcements"),
                      Text("Events"),
                    ],
                  ),
                ),
            ],
          ),
        ),
        ),
    );
  }
}

