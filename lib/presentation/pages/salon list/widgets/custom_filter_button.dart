import 'package:flutter/material.dart';

class CustomFilterBtn extends StatelessWidget {
  const CustomFilterBtn(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.bgColor,
      required this.textColor})
      : super(key: key);
  final String title;
  final Function() onTap;
  final Color bgColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: (MediaQuery.of(context).size.width * 45) / 100,
        height: 35,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
