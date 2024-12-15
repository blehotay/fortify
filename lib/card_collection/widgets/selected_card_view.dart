// import 'package:app_ui/app_ui.dart';
// import 'package:flip_card/flip_card.dart';
// import 'package:flutter/material.dart';
// import 'package:nes_ui/nes_ui.dart';

// class SelectedCardView extends StatelessWidget {
//   const SelectedCardView({
//     required this.title,
//     required this.categoryText,
//     required this.imageUrl,
//     required this.categoryColor,
//     required this.description,
//     required this.timesHitLiveRounds,
//     required this.earnedCardDate,
//     required this.lastTimeDrilled,
//     required this.timesTaught,
//     super.key,
//   });

//   final String title;
//   final String categoryText;
//   final String imageUrl;
//   final String description;
//   final Color categoryColor;
//   final String lastTimeDrilled;
//   final String earnedCardDate;
//   final String timesHitLiveRounds;
//   final String timesTaught;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 118, 127, 127),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 118, 127, 127),
//         title: Text(title),
//         elevation: 2,
//       ),
//       body: FlipCard(
//         front: Padding(
//           padding: const EdgeInsets.all(8),
//           child: FortifyCardFrontSelectedView(
//             title: title,
//             categoryText: categoryText,
//             imageUrl: imageUrl,
//             categoryColor: categoryColor,
//             lastTimeDrilled: lastTimeDrilled,
//             earnedCardDate: earnedCardDate,
//             timesHitLiveRounds: timesHitLiveRounds,
//             timesTaught: timesTaught,
//             description: description,
//           ),
//         ),
//         back: Padding(
//           padding: const EdgeInsets.all(8),
//           child: FortifyCardTemplate(
//             contents: [
//               Container(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BackCardView extends StatelessWidget {
//   const BackCardView({
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
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         SizedBox(
//           height: MediaQuery.sizeOf(context).height * .35,
//           width: double.infinity,
//           child: Image.network(
//             imageUrl,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(
//           height: 24,
//         ),
//         NesContainer(
//           backgroundColor: Colors.white,
//           padding: const EdgeInsets.all(1),
//           height: MediaQuery.of(context).size.height * .25,
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
//                   style: Theme.of(context).textTheme.bodyLarge,
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
//           padding: const EdgeInsets.all(12),
//           child: Container(
//             padding: const EdgeInsets.all(2),
//             color: categoryColor ?? Colors.white,
//             child: Text(
//               categoryText ?? '',
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
