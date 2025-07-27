import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
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
                   Text("${user.fullName}", style: TextStyle(
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

                ExerciseCard(title: "WarmUp", imageUrl: "assets/exercises/treadmill-machine.png", description: "See more")

              ],
            ),
          )
        ),
      ),
    );
  }
}