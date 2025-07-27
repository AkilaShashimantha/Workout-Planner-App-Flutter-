import 'package:workout_planner/models/exercise_model.dart';

class ExerciseData {
  
  final List<Exercise> exerciseList = [
    Exercise(id: 1, exercisename: "Push Up", exerciseImageUrl: "assets/exercises/exercise.png", noOfMinutes: 10, completed: false),
    Exercise(id: 2, exercisename: "Squat", exerciseImageUrl: "assets/exercises/cobra.png", noOfMinutes: 15, completed: false),
    Exercise(id: 3, exercisename: "Plank", exerciseImageUrl: "assets/images/plank.png", noOfMinutes: 5, completed: false),
    Exercise(id: 4, exercisename: "Lunges", exerciseImageUrl: "assets/images/lunges.png", noOfMinutes: 12, completed: false),
    Exercise(id: 5, exercisename: "Burpees", exerciseImageUrl: "assets/images/burpees.png", noOfMinutes: 8, completed: false),
    Exercise(id: 6, exercisename: "Mountain Climbers", exerciseImageUrl : "assets/exercises/run.png", noOfMinutes: 10, completed: false),
    Exercise(id: 7, exercisename: "Jumping Jacks", exerciseImageUrl: "assets/images/jumping_jacks.png", noOfMinutes: 7, completed: false),
  ];
  


}
