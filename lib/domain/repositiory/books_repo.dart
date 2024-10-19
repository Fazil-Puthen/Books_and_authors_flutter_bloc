/*
Books Repository

Defines how books are manged
*/
import 'package:dartz/dartz.dart';
import 'package:elt_machine_task/domain/models/books_model.dart';

abstract class BooksRepo{

//Get books with pagination
Future<Either<String,List<BookModel>>> getbooks();

//get book by id
Future<BookModel> getbookbyid(String id);

//Update book by id
Future<BookModel> updatebook(String id);

//Delete book by id
Future<BookModel> deletebook(String id);
}