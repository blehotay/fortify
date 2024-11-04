import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// A widget that represents the front side of a fortify card.
class FortifyCardFront extends StatelessWidget {
  /// Creates a [FortifyCardFront] widget.
  ///
  /// The [title], [category], and [imageUrl] parameters must not be null.
  const FortifyCardFront({
    required this.title,
    required this.category,
    required this.imageUrl,
    super.key,
  });

  /// The title of the fortify card.
  final String title;

  /// The category of the fortify card.
  final String category;

  /// The URL of the image to be displayed on the fortify card.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: FortifyCardTemplate(
          contents: [
            TitleAndCategory(title: title, category: category),
            const SizedBox(
              height: 16,
            ),
            ImageSection(
              imageUrl: imageUrl,
            ),
            const SizedBox(
              height: 4,
            ),
            const DetailWidget(),
          ],
        ),
      ),
    );
  }
}

/// A widget that displays the title and category of the fortify card.
class TitleAndCategory extends StatelessWidget {
  /// Creates a [TitleAndCategory] widget.
  ///
  /// The [title] and [category] parameters must not be null.
  const TitleAndCategory({
    required this.title,
    required this.category,
    super.key,
  });

  /// The title of the fortify card.
  final String title;

  /// The category of the fortify card.
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        NesContainer(
          padding: const EdgeInsets.all(8),
          backgroundColor: Colors.redAccent,
          child: NesRunningText(
            text: category,
          ),
        ),
      ],
    );
  }
}

/// A widget that displays an image section of the fortify card.
class ImageSection extends StatelessWidget {
  /// Creates an [ImageSection] widget.
  ///
  /// The [imageUrl] parameter must not be null.
  const ImageSection({
    required this.imageUrl,
    super.key,
  });

  /// The URL of the image to be displayed.
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: NesContainer(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * .50,
        child: Image.network(
          imageUrl,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

/// A widget that displays detailed information about the fortify card.
class DetailWidget extends StatelessWidget {
  /// Creates a [DetailWidget] widget.
  const DetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * .2,
      width: double.infinity,
      child: NesContainer(
        backgroundColor: Colors.black12,
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DetailRow(
                icon: NesIcons.hammer,
                label: 'Difficulty',
                value: 'Beginner',
              ),
              DetailRow(
                icon: NesIcons.check,
                label: 'Issued',
                value: '10/12/23',
              ),
              DetailRow(
                icon: NesIcons.energy,
                label: 'Times Taught',
                value: '10',
              ),
              DetailRow(
                icon: NesIcons.pickaxe,
                label: 'Last',
                value: '10/12/23',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A widget that displays a row of detailed information.
class DetailRow extends StatelessWidget {
  /// Creates a [DetailRow] widget.
  ///
  /// The [label], [value], and [icon] parameters must not be null.
  const DetailRow({
    required this.label,
    required this.value,
    required this.icon,
    super.key,
  });

  /// The label of the detail.
  final String label;

  /// The value of the detail.
  final String value;

  /// The icon representing the detail.
  final NesIconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NesIcon(
          iconData: icon,
          size: const Size(24, 24),
        ),
        Text('$label: '),
        Text(value),
      ],
    );
  }
}
