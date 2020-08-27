import 'package:data_driven_fitness_app/logic/model/user_statistics.dart';

import 'user_regime.dart';

class User {
  /// Constructs a new User object with all attributes specified
  User(this.personId, this.email, this.firstName, this.lastName,
      this.userStatistics, this.userRegime);

  /// Constructs a new User object with blank UserRegime and UserStatistics
  User.blank(this.personId, this.email, this.firstName, this.lastName,
      double height, double weight) {
    this.userStatistics = UserStatistics(height, weight, Set(), Set());
    this.userRegime = UserRegime.blank();
  }

  int personId;
  String email;
  String firstName;
  String lastName;
  UserStatistics userStatistics;
  UserRegime userRegime;
}
