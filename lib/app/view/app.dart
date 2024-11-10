import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortify/card_collection/card_collection.dart';
import 'package:fortify/l10n/l10n.dart';
import 'package:nes_ui/nes_ui.dart';

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
    return MaterialApp(
      theme: flutterNesTheme(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const CardCollectionPage(),
    );
  }
}
