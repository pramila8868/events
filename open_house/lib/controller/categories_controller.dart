import 'package:bloc/bloc.dart';

class CategoryCubit extends Cubit<int> {
  CategoryCubit() : super(0);

  void selectCategory(int index) {
    emit(index);
  }
}

// enum TabItem { add, update, delete }

// class TabBarCubit extends Cubit<TabItem> {
//   TabBarCubit() : super(TabItem.add);

//   void selectTab(TabItem tab) {
//     emit(tab);
//   }
// }
