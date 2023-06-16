import 'package:pipupapp/widgets/app_large_text.dart';
import 'package:pipupapp/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "IMG_7193.jpg": {
      "title": "Official",
      "url": "https://www.pokemon.jp/special/project_pochama/"
    },
    "twitter.png": {
      "title": "Twitter",
      "url": "https://twitter.com/prj_pochama"
    },
    "instagram.png": {
      "title": "Instagram",
      "url": "http://instagram.com/prj_pochama/"
    },
    "youtube.png": {
      "title": "YouTube",
      "url": "https://www.youtube.com/watch?app=desktop&v=bm0nLJuRNbw"
    },
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(Icons.menu, size: 30, color: Colors.black54),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 100,
                  height: 100,
                  child: Image.asset('image/pip2.jpg'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(
              text: "最新情報",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //tabbar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(color: Colors.amberAccent, radius: 4),
                tabs: [
                  Tab(
                    text: "1",
                  ),
                  Tab(
                    text: "2",
                  ),
                  Tab(
                    text: "3",
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            width: double.maxFinite,
            height: 300,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      //color: Colors.amberAccent,
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage('image/pip1.jpg'),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
                 ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      //color: Colors.amberAccent,
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage('image/IMG_7192.jpg'),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
                 ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15, top: 10),
                      //color: Colors.amberAccent,
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey,
                          image: DecorationImage(
                              image: AssetImage('image/pip2.jpg'),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: '公式のリンクサイト',
                  size: 20,
                ),
                AppText(
                  text: 'see all',
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            launch(images.values.elementAt(index)["url"]!);
                          },
                          child: Container(
                          //margin: const EdgeInsets.only(right: 50, ),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                              image: DecorationImage(
                                  image: AssetImage('image/'+images.keys.elementAt(index)),
                                  fit: BoxFit.cover
                              ),
                          ),
                          ),
                        ),
                        SizedBox(height: 0,),
                        Container(
                          //margin: const EdgeInsets.only(right: 50, ),
                          child: AppText(
                            text: images.values.elementAt(index)["title"]!,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),

        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
