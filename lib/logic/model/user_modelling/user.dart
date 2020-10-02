import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_statistics.dart';

///class for user creation
///
/// stores all of users workout/lift stats
class User {
  int personId;
  String email;
  String firstName;
  String lastName;
  UserStatistics userStatistics;
  UserRegime userRegime;
  bool initialized;

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

  ///Constructs User from JSON.
  /// As if a complete user - probably buggy until full db implementation
  factory User.fromJson(Map<String, dynamic> json) {
    User user = User(json['userId'],
        json['email'],
        json['firstname'],
        json['lastname'],
        UserStatistics(json['height'], json['weight'], Set(), Set()),
        UserRegime.blank(UserGoals.BULK));
    return user;
  }

  ///method to initialize a user with their user stats and regime
  void initializeUser(double height, double weight, UserGoals userGoal) {
    initialized = true;
    this.userStatistics = UserStatistics(height, weight, Set(), Set());
    this.userRegime = UserRegime.blank(userGoal);
  }


}


