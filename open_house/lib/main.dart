import 'package:flutter/material.dart';
import 'package:open_house/Organization_detail/organization_cubit.dart';
import 'package:open_house/Organization_detail/repository/organization_repository.dart';
import 'package:open_house/past_event_cubit/cubit/pastevent_cubit.dart';
import 'package:open_house/past_event_cubit/repository/pastevent_repository.dart';
import 'package:open_house/tabbar/tabbar.dart';
import 'package:open_house/tabbar/tabbar_cubit.dart';
// ignore: depend_on_referenced_packages
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:open_house/Screen/home_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/favouritscubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // OrganizationDetail? detail;
  const MyApp({
    key, //this.detail
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    return ResponsiveSizer(builder: (context, Orientation, ScreenType) {
      return MultiBlocProvider(
        providers: [
          // BlocProvider(
          //   create: (_) => OrganizationCubit(),
          // ),
          BlocProvider(create: (_) => TabCubit()),
          // BlocProvider(create: (_) => EventCubit()),
          BlocProvider(create: (_) => FavoriteCubit()),
          BlocProvider(create: (_) => PastEventCubit(PastEventRepository())),
          BlocProvider(
              create: (_) => OrganizationCubit(OrganizationRepository())),
          //BlocProvider(create: (_) => TabCubit()),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            //home: TabBarPage(), //MyApp1(),
            home: HomeScreen()
            // organizationDetail: detail!,
            //organizationDetail: detail.toString();
            // )
            //),
            //home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
      );
    });
  }
}
