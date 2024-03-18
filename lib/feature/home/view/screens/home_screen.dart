import 'package:cis_task/feature/details/details_screen.dart';
import 'package:cis_task/feature/favourites/favourits_screen.dart';
import 'package:cis_task/feature/favourites/logic/cubit/favourits_cubit.dart';
import 'package:cis_task/feature/home/logic/cubit/home_cubit.dart';
import 'package:cis_task/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Test'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouritesScreen(),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  context.read<HomeCubit>().filterList(value);
                },
                decoration: const InputDecoration(
                    labelText: 'search',
                    prefixIcon: Icon(Icons.search_rounded)),
              ),
              const SizedBox(height: 20),
              Expanded(child: BlocBuilder<HomeCubit, HomeState>(
                builder: (BuildContext context, state) {
                  if (state is HomeInitialState) {
                    return InkWell(child: itemWidget(state.itemList));
                  } else if (state is HomeFielterdlState) {
                    return itemWidget(state.filterditemList);
                  } else {
                    return Container();
                  }
                },
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemWidget(List<Item> itemList) {
    return BlocBuilder<FavouritsCubit, FavouritsState>(
      builder: (context, state) {
        return ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              final item = itemList[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.rating),
                leading: IconButton(
                  onPressed: () {
                    //toggle favourite icon
                    BlocProvider.of<FavouritsCubit>(context)
                        .toggleFavourits(index);
                    //add or remove item from favourits list
                    !item.favourite
                        ? BlocProvider.of<FavouritsCubit>(context)
                            .removeFavourits(item)
                        : BlocProvider.of<FavouritsCubit>(context)
                            .addFavourits(item);
                  },
                  icon: item.favourite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(Icons.favorite_border),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        item: item,
                      ),
                    ),
                  );
                },
              );
            });
      },
    );
  }
}
