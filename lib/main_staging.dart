import 'package:api_client/api_client.dart';
import 'package:card_repository/card_repository.dart';
import 'package:fortify/app/app.dart';
import 'package:fortify/bootstrap.dart';

void main() {
  bootstrap(() async {
    final cardRepository = CardRepository(
      fortifyCardResource: FortifyCardResource(
        client: ApiClient(
          baseUrl: 'https://api.fortifyapp.com',
          // token: 'your_token',
        ),
      ),
    );

    return App(
      cardRepository: cardRepository,
    );
  });
}
