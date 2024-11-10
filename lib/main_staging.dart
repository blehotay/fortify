import 'package:card_repository/card_repository.dart';
import 'package:fortify/app/app.dart';
import 'package:fortify/bootstrap.dart';

void main() {
  bootstrap(() async {
    const cardRepository = CardRepository();

    return const App(
      cardRepository: cardRepository,
    );
  });
}
