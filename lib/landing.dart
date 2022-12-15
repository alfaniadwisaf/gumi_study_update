import 'package:flutter/material.dart';
import 'package:gumi_study/login.dart';
import 'package:gumi_study/register.dart';

class Landing extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  Text("Study with Gumi", style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Roboto-Bold",
                    color: Colors.purple,
                  )),
                  SizedBox(height: 30),
                  Image.asset("assets/images/landing_vektor.png", height: 237.2, width: 249.6),
                  
                  SizedBox(height: 35),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 131, 62, 122),
                            minimumSize: const Size.fromHeight(55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login(),));
                          },
                          child: Text("Login",
                          style: TextStyle(
                            fontFamily: "Roboto-Bold",
                            fontSize: 18,
                          )),
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            side: BorderSide(width: 1, color: Color.fromARGB(255, 131, 62, 122)),
                            minimumSize: const Size.fromHeight(55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register(),));
                          }, 
                          child: Text("Sign Up",
                          style: TextStyle(
                            fontFamily: "Roboto-Bold",
                            fontSize: 18,
                            color: Color.fromARGB(255, 131, 62, 122),
                          )),
                        ),    
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}