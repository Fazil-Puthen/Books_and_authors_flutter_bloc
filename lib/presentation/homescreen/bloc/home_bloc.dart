import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:elt_machine_task/data/repositiory/api_booksrepo.dart';
import 'package:elt_machine_task/domain/models/books_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });
    on<FetchBooks>(fetchbooks);
    on<Search>(searchbooks);
  }
   final book=Books();

  FutureOr<void> fetchbooks(FetchBooks event, Emitter<HomeState> emit) async{
    emit(HomeLoading());
    try{
      final result=await book.getbooks();

      result.fold((error){
        emit(HomeError(messge: error));
      },
      (booklist){
        emit(HomeLoaded(booklist: booklist));
      });
    }
    catch(e){
      throw Exception(e.toString());
    }
  }

  FutureOr<void> searchbooks(Search event, Emitter<HomeState> emit) {
    List<BookModel> filterdbooks=[];
    emit(HomeLoading());
      filterdbooks=event.book.where((item)=>item.title.toLowerCase()
      .contains(event.value.toLowerCase())).toList();
      emit(HomeLoaded(booklist: filterdbooks));
  }
}
