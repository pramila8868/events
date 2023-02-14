import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_house/const/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Step 3: Create the cubit
class TabCubit extends Cubit<int> {
  TabCubit() : super(0);

  // Step 4: Define the events and states
  void changeTab(int index) => emit(index);
}

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<TabCubit, int>(
        // Step 8: Build the tab bar content based on the state
        builder: (context, currentIndex) {
          return Column(
            children: [
              TabBar(
                //  /labelStyle: ,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.red,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
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
                ],
                onTap: (index) {
                  // Step 5: Handle the tab bar events and update the state
                  context.read<TabCubit>().changeTab(index);
                  _tabController.animateTo(index);
                },
              ),
              Container(
                width: double.infinity,
                //height: double.infinity,
                //  height: MediaQuery.of(context).size.height * 0.08.h,
                color: Colors.yellow,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Step 4: Use the cubit state to determine the tab content
                    Text('Tab 1 content'),
                    Text('Tab 2 content'),
                    Text('Tab 3 content'),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
