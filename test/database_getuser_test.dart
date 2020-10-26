import 'package:data_driven_fitness_app/logic/database_functions/database_functions.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'dart:convert';

class MockClient extends Mock implements http.Client {}

void main() {
  test('Testing API network call', () async {
    final dbf = new DatabaseFunctions();
    final client = MockClient();

    when(client.get(
        'https://datadrivenfitness.azurewebsites.net/api/Users/GetUser'))
        .thenAnswer((_) async =>
        http.Response(
            '{"userId":1,"email":"test@outlook.com","password":"testPassword!123","firstname":"test","lastname":"test","height":"100.0","weight":"100.0","timeCreated":"0001-01-01T00:00:00","userWorkouts":"null"}',
            200));

    expect(await dbf.login('test@outlook.com', 'testPassword!123'),
        isA<User>());
  });
}