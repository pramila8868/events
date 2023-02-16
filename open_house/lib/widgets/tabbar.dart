import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_house/const/colors.dart';
import 'package:open_house/widgets/events.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../tabbar/tabbar_cubit.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
      builder: (context, currentIndex) {
        return Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TabBar(
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.w700, fontFamily: "Roboto"),
              //  /labelStyle: ,
              labelColor: text1,
              unselectedLabelColor: text1,

              // unselectedLabelColor: Colors.red,
              isScrollable: false,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: btntext,
              controller: _tabController,
              // ignore: prefer_const_literals_to_create_immutables
              tabs: [
                const Tab(
                  text: 'Upcoming Events',
                ),
                const Tab(
                  text: 'Past Events',
                ),
              ],
              onTap: (index) {
                context.read<TabCubit>().changeTab(index);
                _tabController.animateTo(index);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.06.h,
                // color: Colors.pink,
                child: TabBarView(
                  controller: _tabController,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Center(
                      child: const Text(
                        ' No Events',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Events()
                  ],
                ),
              ),
            ),
          ],
        );
      },
      //  ),
    );
  }
}
