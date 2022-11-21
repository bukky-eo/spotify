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

class Inputs extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const Inputs({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white70,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        hintStyle: TextStyle(fontSize: 15, color: Colors.grey[800]),
        hintText: label,
      ),
      controller: controller,
    );
  }
}
