import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// A template widget for displaying the contents of a fortify card.
class FortifyCardTemplate extends StatelessWidget {
  /// Creates a [FortifyCardTemplate] widget.
  ///
  /// The [contents] parameter is a list of widgets to be displayed
  /// inside the template.
  const FortifyCardTemplate({this.contents, super.key});

  /// The list of widgets to be displayed inside the template.
  final List<Widget>? contents;

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      padding: const EdgeInsets.all(4),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: NesContainer(
          padding: const EdgeInsets.all(8),
          backgroundColor: Colors.blueGrey,
          // height: MediaQuery.of(context).size.height * .80,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: SingleChildScrollView(
              child: Column(
                children: contents ?? [],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
