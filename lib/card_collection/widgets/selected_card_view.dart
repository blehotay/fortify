import 'package:app_ui/app_ui.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class SelectedCardView extends StatelessWidget {
  const SelectedCardView({
    required this.title,
    required this.categoryText,
    required this.imageUrl,
    required this.categoryColor,
    super.key,
  });

  final String title;
  final String categoryText;
  final String imageUrl;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Hero(
        tag: const Key('card_hero'),
        child: FlipCard(
          front: FortifyCardFront(
            title: title,
            categoryText: categoryText,
            imageUrl: imageUrl,
            categoryColor: categoryColor,
          ),
          back: FortifyCardTemplate(
            isSelectedView: true,
            contents: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.65,
                width: double.infinity,
              ),
              const Text('Back'),
            ],
          ),
        ),
      ),
    );
  }
}
