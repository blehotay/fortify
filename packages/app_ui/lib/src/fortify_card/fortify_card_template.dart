import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

class FortifyCardTemplate extends StatelessWidget {
  const FortifyCardTemplate({this.contents, super.key});

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
