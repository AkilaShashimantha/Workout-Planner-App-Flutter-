

import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';

class User {

final String userId;
final String fullName;
final String gender;
final String address;
final int age;
final String description;
int totalExercisesCompleted = 0;
int totalequipmentHandOvered = 0;

final List<Exercise> exerciseList;
final List<Equipment> equipmentList;

final List<Exercise> favExerciseList;
final List<Equipment> favEquipmentList;

User({
  required this.userId,
  required this.fullName,
  required this.gender,
  required this.address,
  required this.age,
  required this.description,
  required this.totalExercisesCompleted,
  required this.totalequipmentHandOvered,
  required this.exerciseList,
  required this.equipmentList,
  required this.favExerciseList,
  required this.favEquipmentList,
});

//method to add new Exercise to the exerciseList

void addExercise(Exercise exercise){
  exerciseList.add(exercise);
}

//method to remove a exercise from a exerciselist

void removeExercise(Exercise exercise){
  exerciseList.remove(exercise);
}

//method to add Favorite exercise to the favExerciseList
void addFavExercise(Exercise exercise){
  favExerciseList.add(exercise);
}

//method to remove Favorite exercie from the favExerciseList
void removeFavExercise(Exercise exercise){
favExerciseList.remove(exercise);
}

//method to add new equipment to the user's equipment list

void addEquipment(Equipment equipment) {
  equipmentList.add(equipment);

}

//method to remove equipment from the user's equipment list
void removeEquipment(Equipment equipment) {
  equipmentList.remove(equipment);
  
   }

 //method to add an equipment to favourite list

 void addFavEquipment(Equipment equipment){
  favEquipmentList.add(equipment);
 }  

//method to remove favourite list

void removeFavEquipment(Equipment equipment){
  favEquipmentList.remove(equipment);
}

//method calculate the total exercises spend

int calculateTotalMinutesSpend(){
  int totalMinutesSpend =0;

//loop through the exerciseList and calculate the no og minutes

for( var exercise in exerciseList){
  totalMinutesSpend += exercise.noOfMinutes;
}

//loop through the equipmentsList and calculate the no og minutes

for( var equipment in equipmentList){
  totalMinutesSpend += equipment.noOfMinutes;

}

  return totalMinutesSpend;
}

//method to mark as exrcise completed

void markExerciseAsCompleted(int exerciseId){

final exercise = exerciseList.firstWhere((exercise) => exercise.id == exerciseId);


exercise.completed = true;
//remove from the exercise

removeExercise(exercise);

totalExercisesCompleted++;

}

//method to mark an equpment as handed over

void markAsHandOvered(int equipmentId){

  final equipment = equipmentList.firstWhere((equipment) => equipment.id == equipmentId);

equipment.handOvered == true;

removeEquipment(equipment);

totalequipmentHandOvered++;

}

//method to calculate  the total number of calories burned by the user

double calculateTotalCaloriesBurned(){

double totalCaloriesBurned = 0;

for( var equipment in equipmentList){
  totalCaloriesBurned += equipment.noOfCalories;
}
//cover the totalCaloriesBurned in to a value between 0-1
if(totalCaloriesBurned >0 && totalCaloriesBurned <=10){
  totalCaloriesBurned = totalCaloriesBurned/10;
}
if(totalCaloriesBurned >10 && totalCaloriesBurned <=100){
  totalCaloriesBurned = totalCaloriesBurned/100;
}
if(totalCaloriesBurned >100 && totalCaloriesBurned <=1000){
  totalCaloriesBurned = totalCaloriesBurned/1000;
}
return totalCaloriesBurned;
}

}
