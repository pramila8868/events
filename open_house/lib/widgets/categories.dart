import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_house/const/colors.dart';

import '../controller/categories_controller.dart';

class Categories extends StatelessWidget {
  final categoriesList = [
    'Upcoming Events',
    'Upcoming Events',
    'Future Events',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: BlocBuilder<CategoryCubit, int>(
        builder: (context, selectedIndex) => ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<CategoryCubit>().selectCategory(index);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: selectedIndex == index
                                      ? btntext
                                      : Colors.transparent,
                                  width: 3))),
                      child: Text(
                        categoriesList[index],
                        style: TextStyle(
                            color: //selectedIndex == index
                                text1,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Roboto"),
                      )),
                ),
            separatorBuilder: (_, index) => SizedBox(width: 15),
            itemCount: categoriesList.length),
      ),
    );
  }
}
