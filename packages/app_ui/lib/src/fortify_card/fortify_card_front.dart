import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// A widget that represents the front side of a fortify card.
class FortifyCardFront extends StatelessWidget {
  /// Creates a [FortifyCardFront] widget.
  ///
  /// The [title], [categoryText], and [imageUrl] parameters must not be null.
  const FortifyCardFront({
    required this.title,
    required this.categoryText,
    required this.imageUrl,
    required this.categoryColor,
    required this.timesTaught,
    required this.earnedCardDate,
    required this.lastTimeDrilled,
    required this.timesHitLiveRounds,
    super.key,
  });

  /// The title of the fortify card.
  final String title;

  /// The category of the fortify card.
  final String categoryText;

  /// The URL of the image to be displayed on the fortify card.
  final String imageUrl;

  /// The color associated with the category of the fortify card.
  final Color categoryColor;

  final String earnedCardDate;

  final String lastTimeDrilled;

  final String timesHitLiveRounds;

  final String timesTaught;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FortifyCardTemplate(
        isSelectedView: true,
        contents: [
          TitleAndCategory(
            title: title,
            categoryText: categoryText,
            categoryColor: categoryColor,
          ),
          const SizedBox(
            height: 16,
          ),
          ImageSection(
            imageUrl: imageUrl,
          ),
          const SizedBox(
            height: 4,
          ),
          DetailWidget(
            earnedCardDate: earnedCardDate,
            lastTimeDrilled: lastTimeDrilled,
            timesHitLiveRounds: timesHitLiveRounds,
            timesTaught: timesTaught,
          ),
        ],
      ),
    );
  }
}

/// A widget that displays the title and category of the fortify card.
class TitleAndCategory extends StatelessWidget {
  /// Creates a [TitleAndCategory] widget.
  ///
  /// The [title] and [categoryText] parameters must not be null.
  const TitleAndCategory({
    required this.title,
    required this.categoryText,
    required this.categoryColor,
    super.key,
  });

  /// The title of the fortify card.
  final String title;

  /// The category of the fortify card.
  final String categoryText;

  /// The color associated with the category of the fortify card.
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        NesContainer(
          padding: const EdgeInsets.all(8),
          backgroundColor: categoryColor,
          child: NesRunningText(
            text: categoryText,
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          NesContainer(
            padding: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height * .50,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Icon(
            Icons.play_circle_fill_outlined,
            size: 100,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

/// A widget that displays detailed information about the fortify card.
class DetailWidget extends StatelessWidget {
  /// Creates a [DetailWidget] widget.
  const DetailWidget({
    required this.earnedCardDate,
    required this.lastTimeDrilled,
    required this.timesHitLiveRounds,
    required this.timesTaught,
    super.key,
  });

  /// The date the card was earned.
  final String earnedCardDate;

  /// The last time the card was drilled;
  final String lastTimeDrilled;

  /// The times the user has hit in live rounds
  final String timesHitLiveRounds;

  /// The number of times the move was taught
  final String timesTaught;

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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailRow(
                    icon: NesIcons.download,
                    label: 'Issued',
                    value: earnedCardDate,
                  ),
                  DetailColumn(
                    icon: NesIcons.clock,
                    label: 'Last Drilled',
                    value: lastTimeDrilled,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DetailRow(
                    icon: NesIcons.exchange,
                    label: 'Times Taught',
                    value: timesTaught,
                  ),
                  DetailRow(
                    icon: NesIcons.upperArmor,
                    label: 'Hit Live',
                    value: timesHitLiveRounds,
                  ),
                ],
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
          size: const Size(12, 12),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          '$label:',
          style: const TextStyle(fontSize: 8),
        ),
        Text(
          value,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

/// A widget that displays a column of detailed information.
class DetailColumn extends StatelessWidget {
  /// Creates a [DetailColumn] widget.
  ///
  /// The [label], [value], and [icon] parameters must not be null.
  const DetailColumn({
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
    return Column(
      children: [
        Row(
          children: [
            NesIcon(
              iconData: icon,
              size: const Size(12, 12),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '$label:',
              style: const TextStyle(fontSize: 8),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
