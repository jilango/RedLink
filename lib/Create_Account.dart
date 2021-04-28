import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:redlink/Colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlink/Login_Page.dart';
import 'package:redlink/fade_animation.dart';
import 'phone_login_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';

class SignUp extends StatefulWidget {
  static String id = 'signup_page';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String userName;
  String number;
  bool showSpinner = false;
  String errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 40,
                      right: 15,
                      height: 70,
                      width: 70,
                      child: FadeAnimation(1, Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                bottomRight: Radius.circular(50)),
                            image: DecorationImage(
                                image: AssetImage('images/logo.png'),
                                fit: BoxFit.fill
                            )
                        ),
                      )),
                    ),
                    Positioned(
                      top: 80,
                      left: 25,
                      height: 250,
                      width: 350,
                      child: FadeAnimation(1.2, Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  bottomRight: Radius.circular(50)),
                              image: DecorationImage(
                                  image: AssetImage('images/otp.png'),
                                  fit: BoxFit.scaleDown
                              )
                          ),
                        ),
                      )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(1.4, Text('Create Account',
                      style: GoogleFonts.montserrat(color: kMainRed,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,),),
                    ),
                    SizedBox(height: 10,),
                    FadeAnimation(1.5, Text(
                      "Enter the details below",
                      style: GoogleFonts.montserrat(fontSize: 13,
                          color: kDarkerGrey,
                          fontWeight: FontWeight.w500),
                    )),
                    SizedBox(height: 30,),
                    FadeAnimation(1.6,
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                  color: kLightGrey,
                                  borderRadius: new BorderRadius.circular(20.0)),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    userName = value;
                                  });
                                },
                                style: GoogleFonts.montserrat(
                                    color: kMainRed,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                cursorColor: kMainRed,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color:  kMainRed,
                                    size: 20,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  labelText: "FULL NAME",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: kMainRed.withOpacity(0.8),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                  color:  kLightGrey,
                                  borderRadius: new BorderRadius.circular(20.0)),
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value) {
                                  email = value;
                                },
                                style: GoogleFonts.montserrat(
                                    color: kMainRed,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                cursorColor: kMainRed,
                                decoration: InputDecoration(
                                  contentPadding:
                                  EdgeInsets.fromLTRB(5.0, 1.0, 5.0, 0),
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color:  kMainRed,
                                    size: 20,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  labelText: "EMAIL ID",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: kMainRed.withOpacity(0.8),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                  color:  kLightGrey,
                                  borderRadius: new BorderRadius.circular(20.0)),
                              child: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    number = value;
                                  });
                                },
                                style: GoogleFonts.montserrat(
                                    color: kMainRed,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                cursorColor: kMainRed,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.phone_android,
                                    color:  kMainRed,
                                    size: 20,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  labelText: "PHONE NUMBER",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: kMainRed.withOpacity(0.8),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              alignment: Alignment.center,
                              height: 55.0,
                              decoration: new BoxDecoration(
                                  color:  kLightGrey,
                                  borderRadius: new BorderRadius.circular(20.0)),
                              child: TextFormField(
                                onChanged: (value) {
                                  password = value;
                                },
                                obscureText: true,
                                style: GoogleFonts.montserrat(
                                    color: kMainRed,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                                cursorColor: kMainRed,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color:  kMainRed,
                                    size: 20,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      borderSide: BorderSide(
                                        width: 1,
                                      )),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.transparent),
                                  ),
                                  labelText: "PASSWORD",
                                  labelStyle: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      color: kMainRed.withOpacity(0.8),
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                          ],
                        )
                    ),
                    SizedBox(height: 5,),
                    FadeAnimation(1.7,TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneLoginPage()));
                    }, child: Center(child: Text('Sign in using phone number',style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: kDarkerGrey.withOpacity(0.8),
                        fontWeight: FontWeight.w500),))),),
                    SizedBox(height: 13,),
                    FadeAnimation(1.7,
                      MaterialButton(
                        onPressed: () async {
                          setState(() {
                            showSpinner = true;
                          });
                          try {
                            final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                            if (newUser != null) {
                              User user = newUser.user;
                              user.sendEmailVerification();
                              await user
                                  .updateProfile(
                                displayName: userName,
                              )
                                  .then((value) {
                                FirebaseDatabase.instance
                                    .reference()
                                    .child('User/${user.uid}')
                                    .update({
                                  'Email': email,
                                  'Name': userName,
                                  'DefaultAdd': null,
                                  'Phone': number
                                });
                              });
                            }
                            _showDialog1(context, "Verification link has been sent to your mail");
//                            Fluttertoast.showToast(
//                                msg:
//                                "Verification link has been sent to your mail",
//                                toastLength: Toast.LENGTH_SHORT,
//                                gravity: ToastGravity.BOTTOM,
//                                timeInSecForIosWeb: 1,
//                                backgroundColor: Colors.blueGrey,
//                                textColor: Colors.white,
//                                fontSize: 14.0);
                            //Navigator.pushReplacementNamed(context, Login.id);
                            setState(() {
                              showSpinner = false;
                            });
                          } catch (e) {
                            switch (e.code) {
                              case "email-already-in-use":
                                errorMsg =
                                "The email address is already in use by another account.";
                                break;
                              case "wrong-password":
                                errorMsg = "Incorrect password.";
                                break;
                              case "user-not-found":
                                errorMsg = "No user found with this email.";
                                break;
                              case "user-not-found":
                                errorMsg = "No user found with this email.";
                                break;
                              case "weak-password":
                                errorMsg = e.message;
                                break;
                              case "operation-not-allowed":
                                errorMsg =
                                "Too many requests. Try again later.";
                                break;
                              case "invalid-email":
                                errorMsg = "Email address is invalid.";
                                break;
                              default:
                                errorMsg = "Sign Up failed. Please try again.";
                            }
                            _showDialog1(context, errorMsg);
                            print(e);
                          }
                        },
                        child: Center(
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: new BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(1, 2),
                                      blurRadius: 6,
                                      color: Colors.black12)
                                ],
                                color: kMainRed,
                                borderRadius: new BorderRadius.circular(10.0)),
                            child: Center(
                              child: Text(
                                "Register",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog1(BuildContext context, String errorMsg) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text('Alert'),
          content: Text(errorMsg),
          actions: <Widget>[
            FlatButton(
              child:  Text('Ok',style: GoogleFonts.montserrat(fontSize: 14,color: kMainRed,fontWeight: FontWeight.w600),),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
