import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortify/card_collection/card_collection.dart';
import 'package:fortify/card_collection/widgets/selected_card_view.dart';
import 'package:fortify/l10n/l10n.dart';
import 'package:nes_ui/nes_ui.dart';

class CardCollectionView extends StatelessWidget {
  const CardCollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardCollectionBloc, CardCollectionState>(
      builder: (context, state) => switch (state.status) {
        PageStatus.inital ||
        PageStatus.loading =>
          const CardCollectionLoadingView(),
        PageStatus.error => const CardCollectionErrorView(),
        PageStatus.success => const CardCollectionSuccess(),
      },
    );
  }
}

class CardCollectionSuccess extends StatelessWidget {
  const CardCollectionSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final earnedCards = context.read<CardCollectionBloc>().state.earnedCards;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.earnedCollection,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            mainAxisExtent: MediaQuery.sizeOf(context).height * .3,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: earnedCards!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (_) => BlocProvider.value(
                      value: context.read<CardCollectionBloc>(),
                      child: SelectedCardView(
                        title: earnedCards[index].title,
                        categoryText: context
                            .read<CardCollectionBloc>()
                            .getcategoryText(earnedCards, index),
                        imageUrl: earnedCards[index].imageUrl,
                        catagoryColor: context
                            .read<CardCollectionBloc>()
                            .getcategoryColor(earnedCards, index),
                      ),
                    ),
                  ),
                );
              },
              child: CardViewCollection(
                title: earnedCards[index].title,
                imageUrl: earnedCards[index].imageUrl,
                categoryColor: context
                    .read<CardCollectionBloc>()
                    .getcategoryColor(earnedCards, index),
                categoryText: context
                    .read<CardCollectionBloc>()
                    .getcategoryText(earnedCards, index),
              ),
            );
          },
        ),
      ),
    );
  }
}

// TODO(any): Use layout builder to make the card responsive
class CardViewCollection extends StatelessWidget {
  const CardViewCollection({
    required this.title,
    required this.imageUrl,
    this.categoryColor,
    this.categoryText,
    super.key,
  });

  final String title;
  final String imageUrl;
  final Color? categoryColor;
  final String? categoryText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FortifyCardTemplate(
        isSelectedView: false,
        contents: [
          const SizedBox(
            height: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                color: categoryColor ?? Colors.white,
                child: Text(
                  categoryText ?? '',
                  style:
                      const TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: NesContainer(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height * .15,
              width: double.infinity,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          NesContainer(
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * .1,
            width: double.infinity,
            child: NesContainer(
              backgroundColor: Colors.black12,
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NesIcon(
                          iconData: NesIcons.hammer,
                          size: const Size(8, 8),
                        ),
                        const Text(
                          'Difficulty: ',
                          style: TextStyle(fontSize: 4),
                        ),
                        const Text(
                          'Beginner',
                          style: TextStyle(fontSize: 4),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardCollectionErrorView extends StatelessWidget {
  const CardCollectionErrorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error'),
      ),
    );
  }
}

class CardCollectionLoadingView extends StatelessWidget {
  const CardCollectionLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
