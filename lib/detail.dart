import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gumi_study/gumistudy.dart';

class Detail extends StatefulWidget {
  final GumiStudy gumistudy;
  const Detail({super.key, required this.gumistudy});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isSaved = false;

  @override
  void initState(){
    isSaved = widget.gumistudy.isSaved;
    super.initState();
  }

  void addSave(String judul, img, prolog, subjudul1, materi1, subjudul2, materi2, subjudul3, materi3, subjudul4, materi4, bool isSaved) async{
    try{
        Response response = await Dio().put('http://localhost:3004/data/' + widget.gumistudy.id.toString(),
      data: {
        "judul": judul,
        "img": img,
        "prolog": prolog,
        "subjudul1": subjudul1,
        "materi1": materi1,
        "subjudul2": subjudul2,
        "materi2": materi2,
        "subjudul3": subjudul3,
        "materi3": materi3,
        "subjudul4": subjudul4,
        "materi4": materi4,
        "isSave": isSaved
      }
      );
      if(response.data.length > 0){
        print("Changed successfully");
        Navigator.pop(context);
      }
      else{
        print("Failed");
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Materials", 
        style: TextStyle(color: Colors.black, fontFamily: "Roboto-Bold"),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back,
          color: Colors.black,
          )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.gumistudy.img),
                    fit: BoxFit.cover
                  )
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                    onPressed: () {
                      isSaved = true;
                      addSave(widget.gumistudy.judul, widget.gumistudy.img, widget.gumistudy.prolog, widget.gumistudy.subjudul1, widget.gumistudy.materi1, widget.gumistudy.subjudul2, widget.gumistudy.materi2, widget.gumistudy.subjudul3, widget.gumistudy.materi3, widget.gumistudy.subjudul4, widget.gumistudy.materi4, isSaved);
                    },
                    child: const Text("Save Materials",
                        style: TextStyle(
                          fontFamily: 'Roboto-Bold',
                          fontSize: 18,
                        )),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 131, 62, 122),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  // Align(
                  //       alignment: Alignment.topRight,
                  //         // child: IconButton(
                  //           // onPressed: (){
                  //             // setState(() {
                  //               // isBookmark = !isBookmark;
                  //               // addBookmark(isBookmark);
                  //             // });
                  //           // },
                  //             // icon: Icon(Icons.bookmark, size: 50, color: isBookmark == false ? Colors.white : Color.fromARGB(255, 46, 158, 149),),
                  //                   ),
                                  
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      isSaved = false;
                      addSave(widget.gumistudy.judul, widget.gumistudy.img, widget.gumistudy.prolog, widget.gumistudy.subjudul1, widget.gumistudy.materi1, widget.gumistudy.subjudul2, widget.gumistudy.materi2, widget.gumistudy.subjudul3, widget.gumistudy.materi3, widget.gumistudy.subjudul4, widget.gumistudy.materi4, isSaved);
                    },
                    child: const Text("Unsave Materials",
                        style: TextStyle(
                          fontFamily: 'Roboto-Bold',
                          fontSize: 18,
                        )),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 31, 28, 30),
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                  SizedBox(height: 15),
                  Text(widget.gumistudy.prolog, style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,),
                  SizedBox(height: 10),
                  Text(widget.gumistudy.subjudul1, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(widget.gumistudy.materi1, textAlign: TextAlign.justify,),
                  SizedBox(height: 10),   
                  Text(widget.gumistudy.subjudul2, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(widget.gumistudy.materi2, textAlign: TextAlign.justify,),
                  SizedBox(height: 10),   
                  Text(widget.gumistudy.subjudul3, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(widget.gumistudy.materi3, textAlign: TextAlign.justify,),
                  SizedBox(height: 10),   
                  Text(widget.gumistudy.subjudul4, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(widget.gumistudy.materi4, textAlign: TextAlign.justify,)
            ],
          ),
        ),
      ),
    );
  }
}