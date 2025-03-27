part of 'bottom_nav_cubit.dart';

enum NavBarItem {
  earnedCollection,
  favorites,
  createCard,
  marketPlace,
  settings,
}

class BottomNavState extends Equatable {
  const BottomNavState({required this.navBarItem, required this.index});

  final NavBarItem navBarItem;
  final int index;

  @override
  List<Object?> get props => [navBarItem, index];
}
