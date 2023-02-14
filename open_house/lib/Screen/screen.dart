import 'package:flutter/material.dart';
import 'package:open_house/Organization_detail/organizarion_state.dart';
import 'package:open_house/Organization_detail/organization_cubit.dart';
import 'package:open_house/const/colors.dart';
import 'package:open_house/model/organization_detail.dart';
import 'package:open_house/widgets/categories.dart';
import 'package:open_house/widgets/custom_button.dart';
import 'package:open_house/widgets/events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/organization.dart';

class Screen extends StatelessWidget {
  // final OrganizationDetail organizationDetail;
  Screen({
    super.key, //required this.organizationDetail
  });

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
                  child: BlocConsumer<OrganizationCubit, OrganizationState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is InitOrganizationState ||
                            state is LoadingOrganizationState) {
                          return CircularProgressIndicator();
                        } else if (state is ResponseOrganizationState) {
                          final organizationlist = state.organization.length;
                          // FutureBuilder(
                          //     future: fetchMobileDetails(),
                          //     builder: (context, snapshot) {
                          //       if (snapshot.hasError) print(snapshot.error);
                          //       if (snapshot.hasData) {
                          //         print("snapshot of data is ${snapshot.data}");
                          return Column(
                            children: [
                              Text(
                                // organizationlist[index]..toString(),
                                //   organizationlist[].
                                //  pasteventlist.description.toString(),
                                //   organizationDetail.name.toString(),
                                // snapshot.data.
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
                                    //  organizationDetail.image.toString(),
                                    "images/Vector.png",
                                    color: text1,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    // organizationDetail.followersCount
                                    // .toString(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                          );
                        }
                        return CircularProgressIndicator();
                      }),
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
            )),
      ],
    );
  }
}
