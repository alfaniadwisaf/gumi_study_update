import 'package:flutter/material.dart';
import 'package:gumi_study/detail.dart';
import 'package:gumi_study/gumistudy.dart';
import 'package:gumi_study/gumistudy_service.dart';
import 'package:gumi_study/profile.dart';
import 'package:gumi_study/save.dart';
import 'package:gumi_study/search.dart';
import 'package:gumi_study/user.dart';

class Homepage extends StatefulWidget {
  final User user;
  Homepage({Key? key, required this.user}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      Save(),
      HomeBody(),
      Profile(user: widget.user),
  ];

    return Scaffold( 
      appBar: AppBar(
      title:const Text("Study with Gumi", 
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Roboto-Bold"),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: IconButton(
          onPressed: (){
            Navigator.push( context, MaterialPageRoute(builder: (context) => Search()));
          }, 
          icon: const Icon(Icons.search,
          color: Colors.black,
          )),
        ),
      ],
      ),
      backgroundColor:  Color.fromARGB(255, 228, 214, 255),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.save, ),
              label: 'Save'),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book,),
              label: 'Class'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: 'Profile'),
        ],
      ),
      body: pages.elementAt(_selectedIndex),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
      child: Column(
        children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<GumiStudy>> (
                future: GumiStudyService.getDataGumistudy(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
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
                                          Text("${snapshot.data?[index].judul}",
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
                },
              ),
            )
        ],
      ),
      )
    );
  }
}