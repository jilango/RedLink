import 'package:flutter/material.dart';
import 'package:redlink/page_guide.dart';
import 'home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:redlink/Colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

var _firbaseref = FirebaseDatabase().reference().child("requests");
class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final _auth = FirebaseAuth.instance;
  User user;

  bool isActive = false;
  @override
  void initState() {
    user=_auth.currentUser;
    super.initState();
    isActive = true;
  }

  @override
  void dispose() {
    super.dispose();
    isActive = false;
  }

  String name;
  String bloodType;
  String reason;
  String unitsReq;
  String deadline;
  String hospitalName;
  String personIncharge;
  String contactNumber;

  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Request Confirmed'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                Text('Hospital Name : '+hospitalName,style: TextStyle(fontFamily: 'nunito'),),
                Text('Units Required : '+unitsReq,style: TextStyle(fontFamily: 'nunito'),),
                Text('Deadline : '+deadline,style: TextStyle(fontFamily: 'nunito'),),
                Text('Contact Number : '+contactNumber,style: TextStyle(fontFamily: 'nunito'),),
              ],
            ),
          ),
          actions: [
            new FlatButton(

              child: new Text('Okay',style:TextStyle(color: Colors.red) ,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PageGuide();
                    },
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(24) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 30,),
                Text("Find a Donor",style: GoogleFonts.montserrat(fontWeight: FontWeight.w500,fontSize: 20,color:Colors.black),),
                SizedBox(height: 25,),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: new BoxDecoration(
                      color:  kLightGrey,
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    style: GoogleFonts.montserrat(
                        color: kMainRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    cursorColor: kMainRed,
                    decoration: InputDecoration(
                      isDense: true,
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
                      labelText: "Patient Name",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kMainRed.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: new BoxDecoration(
                      color:  kLightGrey,
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        bloodType = value;
                      });
                    },
                    style: GoogleFonts.montserrat(
                        color: kMainRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    cursorColor: kMainRed,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.opacity,
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
                      labelText: "Blood Type",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kMainRed.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
               SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: new BoxDecoration(
                      color:  kLightGrey,
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        reason = value;
                      });
                    },
                    style: GoogleFonts.montserrat(
                        color: kMainRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    cursorColor: kMainRed,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.insert_comment,
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
                      labelText: "Reason",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kMainRed.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 15,),

                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: new BoxDecoration(
                      color:  kLightGrey,
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        unitsReq = value;
                      });
                    },
                    style: GoogleFonts.montserrat(
                        color: kMainRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    cursorColor: kMainRed,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.opacity,
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
                      labelText: "Units Required",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kMainRed.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: new BoxDecoration(
                      color:  kLightGrey,
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        deadline = value;
                      });
                    },
                    style: GoogleFonts.montserrat(
                        color: kMainRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    cursorColor: kMainRed,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.error_outline,
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
                      labelText: "Deadline",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kMainRed.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: new BoxDecoration(
                      color:  kLightGrey,
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        hospitalName = value;
                      });
                    },
                    style: GoogleFonts.montserrat(
                        color: kMainRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    cursorColor: kMainRed,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.local_hospital,
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
                      labelText: "Hospital",
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kMainRed.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: new BoxDecoration(
                      color:  kLightGrey,
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        personIncharge= value;
                      });
                    },
                    style: GoogleFonts.montserrat(
                        color: kMainRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    cursorColor: kMainRed,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.contacts,
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
                      labelText: 'Person in charge',
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kMainRed.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  height: 55.0,
                  decoration: new BoxDecoration(
                      color:  kLightGrey,
                      borderRadius: new BorderRadius.circular(20.0)),
                  child: TextFormField(
                    maxLines: 1,
                    onChanged: (value) {
                      setState(() {
                        contactNumber= value;
                      });
                    },
                    style: GoogleFonts.montserrat(
                        color: kMainRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    cursorColor: kMainRed,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.phone,
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
                      labelText: 'Contact Number',
                      labelStyle: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: kMainRed.withOpacity(0.8),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                GestureDetector(
                  onTap: ()async{
                    FirebaseDatabase.instance.reference().child('User/${user.uid}/MyRequests/').push().set({
                      "PatientName": name,
                      "BloodType": bloodType,
                      "Reason": reason,
                      "Units": unitsReq,
                      "Deadline": deadline,
                      "Hospital": hospitalName,
                      "PersonInCharge": personIncharge,
                      "ContactNumber": contactNumber,
                      "Status": 'pending'
                    }).then((_) {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text('Your Request posted')));
                      // ageController.clear();
                      // nameController.clear();
                    }).catchError((onError) {
                      Scaffold.of(context)
                          .showSnackBar(SnackBar(content: Text(onError)));
                    });
//                    _firbaseref.push().set({
//                      "name": name,
//                      "bloodtype": bloodType,
//                      "reason": reason,
//                      "units": unitsReq,
//                      "deadline": deadline,
//                      "hospital": hospitalName,
//                      "personincharge": personIncharge,
//                      "contactnumber": contactNumber,
//                    })


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
                      child: Text("Request", style: TextStyle(color: Colors.white),),
                    ),
                  )),
              ],

            ),

        ),
      ),
    );
  }
}