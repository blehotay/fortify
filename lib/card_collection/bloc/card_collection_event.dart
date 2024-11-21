part of 'card_collection_bloc.dart';

sealed class CardColectionEvent extends Equatable {
  const CardColectionEvent();
}

class CardColectionRequested extends CardColectionEvent {
  const CardColectionRequested();
  @override
  List<Object?> get props => [];
}
