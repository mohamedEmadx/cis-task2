import 'package:cis_task/feature/favourites/logic/cubit/favourits_cubit.dart';
import 'package:cis_task/feature/home/logic/cubit/home_cubit.dart';
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
              title: Text('${cubit.favouritsList.length}Favourites'),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: cubit.favouritsList.isEmpty
                      ? const Text("No Favourits Added yet")
                      : ListView.builder(
                          itemCount: cubit.favouritsList.length,
                          itemBuilder: (BuildContext context, index) {
                            return ListTile(
                              title: Text(cubit.favouritsList[index].name),
                              trailing: IconButton(
                                onPressed: () {
                                  cubit.removeFavourits(
                                      cubit.favouritsList[index]);
                                  cubit.toggleFavourits(
                                      allitemList[index].index);
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
