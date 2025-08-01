import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/profile_card.dart';
import 'package:workout_planner/widgets/progress_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

final DateFormat formatter = DateFormat('EEEE, MMMM');
final DateFormat dayFormat = DateFormat('dd');

//User Data
final userData = user;

  @override
  Widget build(BuildContext context) {

DateTime now = DateTime.now();
String formattedDate = formatter.format(now);
String formattedDay = dayFormat.format(now);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
             child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("$formattedDate $formattedDay", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: kSubtitleColor,
                ),),
                   Text("${userData.fullName}", style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor,
                ),),
                SizedBox(height: 20),
                ProgressCard(
                  progressValue: userData.calculateTotalCaloriesBurned(),
                  total: 100,
                ),

                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kExerciseCardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total Minutes Spend: ${userData.calculateTotalMinutesSpend().toString()}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kMainDarkBlueColor,
                          ),
                        ),
                        SizedBox(height: 20),
                         Text(
                          "Total Exercises Completed: ${userData.totalExercisesCompleted.toString()}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kMainBlackColor,
                          ),
                        ),
                         Text(
                          "Total Equipment Handovered: ${userData.totalequipmentHandOvered}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: kMainBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                SizedBox(height: 10),
                 Text("Your Exercises", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kMainBlackColor,
                ),),
                // ExerciseList of the User
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.exerciseList.length,
                  itemBuilder: (context, index){
                  Exercise userExercise = userData.exerciseList[index];
                  return ProfileCard(taskName: userExercise.exercisename, taskImageUrl: userExercise.exerciseImageUrl, 
                  markAsDone: () {
                    setState(() {
                      userData.markExerciseAsCompleted(userExercise.id);
                    });
                  },);
                }),

                SizedBox(height: 10),
                 Text("Your Equipments", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kMainBlackColor,
                ),),
                // ExerciseList of the User
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userData.equipmentList.length,
                  itemBuilder: (context, index){
                  Equipment userEquipment = userData.equipmentList[index];
                  return ProfileCard(taskName: userEquipment.equipmentName, taskImageUrl: userEquipment.equipmentImageUrl, 
                  markAsDone: () {
                    setState(() {
                      userData.markAsHandOvered(userEquipment.id);
                    });
                  },);
                }),
              ],
        ),
      ),
    ),
      ),
    );
  }
}