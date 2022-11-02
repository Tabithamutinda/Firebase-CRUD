import 'package:firebase_auth/firebase_auth.dart';
import 'package:firehub/Pages/login_page.dart';
import 'package:firehub/appStuff/appColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../widgets/utils.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  var confirm = TextEditingController();
  var password = TextEditingController();
  var email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, bottom: 30),
              child: Row(
                children: [
                  // Container(
                  //   height: 40,
                  //   width: 40,
                  //   decoration: BoxDecoration(
                  //     border: Border.all(width: 1.0, color: Colors.white),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: const Padding(
                  //     padding: EdgeInsets.only(left: 8),
                  //     child: Icon(Icons.arrow_back_ios, color: Colors.white),
                  //   ),
                  // ),
                  
                  Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Email address',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8),
              child: SizedBox(
                child: FormBuilderTextField(
                  controller: email,
                  name: 'email',
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Email address can\'t be empty';
                    if (value.length < 8) return 'Too short';
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    filled: true,
                    fillColor: Colors.grey[350],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    hintText: 'Enter your email address',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'Password',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8),
              child: SizedBox(
                child: FormBuilderTextField(
                  controller: password,
                  name: 'password',
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Password can\'t be empty';
                    if (value.length < 6) return 'Too short';
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    filled: true,
                    fillColor: Colors.grey[350],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    hintText: 'Enter your password',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 24.0),
            //   child: Text(
            //     'Confirm password',
            //     style: GoogleFonts.inter(
            //       color: Colors.white,
            //       fontSize: 14,
            //       fontWeight: FontWeight.w400,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8),
            //   child: SizedBox(
            //     child: FormBuilderTextField(
            //       controller: confirm,
            //       name: 'password',
            //       validator: (value) {
            //         if (value == null || value.isEmpty)
            //           return 'Password can\'t be empty';
            //         if (value.length < 6) return 'Too short';
            //         return null;
            //       },
            //       decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.symmetric(
            //             horizontal: 16, vertical: 20),
            //         filled: true,
            //         fillColor: Colors.grey[350],
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //         enabledBorder: const OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.white, width: 1.0),
            //         ),
            //         hintText: 'Confirm your password',
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: signUp,
                  child: Text(
                    'Create account',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            Center(
              child: Text.rich(TextSpan(
                  text: 'Already have an account?  ',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                        text: 'Log in',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const LoginPage()));
                          },
                        style: GoogleFonts.inter(
                          color: AppColors.lightpurple,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ))
                  ])),
            ),
          ],
        ),
      ),
    );
  }
  Future signUp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator(),));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email.text.trim(),
       password: password.text.trim());
  }
    on FirebaseAuthException catch (e) {
       Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
}
}
