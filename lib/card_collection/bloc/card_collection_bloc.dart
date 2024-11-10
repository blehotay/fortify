import 'package:bloc/bloc.dart';
import 'package:card_repository/card_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'card_collection_event.dart';
part 'card_collection_state.dart';

class CardCollectionBloc extends Bloc<CardColectionEvent, CardCollectionState> {
  CardCollectionBloc({
    required CardRepository cardRepository,
  })  : _cardRepository = cardRepository,
        super(CardCollectionState()) {
    on<CardColectionRequested>(_onEarnedCardRequested);
  }

  final CardRepository _cardRepository;

  Future<void> _onEarnedCardRequested(
    CardColectionRequested event,
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
}
