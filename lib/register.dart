import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gumi_study/colors.dart';
import 'package:gumi_study/homepage.dart';
import 'package:gumi_study/landing.dart';
import 'package:gumi_study/login.dart';

class Register extends StatefulWidget{
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  @override
  Widget build(BuildContext context){
    // TextEditingController emailController = TextEditingController();
    // TextEditingController pwdController = TextEditingController();

    // var email = "alfaniadwisaf14@gmail.com";
    // var pwd = "1412";
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  void register(String email, username, password) async {
    try {
      var response = await Dio().post('http://localhost:3004/user',
          data: {"email": email, "username": username, "password": password});
      if (response.data.length > 0) {
        print("Account created successfully");
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login(),));
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage()));
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
        onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Landing(),));},
          child: Icon(Icons.arrow_back, color: Colors.black,),
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
                    // SizedBox(height: 5),
                    // Align(
                    // alignment: Alignment.centerLeft,
                    // child: Text("Register",
                    // textAlign: TextAlign.left,
                    // style: TextStyle(
                    //   fontFamily: 'Poppins Bold',
                    //   fontWeight: FontWeight.w600,
                    //   fontSize: 30,
                    //   color: Colors.black,
                    // )),
                    // ),
                    // Align(
                    // alignment: Alignment.centerLeft,
                    // child: Text("Register now",
                    // textAlign: TextAlign.left,
                    // style: TextStyle(
                    //   fontFamily: 'Poppins Light',
                    //   fontSize: 16,
                    //   color: Colors.grey,
                    // )),
                    // ),
                    SizedBox(height: 15),
                    TextField(
                      controller: controllerUsername,
                      style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: purple)
                    ),
                    labelText: "Username",
                    labelStyle:  const TextStyle(
                      
                      color: Colors.purple,
                    ),
                    hintText: "Username",
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: Colors.purple
                    ),
                    prefixIcon: Icon(Icons.person_outline, color: purple),
                  ),
                ),
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
                      color: Colors.purple
                    ),
                    prefixIcon: Icon(Icons.person, color: purple),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: controllerPass,
                  style: const TextStyle(
                    fontFamily: 'Poppins Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: purple),
                    ),
                    labelText: "Password",
                    labelStyle:  const TextStyle(
                      
                      color: Colors.purple,
                    ),
                    hintText: "Password",
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: Colors.purple
                    ),
                    prefixIcon: Icon(Icons.lock, color: purple),
                  ),
                ),
                // const SizedBox(height: 10),
                // const Align(
                //   alignment: Alignment.topLeft,
                //   child: Text(
                //     "Already have an account?",
                //     style: TextStyle(
                //       color: Colors.purple,
                //       fontSize: 16,
                //       fontFamily: 'Poppins Light',
                //     ),
                //   ),
                // ),
                // const SizedBox(),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // if (emailController.text == email) {
                    //   if (pwdController.text == pwd) {
                    //     Navigator.pushReplacement(context,
                    //         MaterialPageRoute(builder: (context) =>
                    //             homepage()));
                    //   } else {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //         const SnackBar(
                    //           backgroundColor: Colors.red,
                    //           content: Text("Password Salah"),
                    //         ));
                    //   }
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //     backgroundColor: Colors.red,
                  //       content: Text("Email Salah"),
                  //     ));
                  //   }
                  register(controllerEmail.text, controllerUsername.text, controllerPass.text);
                  },
                  child: const Text("Get Started!",
                      style: TextStyle(
                        fontFamily: 'Roboto-Bold',
                        fontSize: 18,
                      )),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                      minimumSize: const Size.fromHeight(35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(
                          fontFamily: 'Roboto-Light',
                          fontSize: 16,
                          color: Colors.purple,
                        )),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context, 
                        MaterialPageRoute(builder: (context) => Login()),
                        );
                    },
                      child: const Text("Login",
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
//                     Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text("Email",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       fontFamily: 'Poppins Light',
//                       fontSize: 16,
//                       color: Colors.black,
//                     )),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextField(
//                       controller: emailController,
//                       style: const TextStyle(
//                         fontFamily: 'Poppins Light',
//                         fontSize: 16,
//                       ),
//                       decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         labelText: "Email",
//                         hintText: "",
//                         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                         hintStyle: const TextStyle(
//                           fontFamily: 'Poppins Light',
//                           fontSize: 16,
//                   ),
//                 ),
//               ),
//                     ),
//                     Align(
//                     alignment: Alignment.centerLeft,
//                     child: TextField(
//                       controller: pwdController,
//                     style: const TextStyle(
//                       fontFamily: 'Poppins Light',
//                       fontSize: 16,
//                       color: Colors.black,
//                     ),
//                     ),
//                 ),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: TextField(
//                       controller: null,
//                       style: TextStyle(
//                         fontFamily: 'Poppins Light',
//                         fontSize: 16,
//                       ),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         labelText: "Password",
//                         hintText: "Password",
//                         contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//                         hintStyle: const TextStyle(
//                           fontFamily: 'Poppins Light',
//                           fontSize: 16,
//                           color: Colors.grey,
//                         ),
//                       ),
//                   ),
//                     ),
//                   TextButton(
//                   onPressed: () {
//                   //forgot password screen
//                    },
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: const Text('Forgot Password?',
//                       style: TextStyle(
//                         color: Colors.orangeAccent,
//                       ),),
//                   ),
//                   ),
//                     SizedBox(height: 50),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: Column(
//                         children: <Widget>[
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               primary: Colors.orangeAccent,
//                               minimumSize: const Size.fromHeight(55),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                             onPressed: (){
//                             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>homepage(setTheme: setTheme,),));
//                             }, 
//                             child: Text("Login",
//                             style: TextStyle(
//                               fontFamily: 'Poppins Bold',
//                               fontSize: 18,
//                             )),                            
//                           ),
//                           SizedBox(height: 20),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               const Text('Dont have an account yet?',
//                               textAlign: TextAlign.center),
//                               TextButton(
//                                 child: const Text(
//                                   'Sign Up',
//                                   style: TextStyle(
//                                     fontSize: 15,
//                                     color: Colors.orangeAccent),
//                                 ),
//                                 onPressed: () {
//                                   //signup screen
//                                 },  
//                               ),
//                             ]
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
  }
}