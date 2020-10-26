import 'package:data_driven_fitness_app/logic/model/exercise_concepts/routine.dart';
import 'package:data_driven_fitness_app/logic/model/model_constants.dart';
import 'package:flutter/material.dart';

class RoutineDetails extends StatelessWidget {
  const RoutineDetails({
    Key key,
    this.routine,
    this.headingStyle,
    this.detailStyle,
    this.height,
  }) : super(key: key);

  final Routine routine;
  final TextStyle headingStyle;
  final TextStyle detailStyle;
  final double height;

  Widget details() {
    String day = ModelConstants.dayOfWeekString(routine.day);
    List<Widget> exercises = List();
    List<Widget> columnParts = List();
    columnParts.add(Text(
      day,
      style: headingStyle != null
          ? headingStyle
          : TextStyle(
              color: Colors.white,
              fontSize: 17,
              shadows: [Shadow(color: Color(0x44000000), blurRadius: 4)],
            ),
    ));
    for (String string in routine.getDetails()) {
      exercises.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: Text(
            string,
            style: detailStyle != null
                ? detailStyle
                : TextStyle(color: Colors.white),
          ),
        ),
      );
    }
    columnParts.add(
      Container(
        height: height != null ? height : 60,
        width: 110,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: exercises,
            ),
          ),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: columnParts,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: details(),
    );
  }
}
