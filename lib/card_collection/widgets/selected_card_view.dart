import 'package:app_ui/app_ui.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class SelectedCardView extends StatelessWidget {
  const SelectedCardView({
    required this.title,
    required this.categoryText,
    required this.imageUrl,
    required this.catagoryColor,
    super.key,
  });

  final String title;
  final String categoryText;
  final String imageUrl;
  final Color catagoryColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FlipCard(
        front: FortifyCardFront(
          title: title,
          categoryText: categoryText,
          imageUrl: imageUrl,
          catogryColor: catagoryColor,
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
    );
  }
}
