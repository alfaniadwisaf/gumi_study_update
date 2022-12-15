import 'package:flutter/material.dart';
import 'package:gumi_study/gumistudy.dart';
import 'package:gumi_study/gumistudy_service.dart';
import 'package:gumi_study/detail.dart';

class Save extends StatelessWidget {
  const Save({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Save Materials",
          style: TextStyle(color: Colors.black,
          fontFamily: "Roboto-Bold",
          fontSize: 16,
          ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left, size: 40,
            color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
      ),
    ),
    body: Padding(
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: FutureBuilder<List<GumiStudy>>(
          future: GumiStudyService.getDataGumistudySave(),
          builder: ((context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if(snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Container(
                        width: 600,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>Detail(gumistudy: GumiStudy(id: int.parse("${snapshot.data?[index].id}"), judul: "${snapshot.data?[index].judul}", img: "${snapshot.data?[index].img}", prolog: "${snapshot.data?[index].prolog}", subjudul1: "${snapshot.data?[index].subjudul1}", materi1: "${snapshot.data?[index].materi1}", subjudul2: "${snapshot.data?[index].subjudul2}", materi2: "${snapshot.data?[index].materi2}", subjudul3: "${snapshot.data?[index].subjudul3}", materi3: "${snapshot.data?[index].materi3}", subjudul4: "${snapshot.data?[index].subjudul4}", materi4: "${snapshot.data?[index].materi4}", isSaved: snapshot.data?[index].isSaved as bool),),));
                              },
                              child: Card(
                                elevation: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text("${snapshot.data?[index].judul}"),
                                        ],
                                      ),
                                      Container(
                                        width: 300,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: NetworkImage("${snapshot.data?[index].img}"),
                                            fit: BoxFit.fill
                                          )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
              }
            }
          }))),
    ),
    );
      }
}