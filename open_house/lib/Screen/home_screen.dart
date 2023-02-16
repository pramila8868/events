import 'package:flutter/material.dart';
import 'package:open_house/Screen/screen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Organization_detail/organizarion_state.dart';
import '../Organization_detail/organization_cubit.dart';
import '../const/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Colors.red,
            body: SingleChildScrollView(
                child: Column(children: [
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          //color: Colors.,
          child: Column(children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02.h),
                  decoration:
                      const BoxDecoration(color: Color.fromARGB(250, 0, 0, 0)),
                  child: Screen(),
                ),
                Column(children: [
                  Stack(children: [
                    BlocBuilder<OrganizationCubit, OrganizationState>(
                        builder: (context, state) {
                      if (state is InitOrganizationState) {
                        return const Text("Data is initialize");
                      }
                      if (state is LoadingOrganizationState) {
                        return const CircularProgressIndicator();
                      }
                      if (state is LoadedOrganizationState) {
                        return Container(
                          //color: Colors.blue,
                          height: MediaQuery.of(context).size.height * 0.02.h,
                          width: MediaQuery.of(context).size.width * 0.4.w,
                          child: Opacity(
                            opacity: 0.9,
                            child: Image.network(
                              state.organization.image.toString(),
                              fit: BoxFit.fill,
                            ),
                          ),
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
                    }),
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
                            PopupMenuButton(
                              itemBuilder: (BuildContext context) => [
                                // ignore: prefer_const_constructors
                                PopupMenuItem(
                                  child: Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Icon(Icons.share_sharp,
                                          color: Colors.red),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "Share organiser",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),

                                PopupMenuItem(
                                  child: Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Icon(Icons.error_outline,
                                          color: Colors.red),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Text(
                                        "About",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              child: Icon(
                                Icons.more_vert,
                                size: 21,
                                color: btntext,
                              ),
                            ),
                          ]),
                    ),
                  ]),
                ]),
                BlocBuilder<OrganizationCubit, OrganizationState>(
                    builder: (context, state) {
                  if (state is InitOrganizationState) {
                    return const Text("Data is initialize");
                  }
                  if (state is LoadingOrganizationState) {
                    return const CircularProgressIndicator();
                  }
                  if (state is LoadedOrganizationState) {
                    return Positioned(
                        top: 9.6.h,
                        left: 139,
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(state.organization.image.toString()),
                          radius: 26.sp,
                        ));
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
                })
              ],
            ),
          ])
          //  ],
          ),
    ])
                //  ],
                //  ),
                // ],

                ))
        // }
        //  return const Text("Error");

        //);
        //}),
        );
  }
}
