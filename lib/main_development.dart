import 'package:api_client/api_client.dart';
import 'package:card_repository/card_repository.dart';
import 'package:fortify/app/app.dart';
import 'package:fortify/bootstrap.dart';

void main() {
  bootstrap(() async {
    final cardRepository = CardRepository(
      fortifyCardResource: FortifyCardResource(
        client: ApiClient(
            // baseUrl: 'https://bb7d63ca-2ebb-456a-ab01-a88c4dd43475.mock.pstmn.io',
            baseUrl:
                'https://f706adae-a5c3-4f46-b484-44a79743ea82.mock.pstmn.io'
            // token: 'your_token',
            ),
      ),
    );

    return App(
      cardRepository: cardRepository,
    );
  });
}
