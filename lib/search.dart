import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gumi_study/gumistudy.dart';
import 'package:gumi_study/gumistudy_service.dart';
import 'package:gumi_study/detail.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<GumiStudy> _gumistudy = [];
  List<GumiStudy> _gumistudyDisplay = [];

  bool isLoading = true;

  @override
  void initState() {
    GumiStudyService.getDataGumistudy().then((value) {
      setState(() {
        isLoading = false;
        _gumistudy.addAll(value);
        _gumistudyDisplay = _gumistudy;
      });
    });
    super.initState();
  }

  _listItem(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(gumistudy: GumiStudy(id: _gumistudyDisplay[index].id, judul: _gumistudyDisplay[index].judul, img: _gumistudyDisplay[index].img, prolog: _gumistudyDisplay[index].prolog, subjudul1: _gumistudyDisplay[index].subjudul1, materi1: _gumistudyDisplay[index].materi1, subjudul2: _gumistudyDisplay[index].subjudul2, materi2: _gumistudyDisplay[index].materi2, subjudul3: _gumistudyDisplay[index].subjudul3, materi3: _gumistudyDisplay[index].materi3, subjudul4: _gumistudyDisplay[index].subjudul4, materi4: _gumistudyDisplay[index].materi4, isSaved: _gumistudyDisplay[index].isSaved))));
      },
      child: GumiStudyCard(
        judul: _gumistudyDisplay[index].judul,
        img: _gumistudyDisplay[index].img,
        // prolog: _gumistudyDisplay[index].prolog,
        // subjudul1: _gumistudyDisplay[index].subjudul1, 
        // materi1: _gumistudyDisplay[index].materi1,
        // subjudul2: _gumistudyDisplay[index].subjudul2,
        // materi2: _gumistudyDisplay[index].materi2,
        // subjudul3: _gumistudyDisplay[index].subjudul3,
        // materi3: _gumistudyDisplay[index].materi3,
        // subjudul4: _gumistudyDisplay[index].subjudul4,
        // materi4: _gumistudyDisplay[index].materi4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (!isLoading) {
                    return index == 0 ? _searchFields() : _listItem(index - 1);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                itemCount: _gumistudyDisplay.length + 1,
                )
            ],
          ),
          ),
          ),
    );
  }

  _searchFields(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: TextField(
        controller: null,
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _gumistudyDisplay = _gumistudy.where((GumiStudy) 
            {
              var gumiTitle = GumiStudy.judul.toLowerCase();
              return gumiTitle.contains(text);
            }).toList();
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: "Search",
          hintStyle: TextStyle(
            fontFamily: "Roboto-Light",
          ),
         ),
      ),
      );
  }
}



  class GumiStudyCard extends StatelessWidget {
    final String img, judul;
    const GumiStudyCard(
      {Key? key,
      required this.img,
      required this.judul}
    ) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                                          Text(judul,
                                          style: TextStyle(
                                            fontFamily: "Roboto-Bold",
                                          ),),
                                        ],
                                      ),
                                      Container(
                                        width: 300,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: NetworkImage(img),
                                            fit: BoxFit.fill
                                          )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
      );
  }
}