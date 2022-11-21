import 'package:flutter/material.dart';
import 'package:spotify/helpers/constants.dart';
import 'package:spotify/screens/auth/register.dart';
import 'package:spotify/screens/auth/sign_in.dart';

class Select extends StatelessWidget {
  const Select({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundWhite,
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                      color: kStroke, shape: BoxShape.circle),
                  child: IconButton(
                    icon: const Icon(Icons.navigate_before),
                    onPressed: () {},
                    color: kText,
                  ),
                ),
                Image.asset('images/union.png'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
              child: Column(
                children: [
                  Image.asset('images/vector.jpg'),
                  const SizedBox(height: 15),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                        color: kBlackText,
                        fontWeight: FontWeight.w700,
                        fontSize: 28),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider ',
                    style: kSmallHeading,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Image.asset(
                  'images/green_billie.jpg',
                  height: 345,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                          top: 25, left: 45, right: 45, bottom: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kGreen,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => const Register())));
                        },
                        child: const Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: 25, left: 45, right: 45, bottom: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kBackgroundWhite,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => const SignIn())));
                        },
                        child: const Text(
                          'Sign in',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: kBlackText),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
