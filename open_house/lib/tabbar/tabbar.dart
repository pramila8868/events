import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_house/const/colors.dart';
import 'package:open_house/widgets/events.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'tabbar_cubit.dart';

// Step 3: Create the cubit

class TabBarPage extends StatefulWidget {
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  // Step 6: Create the controller
  late TabController _tabController;

  // Step 7: Initialize the controller and add the tabs
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabCubit, int>(
      // Step 8: Build the tab bar content based on the state
      builder: (context, currentIndex) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              labelStyle:
                  TextStyle(fontWeight: FontWeight.w700, fontFamily: "Roboto"),
              //  /labelStyle: ,
              labelColor: text1,
              unselectedLabelColor: text1,
              // unselectedLabelColor: Colors.red,
              isScrollable: true,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: btntext,
              //unselectedLabelStyle: TextStyle(color: Colors.black),
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Upcoming Events',
                ),
                Tab(
                  text: 'Past Events',
                ),
                // Tab(
                //   text: 'Past Events',
                // ),
              ],
              onTap: (index) {
                // Step 5: Handle the tab bar events and update the state
                context.read<TabCubit>().changeTab(index);
                _tabController.animateTo(index);
              },
            ),
            Container(
              width: double.infinity,
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Text(
                    'Upcoming Events',
                    style: TextStyle(color: Colors.white),
                  ),
                  Events()
                ],
              ),
            ),
          ],
        );
      },
      //  ),
    );
  }
}
