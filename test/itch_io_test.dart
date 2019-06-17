import 'package:itch_io/itch_io.dart';
import 'package:test/test.dart';
import '../secure/itch_io_api_key.dart';

void main() {
  group('Itch.IO REST API', () {

    ItchIOClient client;

    setUp(() {
    client = ItchIOClient(APIKey.value);
    });

    test('getCredentialsInfo', () async{
      var result = await client.getCredentialsInfo();
      expect(result!=null,true);
    });

    test('getUserProfile', () async{
      var result = await client.getUserProfile();
      expect(result!=null,true);
    });

    test('getUserGames', () async{
      var result = await client.getUserGames();
      expect(result!=null,true);
    });
  });
}
