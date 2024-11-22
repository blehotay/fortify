import 'package:bloc/bloc.dart';
import 'package:card_repository/card_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'card_collection_event.dart';
part 'card_collection_state.dart';

class CardCollectionBloc
    extends Bloc<CardCollectionEvent, CardCollectionState> {
  CardCollectionBloc({
    required CardRepository cardRepository,
  })  : _cardRepository = cardRepository,
        super(const CardCollectionState()) {
    on<CardCollectionRequested>(_onEarnedCardRequested);
  }

  final CardRepository _cardRepository;

  Future<void> _onEarnedCardRequested(
    CardCollectionRequested event,
    Emitter<CardCollectionState> emit,
  ) async {
    emit(state.copyWith(status: PageStatus.loading));
    try {
      final earnedCards = await _cardRepository.getCards();
      emit(
        state.copyWith(
          earnedCards: earnedCards,
          status: PageStatus.success,
        ),
      );
    } catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(
        state.copyWith(
          status: PageStatus.error,
        ),
      );
    }
  }

  Color getCategoryColor(List<FortifyCard> earnedCards, int index) {
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

  String getCategoryText(List<FortifyCard> earnedCards, int index) {
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
}
