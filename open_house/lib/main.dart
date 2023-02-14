import 'package:flutter/material.dart';
import 'package:open_house/Organization_detail/organization_cubit.dart';
import 'package:open_house/Organization_detail/repository/organization_repository.dart';
import 'package:open_house/Screen/screen.dart';
import 'package:open_house/controller/categories_controller.dart';
import 'package:open_house/controller/organization.dart';
import 'package:open_house/cubit.dart';
import 'package:open_house/model/organization_detail.dart';
import 'package:open_house/past_event_cubit/cubit/pastevent_cubit.dart';
import 'package:open_house/past_event_cubit/repository/pastevent_repository.dart';
import 'package:open_house/widgets/categories.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:open_house/Screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/favouritscubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // OrganizationDetail? detail;
  MyApp({
    super.key, //this.detail
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, Orientation, ScreenType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CategoryCubit(),
          ),
          // BlocProvider(
          //   create: (_) => OrganizationCubit(),
          // ),
          BlocProvider(create: (_) => TabCubit()),
          // BlocProvider(create: (_) => EventCubit()),
          BlocProvider(create: (_) => FavoriteCubit()),
          BlocProvider(create: (_) => PastEventCubit(PastEventRepository())),
          BlocProvider(
              create: (_) => OrganizationCubit(OrganizationRepository()))
          //BlocProvider(create: (_) => PastDetailsCubit()),
        ],
        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: TabBars(), //MyApp1(),
            home: HomeScreen(
                // organizationDetail: detail!,
                //organizationDetail: detail.toString();
                )
            //),
            //home: const MyHomePage(title: 'Flutter Demo Home Page'),
            ),
      );
    });
  }
}
