import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/exercise_model.dart';
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
                      );
                    },
                    
                    ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}