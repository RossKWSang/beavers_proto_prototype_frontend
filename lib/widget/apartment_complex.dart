import 'package:beavers_prototype/utils/style.dart';
import 'package:flutter/material.dart';

class AptComAno extends StatelessWidget {
  final double deviceWidth;
  final double deviceHeight;
  final String name;
  final String announceDate;
  final String moveIntoDate;
  const AptComAno({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
    required this.name,
    required this.announceDate,
    required this.moveIntoDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: deviceWidth * 0.05,
          height: deviceHeight * 0.03,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        SizedBox(
          width: deviceWidth * 0.05,
        ),
        Text(
          name,
          style: aptAnounceTextStyle,
        ),
        SizedBox(
          height: deviceHeight * 0.05,
        ),
      ],
    );
  }
}
