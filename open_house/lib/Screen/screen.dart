import 'package:flutter/material.dart';
import 'package:open_house/Organization_detail/organizarion_state.dart';
import 'package:open_house/Organization_detail/organization_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../tabbar/tabbar.dart';
import '../const/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/tabbar.dart';

class Screen extends StatefulWidget {
  Screen({
    super.key,
    //required this.organizationDetail
  });

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<OrganizationCubit>();
      cubit.fetchOrganization();
    });
  }

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
                  child: BlocBuilder<OrganizationCubit, OrganizationState>(
                      // listener: (context, state) {},
                      builder: (context, state) {
                    if (state is InitOrganizationState) {
                      return const Text("Data is initialize");
                    }
                    if (state is LoadingOrganizationState) {
                      return const CircularProgressIndicator();
                    } else if (state is LoadedOrganizationState) {
                      return Column(
                        children: [
                          Text(
                            state.organization.name.toString(),
                            style: TextStyle(
                                color: text1,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Roboto"),
                          ),
                          const SizedBox(
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
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                // organizationDetail.followersCount
                                // .toString(),
                                state.organization.followersCount.toString(),
                                style: TextStyle(
                                    color: text1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Followers",
                                style: TextStyle(
                                    color: text1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Roboto"),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Button(),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    state.organization.upcomingEventCount
                                        .toString(),
                                    style: TextStyle(
                                        color: text1,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Roboto"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      ("Upcoming Events"),
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
                                    state.organization.pastEventCount
                                        .toString(),
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
                    } else if (state is ErrorOrganizationState) {
                      return Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      );
                    } else if (state is ApiNoData) {
                      return const Text(
                        "No Data",
                        style: TextStyle(color: Colors.white),
                      );
                    } else if (state is ApiNoInternet) {
                      return const Text(
                        "No internet connection",
                        style: TextStyle(color: Colors.white),
                      );
                    }
                    return Text(state.toString());
                    // return CircularProgressIndicator();
                  }),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                const Divider(height: 2, thickness: 1, color: Colors.grey),
                //Categories(),
                const TabBarPage(),
              ],
            )),
      ],
    );
  }
}
