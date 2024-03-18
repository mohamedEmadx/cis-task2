import 'package:bloc/bloc.dart';
import 'package:cis_task/item.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState(itemList: allitemList));
  
  void filterList(String query) {
    final List<Item> filterdList = allitemList
        .where((itemList) =>
            itemList.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(HomeFielterdlState(filterditemList: filterdList));
  }

  
}
