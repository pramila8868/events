import 'package:flutter/material.dart';
import 'package:open_house/Screen/screen.dart';
import 'package:open_house/controller/categories_controller.dart';
import 'package:open_house/widgets/categories.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:open_house/Screen/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, Orientation, ScreenType) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
            create: (_) => CategoryCubit(), child: const HomeScreen()),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}
