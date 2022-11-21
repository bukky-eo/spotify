import 'package:flutter/material.dart';
import 'package:spotify/screens/auth/select.dart';

import '../../helpers/constants.dart';
import '../../helpers/widgets.dart';

class ThemePreferences extends StatefulWidget {
  const ThemePreferences({Key? key}) : super(key: key);

  @override
  State<ThemePreferences> createState() => _ThemePreferencesState();
}

class _ThemePreferencesState extends State<ThemePreferences> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bills.jpg'), fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 15, right: 25, left: 25, bottom: 15),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('images/vector_dark.png'),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Choose mode',
                              style: kNormalHeading,
                            ),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                          color: kBrown,
                                          shape: BoxShape.circle),
                                      child: InkWell(
                                        child: Image.asset('images/moon.png'),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const Select())),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    const Text(
                                      'Dark Mode',
                                      style: kTextHeading,
                                    )
                                  ],
                                ),
                                const SizedBox(width: 35),
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15),
                                      decoration: const BoxDecoration(
                                          color: kBrown,
                                          shape: BoxShape.circle),
                                      child: InkWell(
                                        child:
                                            Image.asset('images/sunlight.png'),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    const Select())),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 15),
                                    const Text(
                                      'Light Mode',
                                      style: kTextHeading,
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(height: 25),
                            LinearButton(
                                title: 'Continue',
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: ((context) => const Select())),
                                  );
                                }),
                          ],
                        ),
                      ],
                    ),
                  )),
            )));
  }
}
