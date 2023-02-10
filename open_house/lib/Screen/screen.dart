import 'package:flutter/material.dart';
import 'package:open_house/const/colors.dart';
import 'package:open_house/widgets/categories.dart';
import 'package:open_house/widgets/custom_button.dart';
import 'package:open_house/widgets/events.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 38, left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "ABC BeerFeast Open house",
                      style: TextStyle(
                          color: text1,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Roboto"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/Vector.png",
                          color: text1,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "150  Followers",
                          style: TextStyle(
                              color: text1,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Button(),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "8",
                              style: TextStyle(
                                  color: text1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Roboto"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Upcoming Events",
                                style: TextStyle(
                                    color: text1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "15",
                              style: TextStyle(
                                  color: text1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Roboto"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Past Events",
                                style: TextStyle(
                                    color: text1,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(height: 2, thickness: 1, color: Colors.grey),
              Categories(),
              SizedBox(
                height: 10,
              ),
              Events(),
            ],
          ),
        ),
      ],
    );
  }
}
