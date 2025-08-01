
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/models/user_model.dart';

User user = User(
  userId: "user123",
  fullName: "John Doe",
  gender: "Male",
  address: "123 Fitness St, Workout City",
  age: 25,
  description: "Fitness enthusiast",
  totalExercisesCompleted: 0,
  totalequipmentHandOvered: 0,
  exerciseList: [
    Exercise(id: 1, exercisename: "Push Up", exerciseImageUrl: "assets/exercises/push-ups.png", noOfMinutes: 10, completed: false),
    Exercise(id: 2, exercisename: "Squat", exerciseImageUrl: "assets/exercises/squats.png", noOfMinutes: 15, completed: false),
  ],
  equipmentList: [
    Equipment(
      id: 1,
      equipmentName: "Dumbbell",
      equipmentDescription: "A dumbbell is a type of free weight that is used for strength training.",
      equipmentImageUrl: "assets/equipments/dumbbell.png",
      noOfMinutes: 30,
      noOfCalories: 200.0,
      handOvered: false,
    ),
  ],
  favEquipmentList: [
    Equipment(
      id: 1,
      equipmentName: "Dumbbell",
      equipmentDescription: "A dumbbell is a type of free weight that is used for strength training.",
      equipmentImageUrl: "assets/equipments/dumbbell.png",
      noOfMinutes: 30,
      noOfCalories: 200.0,
      handOvered: false,
    ),
  ],
  favExerciseList: [
    Exercise(id: 1, exercisename: "Push Up", exerciseImageUrl: "assets/exercises/push-ups.png", noOfMinutes: 10, completed: false),
  ],
);