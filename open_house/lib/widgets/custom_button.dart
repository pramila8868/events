import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:open_house/const/colors.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 47,
        width: 134,
        decoration: BoxDecoration(
          //color: btntext,
          borderRadius: BorderRadius.circular(
            5,
          ),
          border: Border.all(
            color: btntext,
          ),
        ),
        child: Center(
          child: Text(
            "Follow",
            style: TextStyle(
                color: btntext,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Roboto"),
          ),
        ));
  }
}
