import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:spotify/screens/auth/sign_in.dart';
import 'package:text_divider/text_divider.dart';

import '../../helpers/constants.dart';
import '../../helpers/widgets.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  bool _passwordVisible = false;
  final TextEditingController nameController = TextEditingController();
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Register',
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
                                builder: ((context) => const Register()))),
                      text: 'click here',
                      style: TextStyle(color: kGreen, fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Inputs(
              label: 'Full Name',
              controller: nameController,
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
            LinearButton(title: 'Create account', onTap: () {}),
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
                text: 'Already have an account?',
                style: const TextStyle(fontSize: 15, color: kBlackText),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: ((context) => const SignIn()))),
                      text: 'Sign In',
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
