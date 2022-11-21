import 'package:flutter/material.dart';

import 'constants.dart';

class LinearButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  const LinearButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, left: 65, right: 65, bottom: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: kGreen,
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
