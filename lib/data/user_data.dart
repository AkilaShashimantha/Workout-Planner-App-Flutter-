
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
  totlExercisesCompleted: 10,
  totalequipmentHandOvered: 5,
  exerciseList: [
    Exercise(id: 1, exercisename: "Push Up", exerciseImageUrl: "assets/exercises/exercise.png", noOfMinutes: 10, completed: false),
    Exercise(id: 2, exercisename: "Squat", exerciseImageUrl: "assets/exercises/cobra.png", noOfMinutes: 15, completed: false),
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
    Exercise(id: 1, exercisename: "Push Up", exerciseImageUrl: "assets/exercises/exercise.png", noOfMinutes: 10, completed: false),
  ],
);