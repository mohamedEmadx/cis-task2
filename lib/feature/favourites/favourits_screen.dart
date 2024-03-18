import 'dart:developer';

import 'package:cis_task/feature/favourites/logic/cubit/favourits_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<FavouritsCubit, FavouritsState>(
        builder: (context, state) {
          final cubit = BlocProvider.of<FavouritsCubit>(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('(${cubit.favouritsList.length}) Favourites'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: cubit.favouritsList.isEmpty
                      ? const Center(child: Text("No Favourits Added yet"))
                      : ListView.builder(
                          itemCount: cubit.favouritsList.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              title: Text(cubit.favouritsList[index].name),
                              trailing: IconButton(
                                onPressed: () {
                                   log("${cubit.favouritsList[index].index}");
                                  cubit.removeFavourits(
                                      cubit.favouritsList[index]);
                                  cubit.toggleFavourits(
                                      cubit.favouritsList[index].index);
                                 
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
