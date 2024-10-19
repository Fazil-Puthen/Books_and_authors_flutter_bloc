import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:elt_machine_task/data/constants/api_constatns.dart';
import 'package:elt_machine_task/domain/models/books_model.dart';
import 'package:elt_machine_task/domain/repositiory/books_repo.dart';
import 'package:http/http.dart' as http;

class Books implements BooksRepo{

  List<BookModel> booklist=[];

  @override
  Future<BookModel> deletebook(String id) {
    // TODO: implement deletebook
    throw UnimplementedError();
  }

  @override
  Future<BookModel> getbookbyid(String id) {
    // TODO: implement getbookbyid
    throw UnimplementedError();
  }
  

  //Method to fetch all books
  @override
  Future<Either<String,List<BookModel>>> getbooks()async {

   final url=Uri.parse(ApiConstants.baseurl+ApiConstants.books);
   try{
    final response=await http.get(url);
    
    if(response.statusCode==200){
      print('this is the resopnse ${response.body}');
      Map<String,dynamic> jsonresponse=jsonDecode(response.body);

      List<dynamic> result=jsonresponse['result'];
      
      //map each elemnt to a list
      booklist=result.map((element)=>BookModel.fromjson(element)).toList();
       
       //fetch author name from the auhtorid
       for (var book in booklist) {
        book.authorName = await getAuthorName(book.authorid);
      }
      
      //if success return the  list of instances of BookModel
      return right(booklist);
    }
    else{
      return left('failed to fetch authors');
    }
  }
  catch(e){
    //if failure return the error string
    return left(e.toString());
  }
  }
  

  //updatesbook
  @override
  Future<void> updatebook(BookModel book) async{
   final url=Uri.parse('https://assessment.eltglobal.in/api/books/$id');
   try{
    await http.patch(url,
    body:{
      "id":book.id,
      "title":book.price,
      "description":book.description ,
      "publishedDate":book.publishedDate,
      "authorId": book.authorid,
      "coverPictureURL": book.coverUrl,
      "price": book.price
    } );
   }
   catch(e){
    throw Exception(e.toString());
   }
  }
  
  //method to fetch author name from authorid
  Future<String> getAuthorName(String authorId) async {
  final url = Uri.parse('${ApiConstants.baseurl}/authors/$authorId');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return jsonResponse['result']['name'];  // 'name' is the field for the author's name
    } else {
      return 'Unknown Author';
    }
  } catch (e) {
    return 'Unknown Author'; 
  }
}
  
}