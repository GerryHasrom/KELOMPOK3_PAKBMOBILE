import 'package:flutter/material.dart';
import '../controller/workout_controller.dart';

class WorkoutProvider with ChangeNotifier {
  WorkoutController _workoutController = WorkoutController();

  WorkoutController get workoutController => _workoutController;
}
