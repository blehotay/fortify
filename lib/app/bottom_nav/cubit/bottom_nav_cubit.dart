import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit()
      : super(
          const BottomNavState(
            navBarItem: NavBarItem.earnedCollection,
            index: 0,
          ),
        );

  void getNavBarItem(NavBarItem navbarItem) {
    switch (navbarItem) {
      case NavBarItem.earnedCollection:
        emit(
          const BottomNavState(
            navBarItem: NavBarItem.earnedCollection,
            index: 0,
          ),
        );

      case NavBarItem.favorites:
        emit(
          const BottomNavState(
            navBarItem: NavBarItem.favorites,
            index: 1,
          ),
        );
      case NavBarItem.createCard:
        emit(
          const BottomNavState(
            navBarItem: NavBarItem.createCard,
            index: 2,
          ),
        );
      case NavBarItem.marketPlace:
        emit(
          const BottomNavState(
            navBarItem: NavBarItem.marketPlace,
            index: 3,
          ),
        );

      case NavBarItem.settings:
        emit(
          const BottomNavState(
            navBarItem: NavBarItem.settings,
            index: 4,
          ),
        );
    }
  }
}
