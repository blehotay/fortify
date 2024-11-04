import 'package:app_ui/app_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class FortifyCardFront extends StatelessWidget {
  const FortifyCardFront({
    required this.title,
    required this.category,
    required this.imageUrl,
    super.key,
  });

  final String title;
  final String category;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: FortifyCardTemplate(contents: [
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
          DetailWidget()
        ]),
      ),
    );
  }
}

class TitleAndCategory extends StatelessWidget {
  const TitleAndCategory({
    required this.title,
    required this.category,
    super.key,
  });

  final String title;
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

class ImageSection extends StatelessWidget {
  const ImageSection({
    required this.imageUrl,
    super.key,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: NesContainer(
        padding: EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * .50,

        ///should be 30 sec video
        child: Image.network(
          imageUrl,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

class DetailWidget extends StatelessWidget {
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow({
    required this.label,
    required this.value,
    required this.icon,
    super.key,
  });

  final String label;
  final String value;
  final NesIconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        NesIcon(
          iconData: icon,
          size: Size(24.0, 24),
        ),
        Text('$label: '),
        Text(value),
      ],
    );
  }
}
