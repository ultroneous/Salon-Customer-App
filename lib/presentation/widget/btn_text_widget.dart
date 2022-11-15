import 'package:flutter/material.dart';

class BtnTextWidget extends StatelessWidget {
  const BtnTextWidget({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final dWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: dWidth,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style:
                  const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

