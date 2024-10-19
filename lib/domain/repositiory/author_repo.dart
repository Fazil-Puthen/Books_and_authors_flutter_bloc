/*
Author Repository

Defines how Authors are manged
*/
import 'package:dartz/dartz.dart';
import 'package:elt_machine_task/domain/models/author_model.dart';

abstract class AuthorRepo{

  //Create an author
  Future<Either<String,List<AuthorModel>>> createauthor(AuthorModel author);

  //Get all authors
  Future<Either<String,List<AuthorModel>>> getauthors();
}

