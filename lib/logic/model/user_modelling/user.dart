import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_statistics.dart';

class User {
  /// Constructs a new User object with all attributes specified
  User(this.personId, this.email, this.firstName, this.lastName,
      this.userStatistics, this.userRegime) {
    initialized = true;
  }

  /// Constructs a new User object with blank UserRegime and UserStatistics
  User.blank(
    this.personId,
    this.email,
    this.firstName,
    this.lastName,
  ) {
    initialized = false;
  }

  void initializeUser(double height, double weight, UserGoals userGoal) {
    this.userStatistics = UserStatistics(height, weight, Set(), Set());
    this.userRegime = UserRegime.blank(userGoal);
  }

  int personId;
  String email;
  String firstName;
  String lastName;
  UserStatistics userStatistics;
  UserRegime userRegime;
  bool initialized;
}
