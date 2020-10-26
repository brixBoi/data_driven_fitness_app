///enum of days of the week used for routines
enum Days {
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
}

class ModelConstants {
  static String dayOfWeekString(Days day) {
    String output;
    switch (day) {
      case Days.MONDAY:
        output = "Monday";
        break;
      case Days.TUESDAY:
        output = "Tuesday";
        break;
      case Days.WEDNESDAY:
        output = "Wednesday";
        break;
      case Days.THURSDAY:
        output = "Thursday";
        break;
      case Days.FRIDAY:
        output = "Friday";
        break;
      case Days.SATURDAY:
        output = "Saturday";
        break;
      case Days.SUNDAY:
        output = "Sunday";
        break;
    }
    return output;
  }
}

///enum of different muscle groups exercises belong to
enum MuscleGroups {
  LEGS,
  CHEST,
  BACK,
  CORE,
  ARMS,
  UPPER_LEGS,
  LOWER_LEGS,
  BICEPS,
  TRICEPS,
  FOREARM,
  CARDIO,
}

enum ExerciseType {
  CARDIO,
  WEIGHTED,
  CALISTHENIC,
  OTHER,
}
