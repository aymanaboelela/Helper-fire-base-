import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:helper_fire_bace/auth/sign_whit_google/sign_whit_google.dart';
import 'package:helper_fire_bace/auth/whigets/customlogoauth.dart';
import 'package:helper_fire_bace/auth/whigets/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home_view/home_view.dart';
import 'signup.dart';
import 'whigets/custombuttonauth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 50),
              const CustomLogoAuth(),
              Container(height: 20),
              const Text("Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Container(height: 10),
              const Text("Login To Continue Using The App",
                  style: TextStyle(color: Colors.grey)),
              Container(height: 20),
              const Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(height: 10),
              CustomTextForm(
                  hinttext: "ُEnter Your Email",
                  onChanged: (data) => email = data),
              Container(height: 10),
              const Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(height: 10),
              CustomTextForm(
                hinttext: "ُEnter Your Password",
                onChanged: (data) => password = data,
              ),
              InkWell(
                onTap: () async {
                  if (email == null) {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'please Add Email',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                    return;
                  }

                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: email!);

                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      title: 'success',
                      desc: 'Please go to your email messages ',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  } catch (e) {
                    print(e);
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: ' the Email not found please sign Up',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.topRight,
                  child: const Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
          CustomButtonAuth(
              title: "login",
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email!, password: password!);

                  if (credential.user!.emailVerified) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  } else {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'Plese Verified emil',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  }
                  ////////////
                  ///
                  ///
                  ///
                  ///
                  ///
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'No user found for that email.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'Wrong password provided for that user.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  } else if (e.code == 'invalid-email') {
                    print('The email address is not valid.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'The email address is not valid.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  } else if (e.code == 'user-disabled') {
                    print('The user account has been disabled.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'The user account has been disabled.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  } else if (e.code == 'too-many-requests') {
                    print('Too many requests. Try again later.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'Too many requests. Try again later.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  } else if (e.code == 'operation-not-allowed') {
                    print('This operation is not allowed.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'This operation is not allowed.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  } else {
                    print('An unknown error occurred.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'An unknown error occurred.',
                      btnCancelOnPress: () {},
                      btnOkOnPress: () {},
                    )..show();
                  }
                }
              }),
          Container(height: 20),

          MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.red[700],
              textColor: Colors.white,
              onPressed: () {
                SignWhithGoogle.signInWithGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login With Google  "),
                  Image.asset(
                    "images/4.png",
                    width: 20,
                  )
                ],
              )),
          Container(height: 20),
          // Text("Don't Have An Account ? Resister" , textAlign: TextAlign.center,)
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
            },
            child: const Center(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Don't Have An Account ? ",
                ),
                TextSpan(
                    text: "Register",
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold)),
              ])),
            ),
          )
        ]),
      ),
    );
  }
}
