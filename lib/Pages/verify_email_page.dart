import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firehub/Pages/home_page.dart';
import 'package:firehub/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appStuff/appColors.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState(){
    super.initState();

    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 3),
         (_) => checkEmailVerified());
    } 
    
  }
  Future checkEmailVerified() async {
    //call after email after verification!
    await FirebaseAuth.instance.currentUser!.reload();

   setState(() {
     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
   });

   if (isEmailVerified) timer?.cancel();
   
   }

  @override
  void dispose(){
    timer?.cancel();

    super.dispose();
  }
   Future sendVerificationEmail() async {
    try{
      final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();

    setState(() => canResendEmail = false);
    await Future.delayed(Duration(seconds: 5));
    setState(() => canResendEmail = true);
    }
    catch (e) {
      Utils.showSnackBar(e.toString());
    }
   }
  @override
  Widget build(BuildContext context) => isEmailVerified
  ? const HomePage()
  : Scaffold(
    backgroundColor: Colors.black,
    appBar: AppBar(
      elevation: 0,
      title: Text('Verify Email',
      style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
      ),
    ),
    body:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('A verificaton email has been sent to your email',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        ),
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
                  onPressed: sendVerificationEmail,
                  child: Text(
                    'Resend Email',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.purple),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20)),
                child: MaterialButton(
                  onPressed: sendVerificationEmail,
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
      ],
    ),
  );
  
 
}