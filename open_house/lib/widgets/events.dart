import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_house/const/colors.dart';

class Events extends StatelessWidget {
  const Events({super.key});

//
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width * 0.98,
      // height: 500,
      color: Colors.black,
      child: GridView.builder(
          itemCount: 4,
          //shrinkWrap: true,
          // scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6), color: eventcolor),
              // color: Colors.pink,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 190,
                      child: Image.asset(
                        "images/image.png",
                        //height: 120,
                        fit: BoxFit.cover,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "International Band\n Musical Festival",
                        style: TextStyle(
                            color: text1,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Image.asset("images/map-pin.png"),
                          Text(
                            "Iris Pub",
                            style: TextStyle(
                                color: text1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
