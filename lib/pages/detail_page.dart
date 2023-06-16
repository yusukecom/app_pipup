//import 'package:../../lib/widgets/app_buttons.dart';
import 'package:pipupapp/widgets/app_button.dart';
import 'package:pipupapp/widgets/app_large_text.dart';
import 'package:pipupapp/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 360,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/IMG_7190.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
                left: 20,
                bottom: 20,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ResponsiveButton(
                      isResponsive: false,
                    )
                  ],
                )),
            Positioned(
              top: 330,
              child: Container(
                padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 550,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: 'demo'),
                        AppLargeText(
                          text: 'demo',
                          color: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        AppLargeText(
                          text: 'PIP',
                          color: Colors.grey.withOpacity(0.5),
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(
                          5,
                          (index) {
                            return Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? Colors.amberAccent
                                  : Colors.grey,
                              size: 20,
                            );
                          },
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: '(4.0)',
                          color: Colors.grey,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(text: 'people', color: Colors.black),
                    SizedBox(
                      height: 5,
                    ),
                    AppLargeText(
                      text: 'number',
                      color: Colors.grey,
                      size: 10,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      children: List.generate(5, (index) {
                        return InkResponse(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10, top: 10),
                            child: AppButton(
                              color: selectedIndex == index
                                  ? Colors.white70
                                  : Colors.black54,
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.2),
                              size: 60,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.3),
                              text: (index + 1).toString(),
                            ),
                          ),
                        );
                        text:
                        index.toString();
                      }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
