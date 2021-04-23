import 'package:flutter/material.dart';
import 'package:redlink/page_guide.dart';
import 'fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:async';

class OTPVerification extends StatefulWidget {
  final String phone;
  OTPVerification(this.phone);
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: Color(0xffffffff),
    //borderRadius: BorderRadius.circular(10.0),
    border: Border(
      bottom: BorderSide(width: 1.5, color:kMainRed),
    ),
  );
  final BoxDecoration pinPutDecoration1 = BoxDecoration(
    color: Color(0xffffffff),
    //borderRadius: BorderRadius.circular(10.0),
    border: Border(
      bottom: BorderSide(width: 1.5, color:kGrey),
    ),
  );

  final interval = const Duration(seconds: 1);

  final int maxtime = 30;

  int currentSeconds = 0;

  String get timerText =>
      '${((maxtime - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((maxtime - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      if (mounted) {
        setState(() {
          // print(timer.tick);
          currentSeconds = timer.tick;
          if (timer.tick >= maxtime) timer.cancel();
        });
      }
    });
  }

  @override
  void initState() {
    print(widget.phone);
    startTimeout();
    super.initState();
    startTimeout();
  }

  @override
  void dispose() {
    super.dispose();
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
                    top: 160,
                    left: 25,
                    height: 290,
                    width: 350,
                    child: FadeAnimation(1.2, Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50) ,bottomRight: Radius.circular(50)),
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
            SizedBox(height: 0,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 0,),
                  FadeAnimation(1.4, Text('Enter OTP\nVerification',style: GoogleFonts.montserrat(color:kMainRed,fontWeight: FontWeight.w700,fontSize: 22,),),
                  ),
                  SizedBox(height: 20,),
                  FadeAnimation(1.5, Text(
                    "Please provide the OTP code sent to your mail.",
                    style: GoogleFonts.montserrat(fontSize: 15, color: kDarkerGrey,fontWeight: FontWeight.w500),
                  )),
                  SizedBox(height: 23,),
                  FadeAnimation(1.6,
                    Center(
                      child: PinPut(
                        fieldsCount: 6,
                        textStyle: const TextStyle(
                            fontSize: 25.0, color: kMainRed),
                        eachFieldWidth: 20.0,
                        eachFieldHeight: 55.0,
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: pinPutDecoration1,
                        selectedFieldDecoration: pinPutDecoration,
                        followingFieldDecoration: pinPutDecoration1,
                        pinAnimationType: PinAnimationType.fade,
                        onSubmit: (pin) {}
                      ),
                    ),
                  ),
//                    Center(
//                      child: Padding(
//                        padding: EdgeInsets.only(
//                          top: 0,
//                        ),
//                        //  child: TextField(decoration: ,),
//                        child: Center(
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: [
//                              Padding(
//                                padding: const EdgeInsets.only(right: 10),
//                                child: Container(
//                                  width: 67,
//                                  height: 70,
//                                  child: TextField(
//                                    textAlign: TextAlign.center,
//                                    style: OptoTheme.kHeadingFont.copyWith(fontSize:25,color: Colors.black),
//                                    maxLength: 1,
//                                    decoration: InputDecoration(
//                                      filled: true,
//                                      fillColor: Colors.white,
//                                      counterText: "",
//                                      focusedBorder: OutlineInputBorder(
//                                          borderRadius: BorderRadius.circular(15),
//                                          borderSide: BorderSide(
//                                            color: Colors.white,
//                                          )),
//                                      enabledBorder: OutlineInputBorder(
//                                          borderRadius: BorderRadius.circular(15),
//                                          borderSide: BorderSide(
//                                              color: Colors.white
//                                            // color: Color(0xFF677897),
//                                          )),
//                                    ),
//                                    onChanged: (_) =>
//                                        FocusScope.of(context).nextFocus(),
//                                  ),
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(right: 10),
//                                child: Container(
//                                  width: 67,
//                                  height: 70,
//                                  child: TextField(
//                                    textAlign: TextAlign.center,
//                                    style: OptoTheme.kHeadingFont.copyWith(fontSize:25,color: Colors.black),
//                                    maxLength: 1,
//                                    decoration: InputDecoration(
//                                      counterText: "",
//                                      filled: true,
//                                      fillColor: Colors.white,
//                                      focusedBorder: OutlineInputBorder(
//                                          borderRadius: BorderRadius.circular(15),
//                                          borderSide: BorderSide(
//                                            color: Colors.white,
//                                          )),
//                                      enabledBorder: OutlineInputBorder(
//                                          borderRadius: BorderRadius.circular(15),
//                                          borderSide: BorderSide(
//                                              color: Colors.white
//                                            // color: Color(0xFF677897),
//                                          )),
//                                    ),
//                                    onChanged: (_) =>
//                                        FocusScope.of(context).nextFocus(),
//                                  ),
//                                ),
//                              ),
//                              Padding(
//                                padding: const EdgeInsets.only(right: 10),
//                                child: Container(
//                                  width: 67,
//                                  height: 70,
//                                  child: TextField(
//                                    textAlign: TextAlign.center,
//                                    style: OptoTheme.kHeadingFont.copyWith(fontSize:25,color: Colors.black),
//                                    maxLength: 1,
//                                    decoration: InputDecoration(
//                                      filled: true,
//                                      fillColor: Colors.white,
//                                      counterText: "",
//                                      focusedBorder: OutlineInputBorder(
//                                          borderRadius: BorderRadius.circular(15),
//                                          borderSide: BorderSide(
//                                              color: Colors.white
//                                          )),
//                                      enabledBorder: OutlineInputBorder(
//                                          borderRadius: BorderRadius.circular(15),
//                                          borderSide: BorderSide(
//                                              color: Colors.white
//                                            // color: Color(0xFF677897),
//                                          )),
//                                    ),
//                                    onChanged: (_) =>
//                                        FocusScope.of(context).nextFocus(),
//                                  ),
//                                ),
//                              ),
//                              Container(
//                                width: 67,
//                                height: 70,
//                                child: TextField(
//                                  textAlign: TextAlign.center,
//                                  style: OptoTheme.kHeadingFont.copyWith(fontSize:25,color: Colors.black),
//                                  maxLength: 1,
//                                  decoration: InputDecoration(
//                                    filled: true,
//                                    fillColor: Colors.white,
//                                    counterText: "",
//                                    focusedBorder: OutlineInputBorder(
//                                        borderRadius: BorderRadius.circular(15),
//                                        borderSide: BorderSide(
//                                          color: Colors.white,
//                                        )),
//                                    enabledBorder: OutlineInputBorder(
//                                        borderRadius: BorderRadius.circular(15),
//                                        borderSide: BorderSide(
//                                            color: Colors.white
//                                          // color: Color(0xFF677897),
//                                        )),
//                                  ),
//                                  onChanged: (_) =>
//                                      FocusScope.of(context).unfocus(),
//                                ),
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
//                    ),
                  FadeAnimation(1.6, Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              'Resend code in ',
                              style: GoogleFonts.montserrat(
                                  color: Colors.black45, fontSize: 13),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              timerText,
                              style:  GoogleFonts.montserrat(
                                  color: Colors.black45, fontSize: 13),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 50,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return PageGuide();
                          },
                        ),
                      );

                    },
                    child: FadeAnimation(1.7, Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kMainRed
                      ),
                      child: Center(
                        child: Text("Continue", style: TextStyle(color: Colors.white),),
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
