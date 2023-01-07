import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kAsh,
        title: Image.asset('images/small_vector.png'),
        centerTitle: true,
        leading: const Icon(
          Icons.search,
          color: kText,
        ),
        actions: const [
          Icon(
            CupertinoIcons.square_split_1x2,
            color: Colors.black,
          )
        ],
      ),
      backgroundColor: kAsh,
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kGreen, borderRadius: BorderRadius.circular(15)),
            )
          ],
        ),
      ),
    );
  }
}
