import 'package:flutter/material.dart';
import 'Colors.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DonationHistory extends StatefulWidget {
  @override
  _DonationHistoryState createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
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

  List<Map<dynamic, dynamic>> lists = [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    kMainRed,Color(0xFFBC002D),
                  ])
          ),
        ),
        title: Text("My Requests",style: TextStyle(fontFamily: 'nunito'),),
      ),
      body: FutureBuilder(
        // stream: dbRef.onValue,
          future:FirebaseDatabase().reference().child("User/${user.uid}/MyDonations").once(),
          builder:
              (context, AsyncSnapshot<DataSnapshot> snapshot) {
                // builder: (context, snapshot) {
                if (snapshot.hasData) {
                  lists.clear();
                  Map<dynamic, dynamic> values = snapshot.data.value;
                  if (values != null) {
                    values.forEach((key, values) {
                      lists.add(values);
                    });
                    FirebaseDatabase.instance.reference().child(
                        'User/${user.uid}').update({
                      "Donations": lists.length,
                    });
                    return new ListView.builder(
                        shrinkWrap: true,
                        itemCount: lists.length,
                        // physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {

                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10),
                                  child: Container(
                                    height: 109,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width - 20,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(15),
                                        border: Border.all(
                                            color: kMainRed,
                                            width: 1.2),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black
                                                .withOpacity(0.1),
                                            blurRadius: 8,
                                            offset: Offset(0, 4),
                                          )
                                        ]),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: 75,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: <Widget>[
                                              Text(
                                                "  ${lists[index]["BloodType"]
                                                    .toString()}",
                                                style: TextStyle(
                                                    fontSize: 22,
                                                    color: kMainRed,
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    fontFamily:
                                                    'nunito'),
                                              ),
                                              Padding(
                                                padding:
                                                const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  'Type',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black,
                                                      fontFamily:
                                                      'nunito'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: 35,
                                            child: VerticalDivider(
                                              color: Colors.black,
                                              thickness: 1,
                                            )),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: <Widget>[
                                            SizedBox(height: 5,),
//                                     SizedBox(height: 12,),
                                            Text(
                                              'Hospital Name :  ${lists[index]["Hospital"]
                                                  .toString()}',
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  fontFamily: 'nunito',
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Units Required :  ${lists[index]["Units"]
                                                  .toString()}',
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  fontFamily: 'nunito',
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Deadline :  ${lists[index]["Deadline"]
                                                  .toString()}',
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  fontFamily: 'nunito',
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              'Contact Number :  ${lists[index]["ContactNumber"]
                                                  .toString()}',
                                              style: TextStyle(
                                                  fontSize: 12.5,
                                                  fontFamily: 'nunito',
                                                  color: Colors.black),
                                            ),
                                            SizedBox(height: 5,),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width - 140,
                                              child: Text(
                                                'Status: ${lists[index]["Status"]
                                                    .toString()}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 11,
                                                    fontFamily: 'nunito',
                                                    color: kMainRed),
                                              ),
                                            ),
//                                      Row(
//                                        //mainAxisAlignment: MainAxisAlignment.end,
//                                        crossAxisAlignment: CrossAxisAlignment.end,
//                                        children: [
//                                          SizedBox(width: 80,),
//                                          Text(
//                                            'Status: ${lists[index]["Status"].toString()}',
//                                            style: TextStyle(
//                                              fontWeight: FontWeight.w700,
//                                                fontSize: 12.5,
//                                                fontFamily: 'nunito',
//                                                color: kMainRed),
//                                          ),
//                                        ],
//                                      ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        });
                  }
                  else {
                    return Container(child: Center(child: Text('Nothing to show')),);
                  }

                }
                return Container(child: Center(child: Text('Nothing to show')),);
              }

              ),
    );
  }
}
