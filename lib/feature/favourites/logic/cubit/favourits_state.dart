part of 'favourits_cubit.dart';

sealed class FavouritsState {}

final class FavouritsInitial extends FavouritsState {}

final class FavouritsAdded extends FavouritsState {}

final class FavouritsRemoved extends FavouritsState {}
