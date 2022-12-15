import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gumi_study/login.dart';
import 'package:gumi_study/user.dart';

class Profile extends StatefulWidget {
  final User user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  
  @override
  void initState() {
    controllerUsername.text = widget.user.username;
    controllerEmail.text = widget.user.email;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            "Profile",
            style: TextStyle(color: Colors.black,
            fontFamily: "Roboto-Bold",
            fontSize: 16,
            ),
            ),
            SizedBox(height: 30),
            Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 2,
              color: Colors.white,
              child: Column(
                children: [
                  IdentitasCard(title: "Username", value: widget.user.username,),
                  Container(height: 1, color: Colors.grey,),
                  IdentitasCard(title: "Email", value: widget.user.email,),
                ],
              ),
            ),
            SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 53,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFF2F2F2),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              Text(
                                "Log out",
                    style: TextStyle(color: Colors.black,
                    fontFamily: "Roboto-Bold",
                    fontSize: 14,
                    ),
                    ),
                    Icon(Icons.logout_outlined, color: Colors.grey,
                  )
                          ],),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
  }
}

class IdentitasCard extends StatelessWidget {
  final String title, value;
  const IdentitasCard({
    Key? key,
    required this.title,
    required this.value
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
          title,
          style: TextStyle(color: Colors.black,
          fontFamily: "Roboto-Bold",
          fontSize: 14,
          ),
          ),
          Text(
          value,
          style: TextStyle(color: Colors.grey,
          fontFamily: "Roboto-Bold",
          fontSize: 14,
          ),
          ),
        ],
      ),
    );
  }
}


