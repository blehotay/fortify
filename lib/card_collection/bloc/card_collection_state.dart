part of 'card_collection_bloc.dart';

enum PageStatus { inital, loading, success, error }

class CardCollectionState extends Equatable {
  const CardCollectionState({
    this.earnedCards = const [],
    this.purchasedCards = const [],
    this.status = PageStatus.inital,
  });

  final List<FortifyCard>? earnedCards;
  final List<FortifyCard>? purchasedCards;
  final PageStatus status;

  CardCollectionState copyWith({
    List<FortifyCard>? earnedCards,
    List<FortifyCard>? purchasedCards,
    PageStatus? status,
  }) {
    return CardCollectionState(
      earnedCards: earnedCards ?? this.earnedCards,
      purchasedCards: purchasedCards ?? this.purchasedCards,
      status: status ?? this.status,
    );
  }

  Color getcategoryColor(List<FortifyCard> earnedCards, int index) {
    switch (earnedCards[index].category) {
      case Category.sweep:
        return Colors.blue;
      case Category.pass:
        return Colors.green;
      case Category.submission:
        return Colors.red;
      case Category.takedown:
        return Colors.orange;
    }
  }

  String getcategoryText(List<FortifyCard> earnedCards, int index) {
    switch (earnedCards[index].category) {
      case Category.sweep:
        return 'Sweep';
      case Category.pass:
        return 'Pass';
      case Category.submission:
        return 'Submission';
      case Category.takedown:
        return 'Takedown';
    }
  }

  @override
  List<Object?> get props => [
        earnedCards,
        purchasedCards,
        status,
      ];
}
