import 'package:card_repository/card_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortify/card_collection/card_collection.dart';

class CardCollectionPage extends StatelessWidget {
  const CardCollectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CardCollectionBloc(
        cardRepository: context.read<CardRepository>(),
      )..add(const CardColectionRequested()),
      child: const CardCollectionView(),
    );
  }
}
