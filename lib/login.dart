import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gumi_study/colors.dart';
import 'package:gumi_study/landing.dart';
import 'package:gumi_study/register.dart';
import 'package:gumi_study/homepage.dart';
import 'package:gumi_study/user.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context){
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void login(String email, password) async {
      try {
        var response = await Dio().get('http://localhost:3004/user?email=' +
            email +
            '&password=' +
            password);
        if (response.data.length > 0) {
          int id = response.data[0]['id'];
          String email = response.data[0]['email'];
          String username = response.data[0]['username'];
          String pass = response.data[0]['password'];

          print("Login success");
          Navigator.push( context, MaterialPageRoute(builder: (context) => Homepage(user: User(id: id, email: email, username: username, password: pass))));
        } else {
          final snackBar = SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Invalid email or password',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                color: Colors.white,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            'invalid username or password',
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
        onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Landing(),));},
          child: Icon(Icons.arrow_back, color: purple,),
          ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    TextField(
                      controller: controllerEmail,
                      style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: purple)
                    ),
                    labelText: "Email Address",
                    labelStyle:  const TextStyle(
                      
                      color: Colors.purple,
                    ),
                    hintText: "Email Address",
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: Colors.purple,
                    ),
                    prefixIcon: Icon(Icons.person, color: purple),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: controllerPass,
                  style: const TextStyle(
                    fontFamily: 'Roboto-Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: purple)
                        ),
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      color: Colors.purple,
                    ),
                    hintText: "Password",
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Roboto-Light',
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(Icons.lock, color: purple),
                  ),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 16,
                      fontFamily: 'Roboto-Light',
                    ),
                  ),
                ),
                
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    login(controllerEmail.text, controllerPass.text);
                  },
                  child: const Text("Get Started!",
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18,
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 131, 62, 122),
                      minimumSize: const Size.fromHeight(35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Doesn't have an account?",
                        style: TextStyle(
                          fontFamily: 'Roboto-Light',
                          fontSize: 16,
                          color: Colors.purple,
                        )),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                        
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold',
                            fontSize: 16,
                            
                            color: Colors.purple,
                          )),
                    ),
                  ],
                ),
              ],
            ),
              )
            ],
      )
      ),
    )    
    );
  }
}