import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// A template widget for displaying the contents of a fortify card.
class FortifyCardTemplate extends StatelessWidget {
  /// Creates a [FortifyCardTemplate] widget.
  ///
  /// The [contents] parameter is a list of widgets to be displayed
  /// inside the template.
  const FortifyCardTemplate({this.contents, this.isSelectedView, super.key});

  /// The list of widgets to be displayed inside the template.
  final List<Widget>? contents;

  /// Whether the view is selected or not.
  final bool? isSelectedView;

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      backgroundColor: const Color.fromARGB(255, 172, 183, 187),
      height: isSelectedView ?? false
          ? null
          : MediaQuery.sizeOf(context).height * .8,
      padding: const EdgeInsets.all(4),
      child: Padding(
        padding: EdgeInsets.all((isSelectedView ?? false) ? 8 : 2),
        child: SingleChildScrollView(
          child: Column(
            children: contents ?? [],
          ),
        ),
        // child: NesContainer(
        //   padding: const EdgeInsets.all(2),
        //   backgroundColor: Colors.blueGrey,
        //   child: Padding(
        //     padding: EdgeInsets.all((isSelectedView ?? false) ? 8 : 2),
        //     child: SingleChildScrollView(
        //       child: Column(
        //         children: contents ?? [],
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
