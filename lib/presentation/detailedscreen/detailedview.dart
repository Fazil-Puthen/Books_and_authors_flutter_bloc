import 'package:flutter/material.dart';

class DetailedView extends StatelessWidget {
  const DetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Appbar
      appBar: AppBar(leading: InkWell(
        onTap:()=> Navigator.pop(context),
        child: const Icon(Icons.arrow_back_ios)),),
      
      //Body
      body:SizedBox(height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //image container
          Container(height: 300,
          child: Center(child: ClipRRect(
            child: Image.asset('assets/richdad1.jpg'),
          ),),),

          //Details of the book
          Expanded(child: 
          Container(
            margin:const EdgeInsets.all(20),
            child: ListView(
              children: const [
                Text('Rich Dad poor Dad',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                Text('by Robert T,KIyosaki',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,)),
                SizedBox(height: 3,),
                Text('published date: April 11,2017',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.grey)),
                SizedBox(height: 5,),
                Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'
                ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),textAlign: TextAlign.justify,)
                
              ],
            ),
          ))
        ],
      ),) ,
      
      //Botttom appbar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const  Text('₹ 850.00',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.orange,
              ),
              child: const Center(child: Text('Buy now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800),),),
            )
          ],
        ),
      ),
    );
  }
}