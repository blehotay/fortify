part of 'card_collection_bloc.dart';

enum PageStatus { initial, loading, success, error }

class CardCollectionState extends Equatable {
  const CardCollectionState({
    this.earnedCards = const [],
    this.purchasedCards = const [],
    this.status = PageStatus.initial,
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

  @override
  List<Object?> get props => [
        earnedCards,
        purchasedCards,
        status,
      ];
}
