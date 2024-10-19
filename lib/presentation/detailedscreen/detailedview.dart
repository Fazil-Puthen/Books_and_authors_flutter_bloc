import 'package:elt_machine_task/domain/models/books_model.dart';
import 'package:flutter/material.dart';

class DetailedView extends StatelessWidget {
  final BookModel book;
  const DetailedView({super.key,
  required this.book});

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
            child: Image.network(book.coverUrl),
          ),),),

          //Details of the book
          Expanded(child: 
          Container(
            margin:const EdgeInsets.all(20),
            child: ListView(
              children:  [
                Text(book.title,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w700),),
                Text(book.authorName,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,)),
                SizedBox(height: 3,),
                Text(book.publishedDate,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w200,color: Colors.grey)),
                SizedBox(height: 5,),
                Text(book.description
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
            Text('₹ ${book.price}.00',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
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