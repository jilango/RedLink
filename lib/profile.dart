import 'package:flutter/material.dart';
import 'package:redlink/compatability.dart';
import 'package:redlink/home_page.dart';
import 'constants.dart';
import 'package:redlink/Colors.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

var _firebaseref = FirebaseDatabase().reference().child('User');

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}
var name;
var req;
var donations;
var dob;
var btype;
var mc;
var contact;
var userid;

class _ProfileState extends State<Profile> {
  int height = 173;
  int age = 20;
  int weight = 58;
  String name;

  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  bool isActive = false;
  @override
  void initState() {
    loggedInUser=_auth.currentUser;
    super.initState();
    isActive = true;
    userid=loggedInUser.uid;
    _firebaseref.child("${userid}").once().then((DataSnapshot snapshot) {
      name = snapshot.value["Name"].toString();
      req = snapshot.value["Requests"].toString();
      donations = snapshot.value["Donations"].toString();
      dob = snapshot.value["Dob"].toString();
      btype = snapshot.value["BloodType"].toString();
      mc = snapshot.value["MedCondition"].toString();
      contact = snapshot.value["Phone"].toString();
      setState(() {});
    });


  }

  @override
  void dispose() {
    super.dispose();
    isActive = false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(45),
        ),
        gradient: LinearGradient(
            colors: [Color(0xFFE53033),Color(0xFFBC002D), ],
            tileMode: TileMode.mirror,
            begin: Alignment.topRight,
            end: Alignment.topLeft,

        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 0, top: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.2), width: 2)),
                          padding: EdgeInsets.all(5.5),
                          child: CircleAvatar(
                            radius: 45.0,
                            backgroundImage: AssetImage('images/profile.jpg'),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             name,
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(height: 2,),
                            Text(
                              'REDLINK ID',
                              style: GoogleFonts.montserrat(
                                  fontSize: 10,letterSpacing: 4,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(width: 75,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RoundIconButton(icon: Icons.mode_edit, onPressed: (){
                            //EDIT PROFILE
                          }),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(children: [
                      SizedBox(width: 15,),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color:Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(child: Text('$req Requests',style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),)),
                        ),
                      ),
                      SizedBox(width: 15,),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color:Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Center(child: Text('$donations Donations',style: GoogleFonts.montserrat(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),)),
                        ),
                      ),
                      SizedBox(width: 25,),
                    ],),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFfffffff),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(45),
                    topLeft: Radius.circular(45)),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 7.7, top: 20),
                          child: Container(
                            height: 65,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xFFffffff),Color(0xFFFfffff), ],
                                    tileMode: TileMode.clamp
                                ),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4),
                                  )
                                ]
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 15,),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.calendar_today,
                                          color: Color(0xFFBC002D),
                                          size: 20,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Date of Birth',
                                              style: kLabelTextStyle,
                                            ),
                                            SizedBox(height: 3,),
                                            Text(dob,
                                              style: kNumberTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  //SizedBox(height: 1,),

                                ],
                              ),
                            ),
                            //curveType: CurveType.convex,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7.7, right: 25, top: 20),
                          child: Container(
                            height: 65,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xFFffffff),Color(0xFFFfffff), ],
                                    tileMode: TileMode.clamp
                                ),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 10,
                                    spreadRadius: 0,
                                    offset: Offset(0, 4),
                                  )
                                ]
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(width: 15,),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.opacity,
                                          color: Color(0xFFBC002D),
                                          size: 23,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Blood Type',
                                              style: kLabelTextStyle,
                                            ),
                                            SizedBox(height: 3,),
                                            Text(btype,
                                              style: kNumberTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                  //SizedBox(height: 1,),

                                ],
                              ),
                            ),
                            //curveType: CurveType.convex,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25.0, right: 25.0, top: 20),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFffffff),Color(0xFFFfffff), ],
                              tileMode: TileMode.clamp
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.baseline,
                            //textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                             // Icon(Icons.height,size: 20,color: Color(0xFFBC002D),),
                              Text(
                                'Height : ',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                height.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                ' cm',
                                style: kLabelTextStyle,
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 9.0),
                              activeTrackColor: kMainRed,
                              thumbColor: kMainRed,
                              overlayColor: Color(0x222962F7),
                              inactiveTrackColor: Colors.grey,
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 20.0),
                            ),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                }),
                          )
                        ],
                      ),
                      //curveType: CurveType.convex,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 7.7, top: 20),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xFFffffff),Color(0xFFFfffff), ],
                                    tileMode: TileMode.clamp
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromRGBO(49, 39, 79, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  )
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Weight : ',
                                      style: kLabelTextStyle,
                                    ),
                                    Text(
                                      weight.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                      icon: Icons.remove,
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 0,
                                    ),
                                    RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            //curveType: CurveType.convex,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 7.7, right: 25, top: 20),
                          child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Color(0xFFffffff),Color(0xFFFfffff), ],
                                    tileMode: TileMode.clamp
                                ),
                                borderRadius: BorderRadius.circular(15),
                                color: Color.fromRGBO(49, 39, 79, 1),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  )
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Age : ',
                                      style: kLabelTextStyle,
                                    ),
                                    Text(
                                      age.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                      icon: Icons.remove,
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                    ),
                                    SizedBox(width: 2.0),
                                    RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            //curveType: CurveType.convex,
                          ),
                        ),
                      ),
                    ],
                  ),


                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25, top: 20),
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFffffff),Color(0xFFFfffff), ],
                              tileMode: TileMode.clamp
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 4),
                            )
                          ]
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.local_hospital,
                                    color: Color(0xFFBC002D),
                                    size: 22,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Medical Condition',
                                        style: kLabelTextStyle,
                                      ),
                                      SizedBox(height: 3,),
                                      Text(mc,
                                        style: kNumberTextStyle,
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            //SizedBox(height: 1,),

                          ],
                        ),
                      ),
                      //curveType: CurveType.convex,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25, top: 20),
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFffffff),Color(0xFFFfffff), ],
                              tileMode: TileMode.clamp
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 4),
                            )
                          ]
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.phone,
                                    color: Color(0xFFBC002D),
                                    size: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Contact',
                                        style: kLabelTextStyle,
                                      ),
                                      SizedBox(height: 3,),
                                      Text('+91 $contact',
                                        style: kNumberTextStyle,
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            //SizedBox(height: 1,),

                          ],
                        ),
                      ),
                      //curveType: CurveType.convex,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25, top: 20),
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFffffff),Color(0xFFFfffff), ],
                              tileMode: TileMode.clamp
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 4),
                            )
                          ]
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 15,),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(
                                    Icons.history,
                                    color: Color(0xFFBC002D),
                                    size: 23,
                                  ),
                                ),
                                Text(
                                  '  Donation History',
                                  style: kLabelTextStyle.copyWith(color: kMainRed,fontSize: 14),
                                ),


                              ],
                            ),
                            //SizedBox(height: 1,),

                          ],
                        ),
                      ),
                      //curveType: CurveType.convex,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16),
                    child: SizedBox(
                      height: 1.0,
                      width: double.infinity,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CompatabilityPage();
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:25.0,right: 25.0,top: 20,bottom: 15),
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [kMainRed,kMainRed ],
                                tileMode: TileMode.clamp
                            ),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.15),
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              )
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 16,),
                            Center(
                              child: Text(
                                '  Who can I donate to?',
                                style: TextStyle(fontSize: 17,fontFamily: 'nunito',fontWeight: FontWeight.bold,color: Colors.white.withOpacity(0.9)),

                              ),
                            ),

                            //SizedBox(height: 1,),

                          ],
                        ),
                        //curveType: CurveType.convex,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CompatabilityPage();
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:25.0,right: 25.0,top: 0,bottom: 10),
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(color: kMainRed),
                            borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(height: 16,),
                            Center(
                              child: Text(
                                'Logout',
                                style: TextStyle(fontSize: 17,fontFamily: 'nunito',fontWeight: FontWeight.bold,color: kMainRed),

                              ),
                            ),

                            //SizedBox(height: 1,),

                          ],
                        ),
                        //curveType: CurveType.convex,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 3.0,
      child: Icon(icon,color: Colors.white,),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        width: 35.0,
        height: 35.0,
      ),
      fillColor: Color(0xffE53033),
    );
  }
}