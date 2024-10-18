import 'package:elt_machine_task/core/constants.dart';
import 'package:elt_machine_task/presentation/homescreen/widgets/Authorswidget.dart';
import 'package:elt_machine_task/presentation/homescreen/widgets/homewidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final  List<Widget> screens=[
  const HomeView(),
  const AuthorsView(), 
  ];

  final List<String> titles=['App Name', 'Authors'];
  int _currentindex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: _currentindex==1?FloatingActionButton(
          onPressed:(){
            //bottom sheet for adding author
            showModalBottomSheet(context: context,
             builder:(context) {
               return  Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                 child: SizedBox(
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      box,
                      const Text('Add author',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                      box,
                      //field for adding author name
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          focusColor: Colors.orange,
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'Name'
                        ),
                      ),
                      box,
                      //field for adding biography
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextFormField(
                            maxLines: null,
                            decoration: const InputDecoration(
                              focusColor: Colors.orange,
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 90),
                              hintText: 'Biography'
                            ),
                                                  ),
                          ],
                        ),
                      ),
                     box,
                     //field for adding DOB
                     TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          focusColor: Colors.orange,
                          contentPadding: EdgeInsets.all(6),
                          hintText: 'DOB',
                          suffixIcon: Icon(Icons.calendar_today_outlined)
                        ),
                      ),
                      box,

                      //Add author button
                      Container(
                        width: MediaQuery.of(context).size.width*0.9,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange),
                          child:const Center(child: Text('Add author',style: TextStyle(color: Colors.white),),),
                      )
                    ],
                   ),
                 ),
               );
             },);
          },
          child:const Icon(Icons.add,color: Colors.white,) ,
          backgroundColor: Colors.black54):
        null,

        //Appbar
        appBar:AppBar(
          title: Text(titles[_currentindex],style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
        ) ,

        //Body
        body:screens[_currentindex],
      
        //Botttom navigation bar
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          currentIndex: _currentindex,
        onTap: (value) {
          setState(() {
            _currentindex=value;
          });
        } ,
        items: const [
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              label: 'Authors')
        ]),
      ),
    );
  }
}