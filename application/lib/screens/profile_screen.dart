import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:application/model/user_model.dart';
import 'package:application/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'feed_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';
import 'package:application/model/user_model.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var devWidth = queryData.size.width;
    var devHeight = queryData.size.height;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile screen'),
          automaticallyImplyLeading: false,
        ),
        body: Column(children: [
          Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
              ),
              child: Stack(children: [
                Positioned(
                    child: Container(
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    image: const DecorationImage(
                      image: AssetImage('cover.jpeg'),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                )),
                const Positioned(
                    top: 80,
                    left: 30,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 43,
                      child: CircleAvatar(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.grey,
                        radius: 40,
                      ),
                    )),
                Positioned(top: 110, left: 125, child: Text(user!.uid))
              ])),
        ]));
  }
}
