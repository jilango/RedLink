
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:redlink/Colors.dart';
import 'package:redlink/OTPVerification.dart';
import 'package:redlink/page_guide.dart';
import 'fade_animation.dart';
import 'package:international_phone_input/international_phone_input.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String phoneNumber;
  String phoneIsoCode = '+91';

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      print(phoneNumber);
      phoneIsoCode = isoCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 450,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 40,
                    right: 15,
                    height: 70,
                    width: 70,
                    child: FadeAnimation(1, Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) ,bottomRight: Radius.circular(50)),
                          image: DecorationImage(
                              image: AssetImage('images/logo.png'),
                              fit: BoxFit.fill
                          )
                      ),
                    )),
                  ),
                  Positioned(
                    top: 170,
                    left: 25,
                    height: 270,
                    width: 350,
                    child: FadeAnimation(1.2, Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) ,bottomRight: Radius.circular(50)),
                            image: DecorationImage(
                                image: AssetImage('images/Signin.png'),
                                fit: BoxFit.scaleDown
                            )
                        ),
                      ),
                    )),
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10,),
                  FadeAnimation(1.4, Text('Sign in using phone\nnumber',style: GoogleFonts.montserrat(color:kMainRed,fontWeight: FontWeight.w700,fontSize: 22,),),
                  ),
                  SizedBox(height: 20,),
                  FadeAnimation(1.5, Text(
                    "Enter your phone number below",
                    style: GoogleFonts.montserrat(fontSize: 15, color: kDarkerGrey,fontWeight: FontWeight.w500),
                  )),
                  SizedBox(height: 30,),
                  FadeAnimation(1.6,
                     InternationalPhoneInput(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kLightGrey,
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(width: 1, color: kGrey),
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                width: 1,
                              )),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                width: 1, color: kGrey),
                          ),
                          hintText: "  Phone Number",
                          hintStyle: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: kDarkGrey,
                              fontWeight: FontWeight.w400),
                        ),
                        onPhoneNumberChange: onPhoneNumberChange,
                        initialPhoneNumber: phoneNumber,
                        initialSelection: '+91',
                        showCountryCodes: true
                    ),
                  ),
                  SizedBox(height: 50,),
                  FadeAnimation(1.7,
                     GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return OTPVerification(phoneNumber);
                            },
                          ),
                        );

                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kMainRed
                        ),
                        child: Center(
                          child: Text("Send Request", style: TextStyle(color: Colors.white),),
                        ),
                      )),
                  ),
                  SizedBox(height: 25,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

