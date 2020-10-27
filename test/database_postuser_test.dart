import 'package:data_driven_fitness_app/logic/database_functions/database_functions.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_statistics.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'dart:convert';

class MockClient extends Mock implements http.Client {}

void main() {
  test('returns a Post if the http call completes successfully', () async {
    final dbf = new DatabaseFunctions();
    final client = MockClient();

    final userStatistics = new UserStatistics(185, 185, null, null);
    final userRegime = new UserRegime(null, null, UserGoals.BOTH);
    final testUser = new User(
        5, 'test@gmail,com', 'Tester', 'TesterLname', userStatistics,
        userRegime);


    when(client.post(
        'https://datadrivenfitness.azurewebsites.net/api/Users'))
        .thenAnswer((_) async =>
        http.Response(
            '{"userId":"5","email":"test@gmail,com", "password":"1234", "firstname":"Tester","lastname":"TesterLname"}', 201));

    expect(await dbf.createInitialUserDbEntry(testUser, '1234'),
        isA<int>());
  });
}