// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

final List<Item> allitemList = [
  Item(
      name: "Eren",
      rating: "10.0",
      image: "assets/images/eren.jpg",
      favourite: false,
      index: 0),
  Item(
      name: "jessy pinkman",
      rating: "9.0",
      image: "assets/images/jessy.jpg",
      favourite: false,
      index: 1),
  Item(
      name: "jon snow",
      rating: "10.0",
      image: "assets/images/john.jpg",
      favourite: false,
      index: 2),
  Item(
      name: "eren",
      rating: "5.0",
      image: "assets/images/tony.jpg",
      favourite: false,
      index: 3),
  Item(
      name: "tony soprano",
      rating: "10.0",
      image: "assets/images/walter white.jpg",
      favourite: false,
      index: 4),
];

sealed class HomeState {}

final class HomeInitialState extends HomeState {
  final List<Item> itemList;
  HomeInitialState({required this.itemList});
}

final class HomeFielterdlState extends HomeState {
  final List<Item> filterditemList;
  HomeFielterdlState({required this.filterditemList});
}

final class HomeButtonState extends HomeState {}
