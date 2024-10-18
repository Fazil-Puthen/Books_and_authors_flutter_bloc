import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorsView extends StatelessWidget {
  const AuthorsView({super.key});

  @override
  Widget build(BuildContext context) {
   return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
     child: SizedBox(
      height: MediaQuery.of(context).size.height,

      //listview of authors
       child: ListView.separated(
         itemBuilder:(context, index) {
          //Details of each author
           return Container(
            decoration: BoxDecoration(border: Border.all(width: 0.1),
            borderRadius: BorderRadius.circular(10),),
             width: MediaQuery.of(context).size.width*0.8,
             height: 80,
             child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10,),
                CircleAvatar(
                  backgroundColor: Colors.blue[400],
                  child: Center(child: Text('J',style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w700),)),
                ),
                const SizedBox(width: 10,),
               const  Expanded(
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('Robert T Kiyosaki',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                       Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s,',
                                           style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.grey),maxLines: 2,overflow:TextOverflow.ellipsis ,), 
                    ],
                  ),
                )
              ],
             ),
           );
         },
         separatorBuilder:(context, index) => const SizedBox(height: 15,),
         itemCount:10),
     ),
   );
  }
}