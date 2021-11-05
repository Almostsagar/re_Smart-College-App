import 'package:flutter/material.dart';

import '../constant.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.bgColor,
    required this.textColor,
  }) : super(key: key);
  final String buttonName;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith(
            (states) => Colors.black12,
          ),
        ),
        onPressed: () {},
        child: Text(
          buttonName,
          style: kButtonText.copyWith(color: textColor),
        ),
      ),
    );
  }
}
