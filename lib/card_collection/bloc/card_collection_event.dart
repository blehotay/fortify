part of 'card_collection_bloc.dart';

sealed class CardCollectionEvent extends Equatable {
  const CardCollectionEvent();
}

class CardCollectionRequested extends CardCollectionEvent {
  const CardCollectionRequested();
  @override
  List<Object?> get props => [];
}
