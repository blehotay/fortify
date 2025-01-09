import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortify/card_collection/card_collection.dart';
import 'package:fortify/l10n/l10n.dart';
import 'package:nes_ui/nes_ui.dart';

import '../app.dart';

class App extends StatelessWidget {
  const App({required CardRepository cardRepository, super.key})
      : _cardRepository = cardRepository;

  final CardRepository _cardRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider.value(value: _cardRepository)],
      child: MultiBlocProvider(
        providers: [RepositoryProvider.value(value: _cardRepository)],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: MaterialApp(
        color: Color.fromARGB(255, 118, 127, 127),
        theme:
            flutterNesTheme(primaryColor: Color.fromARGB(255, 118, 127, 127)),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const RootScreen(),
      ),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavView(),
      body: RootBody(),
    );
  }
}

class RootBody extends StatelessWidget {
  const RootBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        if (state.navBarItem == NavBarItem.earnedCollection) {
          return const CardCollectionPage();
        } else if (state.navBarItem == NavBarItem.favorites) {
          return const Center(
            child: Text('Favorites'),
          );
        } else if (state.navBarItem == NavBarItem.createCard) {
          return const Center(
            child: Text('Create a Card'),
          );
        } else if (state.navBarItem == NavBarItem.marketPlace) {
          return const Center(
            child: Text('Market Place'),
          );
        } else {
          return const Center(
            child: Text('Settings'),
          );
        }
      },
    );
  }
}
