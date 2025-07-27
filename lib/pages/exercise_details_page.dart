import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/models/exercise_model.dart';
import 'package:workout_planner/widgets/exercise_card.dart';

class ExerciseDetailsPage extends StatefulWidget {

final String exerciseTitle;
final String exerciseDescription;
final List<Exercise> exerciseList;

  const ExerciseDetailsPage({
    super.key,
    required this.exerciseTitle,
    required this.exerciseDescription,
    required this.exerciseList,
  });

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {

final DateFormat formatter = DateFormat('EEEE, MMMM');
final DateFormat dayFormat = DateFormat('dd');

  @override
  Widget build(BuildContext context) {

DateTime now = DateTime.now();
String formattedDate = formatter.format(now);
String formattedDay = dayFormat.format(now);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
               Text("$formattedDate $formattedDay", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: kSubtitleColor,
                ),),
                   Text(widget.exerciseTitle,
                    style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: kMainBlackColor,
                ),),
        ],  
        ),
      ),

      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(children: [
               Text(widget.exerciseDescription,
                      style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: kMainBlackColor,
                  ),),
            SizedBox(height: 20),

            //Grid View
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: kDefaultPadding,
                mainAxisSpacing: kDefaultPadding,
                ), 
                itemCount: widget.exerciseList.length,
                itemBuilder: (context, index) {
                 Exercise exercise = widget.exerciseList[index];
                  return ExerciseCard(
                    title: exercise.exercisename,
                    imageUrl: exercise.exerciseImageUrl,
                    description: "${exercise.noOfMinutes} of workout",
                  );
                 
                },
            ),
          ],),
        )
      ),

    );
  }
}