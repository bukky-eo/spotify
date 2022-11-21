import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:text_divider/text_divider.dart';
import '../../helpers/constants.dart';
import '../../helpers/widgets.dart';
import 'click.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  bool _passwordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundWhite,
      appBar: AppBar(
        title: Image.asset('images/small_vector.png'),
        centerTitle: true,
        backgroundColor: kBackgroundWhite,
        elevation: 0,
        leading: const Icon(
          Icons.navigate_before,
          color: kText,
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
        child: Column(
          children: [
            const Text('Sign In',
                style: TextStyle(
                    color: kBlackText,
                    fontWeight: FontWeight.w700,
                    fontSize: 28)),
            const SizedBox(height: 15),
            Text.rich(
              TextSpan(
                text: 'If you need any support ',
                style: const TextStyle(fontSize: 15, color: kBlackText),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: ((context) => const Click()))),
                      text: 'click here',
                      style: const TextStyle(
                          color: kGreen,
                          fontSize: 15,
                          fontStyle: FontStyle.italic)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Inputs(
              label: 'E-mail',
              controller: emailController,
            ),
            const SizedBox(height: 15),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  hintStyle: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(_passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off))),
              controller: passwordController,
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Recovery Password',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 18, color: kText, fontWeight: FontWeight.w700),
                )),
            const SizedBox(
              height: 15,
            ),
            LinearButton(title: 'Sign In', onTap: () {}),
            const SizedBox(
              height: 15,
            ),
            TextDivider.horizontal(
                color: kBlackText,
                text: const Text(
                  'Or',
                  style: TextStyle(fontSize: 16),
                ),
                thickness: 1),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(onTap: () {}, child: Image.asset('images/google.png')),
                const SizedBox(
                  width: 25,
                ),
                InkWell(onTap: () {}, child: Image.asset('images/apple.png'))
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Text.rich(
              TextSpan(
                text: 'Not a Member ?',
                style: const TextStyle(fontSize: 15, color: kBlackText),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: ((context) => const SignIn()))),
                      text: 'Register Now',
                      style: const TextStyle(
                          color: kBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
