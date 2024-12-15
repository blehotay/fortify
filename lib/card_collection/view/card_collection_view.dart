import 'package:animations/animations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortify/card_collection/card_collection.dart';
import 'package:fortify/l10n/l10n.dart';

class CardCollectionView extends StatelessWidget {
  const CardCollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardCollectionBloc, CardCollectionState>(
      builder: (context, state) => switch (state.status) {
        PageStatus.initial ||
        PageStatus.loading =>
          const CardCollectionLoadingView(),
        PageStatus.error => const CardCollectionErrorView(),
        PageStatus.success => const CardCollectionSuccess(),
      },
    );
  }
}

class CardCollectionSuccess extends StatefulWidget {
  const CardCollectionSuccess({super.key});

  @override
  State<CardCollectionSuccess> createState() => _CardCollectionSuccessState();
}

class _CardCollectionSuccessState extends State<CardCollectionSuccess> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final earnedCards = context.read<CardCollectionBloc>().state.earnedCards;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 127, 127),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 118, 127, 127),
        elevation: 0,
        title: Text(
          l10n.earnedCollection,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 6,
            mainAxisExtent: MediaQuery.sizeOf(context).height * .35,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: earnedCards!.length,
          itemBuilder: (context, index) {
            // TODO(ben): Use transform to make card expand on tap
            return OpenContainer(
              transitionType: ContainerTransitionType.fadeThrough,
              transitionDuration: const Duration(milliseconds: 700),
              closedBuilder: (_, VoidCallback openContainer) {
                return GestureDetector(
                  onTap: openContainer,
                  child: FortifyCardFrontCollectionView(
                    title: earnedCards[index].title,
                    description: earnedCards[index].description,
                    issuedDate: earnedCards[index].issuedDate,
                    timesHitLiveRounds: earnedCards[index].timesHitLiveRounds,
                    timesTaught: earnedCards[index].timesTaught,
                    lastTimeDrilled: earnedCards[index].lastTimeDrilled,
                    categoryText: context
                        .read<CardCollectionBloc>()
                        .getCategoryText(earnedCards, index),
                    imageUrl: earnedCards[index].imageUrl,
                    categoryColor: context
                        .read<CardCollectionBloc>()
                        .getCategoryColor(earnedCards, index),
                  ),
                );
              },
              openBuilder: (contextBuilder, _) => Scaffold(
                backgroundColor: const Color.fromARGB(255, 118, 127, 127),
                appBar: AppBar(
                  backgroundColor: const Color.fromARGB(255, 118, 127, 127),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(8),
                  child: FortifyCardFrontSelectedView(
                    title: earnedCards[index].title,
                    description: earnedCards[index].description,
                    issuedDate: earnedCards[index].issuedDate,
                    timesHitLiveRounds: earnedCards[index].timesHitLiveRounds,
                    timesTaught: earnedCards[index].timesTaught,
                    lastTimeDrilled: earnedCards[index].lastTimeDrilled,
                    categoryText: context
                        .read<CardCollectionBloc>()
                        .getCategoryText(earnedCards, index),
                    imageUrl: earnedCards[index].imageUrl,
                    categoryColor: context
                        .read<CardCollectionBloc>()
                        .getCategoryColor(earnedCards, index),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// TODO(any): Use layout builder to make the card responsive
// class CardViewCollection extends StatelessWidget {
//   const CardViewCollection({
//     required this.title,
//     required this.imageUrl,
//     required this.description,
//     this.categoryColor,
//     this.categoryText,
//     super.key,
//   });

//   final String title;
//   final String imageUrl;
//   final String description;
//   final Color? categoryColor;
//   final String? categoryText;
//   @override
//   Widget build(BuildContext context) {
//     return FortifyCardTemplate(
//       isSelectedView: false,
//       contents: [
//         const SizedBox(
//           height: 4,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Text(
//                 textAlign: TextAlign.center,
//                 title,
//                 style: const TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         SizedBox(
//           height: MediaQuery.sizeOf(context).height * .15,
//           width: double.infinity,
//           child: Image.network(
//             imageUrl,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         NesContainer(
//           backgroundColor: Colors.white,
//           padding: const EdgeInsets.all(1),
//           height: MediaQuery.of(context).size.height * .1,
//           width: double.infinity,
//           child: NesContainer(
//             backgroundColor: Colors.black12,
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text(
//                   textAlign: TextAlign.center,
//                   description,
//                   style: const TextStyle(fontSize: 6),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 7,
//                 ),
//               ],
//             ),
//           ),
//         ),
//         const Spacer(),
//         NesContainer(
//           backgroundColor: categoryColor,
//           padding: const EdgeInsets.all(6),
//           child: Container(
//             padding: const EdgeInsets.all(2),
//             color: categoryColor ?? Colors.white,
//             child: Text(
//               categoryText ?? '',
//               style: Theme.of(context).textTheme.bodySmall,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

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
