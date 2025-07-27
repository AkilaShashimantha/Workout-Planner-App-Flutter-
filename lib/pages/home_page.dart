import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/equipment_data.dart';
import 'package:workout_planner/data/exercise_data.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/pages/exercise_details_page.dart';
import 'package:workout_planner/widgets/exercise_card.dart';
import 'package:workout_planner/widgets/progress_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
final DateFormat formatter = DateFormat('EEEE, MMMM');
final DateFormat dayFormat = DateFormat('dd');

//User Data
final userData = user;

//Exercise Data
final exerciseList = ExerciseData().exerciseList;
final equipmentList = EquipmentData().equipmentList;
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
                  progressValue:0.3,
                  total: 100,
                ),

                SizedBox(height: 20),
                Text("Today's Activity", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: kMainBlackColor,
                ),),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ExerciseDetailsPage(
                            exerciseTitle: "Warm Up",
                            exerciseDescription: "A brief warm-up session to get started.",
                            exerciseList: exerciseList,
                          ),
                        ));
                      },
                      child: ExerciseCard(title: "WarmUp", imageUrl: "assets/exercises/yoga.png", description: "See more")),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ExerciseDetailsPage(
                            exerciseTitle: "Equipment",
                            exerciseDescription: "Explore various workout equipment.",
                            exerciseList: exerciseList,
                          ),
                        ));
                      },
                      child: ExerciseCard(title: "Equipment", imageUrl: "assets/equipments/gym.png", description: "See more")),
                  ],
                ),
                SizedBox(height: 20),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ExerciseDetailsPage(
                            exerciseTitle: "Exercise",
                            exerciseDescription: "Explore various exercises.",
                            exerciseList: exerciseList,
                          ),
                        ));
                      },
                      child: ExerciseCard(title: "Exercise", imageUrl: "assets/exercises/treadmill-machine.png", description: "See more")),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ExerciseDetailsPage(
                            exerciseTitle: "Stretching",
                            exerciseDescription: "Explore various stretching exercises.",
                            exerciseList: exerciseList,
                          ),
                        ));
                      },
                      child: ExerciseCard(title: "Stretching", imageUrl: "assets/exercises/woman.png", description: "See more")),
                  ],
                ),

              ],
            ),
          )
        ),
      ),
    );
  }
}