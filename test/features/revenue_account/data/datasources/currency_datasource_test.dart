import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

@GenerateMocks([MockHttpClient])
void main() {
  group('all', () {
    test(
      'test',
      () async {
        final client = MockHttpClient();

        // arrange
        when(client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          headers: {
            'Content-Type': 'application/json',
          },
        )).thenAnswer((_) async =>
            http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

        verify(client.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
          headers: {
            'Content-Type': 'application/json',
          },
        ));
      },
    );
  });
}
