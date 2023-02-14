import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_house/Screen/screen.dart';
import 'package:open_house/model/organization_detail.dart';
import 'package:open_house/widgets/custom_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../const/colors.dart';
import '../controller/organization.dart';
import '../widgets/categories.dart';
import '../widgets/events.dart';

class HomeScreen extends StatelessWidget {
  //OrganizationDetail organizationDetail;
  HomeScreen({
    super.key, //required this.organizationDetail
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.022.h),
                      decoration: BoxDecoration(color: Colors.black),
                      child: Column(
                        children: [
                          Screen(

                              // organizationDetail: organizationDetail
                              ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: btntext,
                            ),
                            Icon(
                              Icons.more_vert,
                              size: 21,
                              color: btntext,
                            ),
                          ]),
                    ),
                    Positioned(
                        top: 10.h,
                        left: 160,
                        child: CircleAvatar(
                          radius: 26.sp,
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
