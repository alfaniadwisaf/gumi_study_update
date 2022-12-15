import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gumi_study/colors.dart';
import 'package:gumi_study/detail.dart';

class Comments extends StatefulWidget{
  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {

  @override
  Widget build(BuildContext context){
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerComment = TextEditingController();

  void comments (String name, comment) async {
      try {
        // var response = await Dio().get('http://localhost:3004/user?email=' +
        //     email +
        //     '&password=' +
        //     password);
        // if (response.data.length > 0) {
        //   print("Login success");
        //   Navigator.push( context, MaterialPageRoute(builder: (context) => Homepage()));
        // } else {
        //   final snackBar = SnackBar(
        //     backgroundColor: Colors.redAccent,
        //     content: Text(
        //       'Invalid email or password',
        //       style: TextStyle(
        //         fontFamily: 'Poppins-Regular',
        //         color: Colors.white,
        //       ),
        //     ),
        //   );
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // }
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
        title: Text("Add a Comments"),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(
        onTap: (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Comments(),));},
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
                      controller: controllerName,
                      style: const TextStyle(
                    fontFamily: 'Roboto-Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: purple)
                    ),
                    labelText: "Name",
                    labelStyle:  const TextStyle(
                      
                      color: Colors.purple,
                    ),
                    hintText: "Name",
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Roboto-Light',
                      fontSize: 16,
                      color: Colors.purple,
                    ),
                    prefixIcon: Icon(Icons.person, color: purple),
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: controllerComment,
                  style: const TextStyle(
                    fontFamily: 'Roboto-Light',
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: purple)
                        ),
                    labelText: "Comments",
                    labelStyle: const TextStyle(
                      color: Colors.purple,
                    ),
                    hintText: "Comments",
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintStyle: const TextStyle(
                      fontFamily: 'Roboto-Light',
                      fontSize: 16,
                    ),
                    prefixIcon: Icon(Icons.note_alt_sharp, color: purple),
                  ),
                ),
                
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    comments(controllerName.text, controllerComment.text);
                  },
                  child: const Text("Submit",
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

                  ],
                ),
            
            ),
            ]
          )
          )
          )
    );
  }

  }
