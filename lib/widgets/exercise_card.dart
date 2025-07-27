import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';

class ExerciseCard extends StatelessWidget {

final String title;
final String imageUrl;
final String description;

  const ExerciseCard({super.key
  , required this.title, required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      
      decoration: BoxDecoration(
        color: kExerciseCardColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 0,
            offset: Offset(0, 5),
          ),
        ]
      ),
      child: Column(children: [
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: kMainBlackColor,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Image.asset(imageUrl,
        width:100 ,
        fit: BoxFit.cover,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          description,
          style: TextStyle(
            fontSize: 14,
            color: kMainColor,
          ),
          textAlign: TextAlign.center,
        ),
       
      ],),
    );
  }
}