import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortify/app/app.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return BottomNavigationBar(
          selectedFontSize: 6,
          elevation: 10,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: state.index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.file_download,
              ),
              label: 'Earned Collection',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
              ),
              label: 'Create Card',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shop,
              ),
              label: 'Market Place',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings',
            ),
          ],
          onTap: (index) {
            if (index == 0) {
              BlocProvider.of<BottomNavCubit>(context)
                  .getNavBarItem(NavBarItem.earnedCollection);
            } else if (index == 1) {
              BlocProvider.of<BottomNavCubit>(context)
                  .getNavBarItem(NavBarItem.favorites);
            } else if (index == 2) {
              BlocProvider.of<BottomNavCubit>(context)
                  .getNavBarItem(NavBarItem.createCard);
            } else if (index == 3) {
              BlocProvider.of<BottomNavCubit>(context)
                  .getNavBarItem(NavBarItem.marketPlace);
            } else {
              BlocProvider.of<BottomNavCubit>(context)
                  .getNavBarItem(NavBarItem.settings);
            }
          },
        );
      },
    );
  }
}
