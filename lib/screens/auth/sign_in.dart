import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:spotify/models/auth/auth_methods.dart';
import 'package:spotify/screens/auth/register.dart';
import 'package:spotify/screens/music/intro_music.dart';
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

  @override
  void dispose() {
    // emailController.dispose();
    // passwordController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  // late String email, password;
  bool _passwordVisible = true;
  void _login() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      setState(() {
        isLoading = true;
      });
      try {
        final response = await http.post(
          Uri.parse('https://your-server.com/login'),
          body: {
            'email': emailController.text,
            'password': passwordController.text
          },
        );
        if (response.statusCode == 200) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: ((context) =>
                  const IntroMusic()))); // Navigate to the home page
        } else {
          // Display an error message
        }
      } catch (e) {
        // Display an error message
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

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
        leading: IconButton(
          icon: const Icon(
            Icons.navigate_before,
            color: kText,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                            ..onTap = () => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) => emailController.text = value!,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  onSaved: (value) => passwordController.text = value!,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          icon: Icon(_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
                // TextFormField(
                //   obscureText: true,
                //   decoration: InputDecoration(
                //       fillColor: Colors.white70,
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(15.0),
                //       ),
                //       hintStyle:
                //           TextStyle(fontSize: 15, color: Colors.grey[800]),
                //       hintText: 'Password',
                //       suffixIcon: IconButton(
                //           onPressed: () {
                //             setState(() {
                //               _passwordVisible = !_passwordVisible;
                //             });
                //           },
                //           icon: Icon(_passwordVisible
                //               ? Icons.visibility
                //               : Icons.visibility_off))),
                //   controller: passwordController,
                // ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Recovery Password',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          color: kText,
                          fontWeight: FontWeight.w700),
                    )),
                const SizedBox(
                  height: 15,
                ),
                LinearButton(
                    title: 'Sign In',
                    onTap: () {
                      _login();
                    }),
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
                    InkWell(
                        onTap: () => AuthMethods().signInWithGoogle(context),
                        child: Image.asset('images/google.png')),
                    const SizedBox(
                      width: 25,
                    ),
                    InkWell(
                        onTap: () {}, child: Image.asset('images/apple.png'))
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Not a Member? ',
                    style: const TextStyle(fontSize: 15, color: kBlackText),
                    children: [
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: ((context) => const Register()))),
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
          ),
        )),
      ),
    );
  }

  // void signUpStudent() {
  //   if (formKey.currentState!.validate()) {
  //     setState(() {
  //       isLoading = true;
  //     });
  //
  //     _authHelper
  //         .signUpUser(_emailController.text, _passwordController.text)
  //         .then((value) async {
  //       if (value != null) {
  //         Map<String, String> studentData = {
  //           'name': _nameController.text,
  //           'email': _emailController.text,
  //           'rollNo': _regNoController.text,
  //         };
  //
  //         User? user = FirebaseAuth.instance.currentUser;
  //
  //         await _databaseHelper.uploadStudentInfo(user!.uid, studentData);
  //
  //         Navigator.of(context).pushReplacement(
  //           MaterialPageRoute(builder: ((context) => const StudentHomePage())),
  //         );
  //       } else {
  //         setState(() {
  //           isLoading = false;
  //         });
  //         SnackBar snackBar =
  //             const SnackBar(content: Text("Student Already Exists"));
  //
  //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       }
  //     }).catchError((e) {
  //       setState(() {
  //         isLoading = false;
  //       });
  //       SnackBar snackBar = SnackBar(content: Text(e.message));
  //
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     });
  //   }
  // }
}
