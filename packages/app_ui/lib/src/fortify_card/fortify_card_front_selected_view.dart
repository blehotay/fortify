import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// A widget that represents the front side of a fortify card.
class FortifyCardFrontSelectedView extends StatelessWidget {
  /// Creates a [FortifyCardFrontSelectedView] widget.
  ///
  /// The [title], [categoryText], and [imageUrl] parameters must not be null.
  const FortifyCardFrontSelectedView({
    required this.title,
    required this.categoryText,
    required this.imageUrl,
    required this.categoryColor,
    required this.timesTaught,
    required this.issuedDate,
    required this.lastTimeDrilled,
    required this.timesHitLiveRounds,
    required this.description,
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

  /// The date the card was issued.

  final String issuedDate;

  /// The last time this move was drilled.

  final String lastTimeDrilled;

  /// The amount of times the user has hit this move in a live round.

  final String timesHitLiveRounds;

  /// The amount of times a user has been taught.

  final String timesTaught;

  /// A description of the card, providing details about the technique or
  /// action.
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 127, 127),
      body: NesContainer(
        backgroundColor: const Color.fromARGB(255, 172, 183, 187),
        height: MediaQuery.sizeOf(context).height * .8,
        padding: const EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _TitleAndCategory(
                  title: title,
                  categoryText: categoryText,
                  categoryColor: categoryColor,
                ),
                const SizedBox(
                  height: 16,
                ),
                _ImageSection(
                  imageUrl: imageUrl,
                ),
                const SizedBox(
                  height: 4,
                ),
                _DetailWidget(
                  earnedCardDate: issuedDate,
                  lastTimeDrilled: lastTimeDrilled,
                  timesHitLiveRounds: timesHitLiveRounds,
                  timesTaught: timesTaught,
                  description: description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A widget that displays the title and category of the fortify card.
class _TitleAndCategory extends StatelessWidget {
  /// Creates a [TitleAndCategory] widget.
  ///
  /// The [title] and [categoryText] parameters must not be null.
  const _TitleAndCategory({
    required this.title,
    required this.categoryText,
    required this.categoryColor,
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
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        NesContainer(
          padding: const EdgeInsets.all(12),
          backgroundColor: categoryColor,
          child: NesRunningText(
            text: categoryText,
            textStyle: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

/// A widget that displays an image section of the fortify card.
class _ImageSection extends StatelessWidget {
  /// Creates an [ImageSection] widget.
  ///
  /// The [imageUrl] parameter must not be null.
  const _ImageSection({
    required this.imageUrl,
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
              width: double.infinity,
            ),
          ),
          const Icon(
            Icons.play_circle_fill_outlined,
            size: 100,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

/// A widget that displays detailed information about the fortify card.
class _DetailWidget extends StatelessWidget {
  /// Creates a [DetailWidget] widget.
  const _DetailWidget({
    required this.earnedCardDate,
    required this.lastTimeDrilled,
    required this.timesHitLiveRounds,
    required this.timesTaught,
    required this.description,
  });

  /// The date the card was earned.
  final String earnedCardDate;

  /// The last time the card was drilled;
  final String lastTimeDrilled;

  /// The times the user has hit in live rounds
  final String timesHitLiveRounds;

  /// The number of times the move was taught
  final String timesTaught;

  final String description;

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      padding: const EdgeInsets.all(8),
      height: MediaQuery.of(context).size.height * .2,
      width: double.infinity,
      child: NesContainer(
        backgroundColor: Colors.black12,
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                description,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 10),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            const VerticalDivider(
              thickness: 1,
            ),
            const SizedBox(
              width: 2,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _DetailColumn(
                    icon: NesIcons.download,
                    label: 'Issued',
                    value: earnedCardDate,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _DetailColumn(
                    icon: NesIcons.clock,
                    label: 'Last Drilled',
                    value: lastTimeDrilled,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _DetailRow(
                    icon: NesIcons.exchange,
                    label: 'Times Taught',
                    value: timesTaught,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  _DetailRow(
                    icon: NesIcons.upperArmor,
                    label: 'Hit Live',
                    value: timesHitLiveRounds,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A widget that displays a row of detailed information.
class _DetailRow extends StatelessWidget {
  /// Creates a [DetailRow] widget.
  ///
  /// The [label], [value], and [icon] parameters must not be null.
  const _DetailRow({
    required this.label,
    required this.value,
    required this.icon,
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
          width: 8,
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
class _DetailColumn extends StatelessWidget {
  /// Creates a [DetailColumn] widget.
  ///
  /// The [label], [value], and [icon] parameters must not be null.
  const _DetailColumn({
    required this.label,
    required this.value,
    required this.icon,
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
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '$label:',
                  style: const TextStyle(fontSize: 8),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
