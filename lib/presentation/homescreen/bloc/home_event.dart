part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class FetchBooks extends HomeEvent{}

class Search extends HomeEvent{
  final String value;
  final List<BookModel> book;

  Search({
    required this.value,
    required this.book,
  });
}
