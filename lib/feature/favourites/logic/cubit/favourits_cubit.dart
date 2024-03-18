import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cis_task/item.dart';

import '../../../home/logic/cubit/home_cubit.dart';

part 'favourits_state.dart';

class FavouritsCubit extends Cubit<FavouritsState> {
  FavouritsCubit() : super(FavouritsInitial());
  List<Item> favouritsList = [];

  toggleFavourits(int index) {
    for (var item in allitemList) {
      if (item.index == index) {
        item.favourite = !item.favourite;
      }
    }
    // !allitemList[index].favourite
    //     ? allitemList[index].favourite = false
    //     : allitemList[index].favourite = true;
    !allitemList[index].favourite
        ? emit(FavouritsRemoved())
        : emit(FavouritsAdded());
  }

  void addFavourits(Item item) {
    favouritsList.add(item);
    emit(FavouritsAdded());
    log("$favouritsList");
  }

  void removeFavourits(Item item) {
    favouritsList.remove(item);
    emit(FavouritsRemoved());
    log("$favouritsList");
  }
}
