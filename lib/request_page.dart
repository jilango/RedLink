import 'package:flutter/material.dart';
import 'package:redlink/page_guide.dart';
import 'home_page.dart';
import 'package:redlink/Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
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
                SizedBox(height: 30,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Patient Name',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainRed),
                    ),
                  ),
                    onChanged: (value){
                    name=value;
                  },
                ),
                SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Blood Type',
                    hintStyle: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainRed),
                    ),
                  ),
                    onChanged: (value){
                    bloodType=value;
                  },
                ),SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Reason',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainRed),
                    ),
                  ),
                  onChanged: (value){
                    reason=value;
                  },
                ),SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Units Required',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainRed),
                    ),
                  ),
                  onChanged: (value){
                    unitsReq=value;
                  },
                ),SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Deadline',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainRed),
                    ),
                  ),
                  onChanged: (value){
                    deadline=value;
                  },
                ),SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Hospital',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainRed),
                    ),
                  ),
                  onChanged: (value){
                    hospitalName=value;
                  },
                ),SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Person in charge',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainRed),
                    ),
                  ),
                  onChanged: (value){
                    personIncharge=value;
                  },
                ),SizedBox(height: 20,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Contact Number',
                    hintStyle: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black.withOpacity(0.6)
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kDarkGrey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: kMainRed),
                    ),
                  ),
                  onChanged: (value){
                    contactNumber=value;
                  },
                ),
                SizedBox(height: 40,),
                GestureDetector(
                  onTap: (){
                    _showcontent();

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