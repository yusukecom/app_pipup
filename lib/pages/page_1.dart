import 'package:pipupapp/widgets/app_large_text.dart';
import 'package:pipupapp/widgets/app_text.dart';
import 'package:pipupapp/widgets/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key:key);
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1>{
  List images = [
    "IMG_7190.jpg",
    "IMG_7191.jpg",
    "IMG_7192.jpg",
  ];
  List text = [

  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index){
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "image/"+images[index]
                  ),
                  fit: BoxFit.cover
                )
              ),
              child: Container(
                margin: const EdgeInsets.only(left:20,top: 150,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: 'PIPLUP STEP'),
                        AppText(text: 'Project Piplup', size: 20,),
                        SizedBox(height: 20,),
                        Container(
                          width: 250,
                          child: AppText(
                            text: 'mmmmmmmmmmm',
                            color: Colors.amberAccent,
                            size: 14,
                          ),
                        ),
                        SizedBox(height: 40,),
                        ResponsiveButton(width: 120,),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots){
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index==indexDots?25:8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index==indexDots?Colors.amberAccent:Colors.amberAccent.withOpacity(0.3)
                          ),
                        );
                      }),
                    )
                  ],
                ),

              ),
            );
      })
    );
  }
}
