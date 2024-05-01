import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:get/get.dart';


class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}


class _FeedPageState extends State<FeedPage> {

  // Input List 

  final List<String> rsoNames = [ 
      "Association of Computing Machinery",
      "(eye)Teach",
      "ACHA Men's Division II Hockey Club at the University of Illinois Urbana-Champaign"
    ];

  // final List<List<String>> rsoNames = [ 
  //     ["Association of Computing Machinery", "acm mission"],
  //     ["(eye)Teach", "(eye)Teach mission" ],
  //     ["ACHA Men's Division II Hockey Club at the University of Illinois Urbana-Champaign", "mission for this rso with a super long name"] 
  //   ];

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
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: RSOCard(rsoTitle: rsoNames[index]),
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


/* 
Widget for the RSO info cards or blocks displayed via SliverList 
onTap (outside of register button) direct user to the RSO's own page
*/

class RSOCard extends StatelessWidget {
  const RSOCard({super.key, required this.rsoTitle});

  final String rsoTitle;
  // final String rsoMission;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { Get.to(() => RSOPage(title: rsoTitle)); },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.215,
        // width: 0.0,
        padding: const EdgeInsets.all(10.0),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            
            // UIUC/RSO Image

            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width * 0.275,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: const DecorationImage(
                  image: AssetImage("assets/images/uiuclogo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // RSO Name, Membership, and Register Button

            Column(
              children: [
                Container(
                  padding: const EdgeInsetsDirectional.only(top: 18.0),
                  height: MediaQuery.of(context).size.height * 0.095,
                  width: MediaQuery.of(context).size.width * 0.55,
                  child: Text(
                    rsoTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 2.5,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: const Text(
                      "Membership Closed", style: TextStyle(color: Colors.red, fontSize: 12.5, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 2.0),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    fixedSize: Size(MediaQuery.of(context).size.width * 0.55, MediaQuery.of(context).size.height * 0.03),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                  ),
                  onPressed: () {}, 
                  child: const Text("Register", style: TextStyle(color: Colors.white, fontSize: 15.0),),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

// Widget for the individual pages for RSOs

class RSOPage extends StatelessWidget {
  const RSOPage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () { Get.back(); },
            ),
            title: Text(title),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
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
              ),

              // Initialize Tab Bar

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

                // Tab Page Display

                SizedBox(
                  height: 500.0,
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                children: [
                                  Icon(Icons.info, fill: 0.0, weight: 400.0, opticalSize:24, grade: 0, size: 30.0,),
                                  Text("General", style: TextStyle(fontSize: 25.0),)
                                ],
                              ),
                              
                              const Divider(
                                height: 15.0,
                              ),
                              Text("$title Group Type + Other General Info"),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.language, fill: 0.0, weight: 400.0, opticalSize:24, grade: 0, size: 30.0,),
                                  Text("Mission", style: TextStyle(fontSize: 25.0),),
                                ],
                              ),
                              const Divider(
                                height: 15.0,
                              ),
                              Text("$title Mission"),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.mail, fill: 0.0, weight: 400.0, opticalSize:24, grade: 0, size: 30.0,),
                                  Text("Contact", style: TextStyle(fontSize: 25.0),),
                                ],
                              ),
                              const Divider(
                                height: 15.0,
                              ),
                              Text("$title Contact Info"),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.group, fill: 0.0, weight: 400.0, opticalSize:24, grade: 0, size: 30.0,),
                                  Text("Officers", style: TextStyle(fontSize: 25.0),),
                                ],
                              ),
                              const Divider(
                                height: 15.0,
                              ),
                              Text("$title Officers Info"),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Text("Home/Announcements"),
                      const Text("Events"),
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

