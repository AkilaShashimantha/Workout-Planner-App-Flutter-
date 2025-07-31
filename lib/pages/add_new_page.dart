import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/add_eqipment_card.dart';
import 'package:workout_planner/widgets/add_exercise_card.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  State<AddNewPage> createState() => _AddNewPageState();
}

class _AddNewPageState extends State<AddNewPage> {

final userData = user;

final exerciseList = ExerciseData().exerciseList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello , ${userData.fullName}", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: kMainBlackColor,
                )),
                SizedBox(height: 20),
                Text(
                  "Lets Add Some Workouts and Equipment for today",
                  style: TextStyle(
                    fontSize: 18,
                    color: kMainDarkBlueColor,
                  ),  
                ),
                SizedBox(height: 20),
                Text(
                  "All Exercises",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 10),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: exerciseList.length,
                    itemBuilder: (context, index) {
                     Exercise exercise = exerciseList[index];
                      return AddExerciseCard(
                        exerciseTitle: exercise.exercisename,
                        exerciseImageUrl: exercise.exerciseImageUrl,
                        noOfMinutes: exercise.noOfMinutes,
                        isAdded: userData.exerciseList.contains(exercise),
                        isFavorite: userData.favExerciseList.contains(exercise),
                        toggleAdddExercise: () {
                          setState(() {
                            if(userData.exerciseList.contains(exercise)){
                               userData.removeExercise(exercise);
                              print(userData.exerciseList.length);
                            }else{
                               userData.addExercise(exercise);
                               print(userData.exerciseList.length);
                            }
                             
                              
                          });
                         
                        },

                        toggleAddFavExercise: () {
                          setState(() {
                            if(userData.favExerciseList.contains(exercise)){
                              userData.removeFavExercise(exercise);
                               print(userData.favExerciseList.length);
                            }else{
                              userData.addFavExercise(exercise);
                               print(userData.favExerciseList.length);
                            }
                          });
                        },

                      );
                    },

                    
                    ),
                ),
                   SizedBox(height: 20),
                Text(
                  "All Equipments",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kMainBlackColor,
                  ),
                ),
                SizedBox(height: 10),
                //List view of Equipment 

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.32,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: EquipmentData().equipmentList.length,
                      itemBuilder: (context, index) {
                        Equipment equipment = EquipmentData().equipmentList[index];
                        return AddEquipmentCard(
                          equipmentName: equipment.equipmentName,
                          equipmentDescription: equipment.equipmentDescription,
                          equipmentImageUrl: equipment.equipmentImageUrl,
                          noOfMinutes: equipment.noOfMinutes,
                          noOfCalories: equipment.noOfCalories,

                          isAddEquipment: userData.equipmentList.contains(equipment),
                          isAddFavEquipment: userData.favEquipmentList.contains(equipment),
                          toggleAddEquipment: () {
                            // Handle add equipment toggle
                            setState(() {
                              if(userData.equipmentList.contains(equipment)){
                                userData.removeEquipment(equipment);
                                print('Removed ${equipment.equipmentName}. Current equipment list: ${userData.equipmentList.map((e) => e.equipmentName).toList()}');
                              }
                              else{
                                userData.addEquipment(equipment);
                                 print('Added ${equipment.equipmentName}. Current equipment list: ${userData.equipmentList.map((e) => e.equipmentName).toList()}');
                              }
                            });
                                                     
                          },

                          toggleAddFavEquipment: () {
                          setState(() {
                              if(userData.favEquipmentList.contains(equipment)){
                              userData.removeFavEquipment(equipment);
                            }else{
                              userData.addFavEquipment(equipment);
                               print('Added ${equipment.equipmentName}. Current equipment list: ${userData.equipmentList.map((e) => e.equipmentName).toList()}');
                            }
                          });
                          },
                        );
                      },
                      ),
                  ),
                ),
                SizedBox(height: 50),

              ],
              
            ),
          ),
        ),
      ),
    );
  }
}