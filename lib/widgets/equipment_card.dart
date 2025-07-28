import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;

  const EquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentDescription,
    required this.equipmentImageUrl,
    required this.noOfMinutes,
    required this.noOfCalories,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kExerciseCardColor,
      ),

      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              equipmentName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),
            SizedBox(height: 10),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(equipmentImageUrl, fit: BoxFit.cover, width: 100),
                SizedBox(height: 10),
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${noOfMinutes.toString()} of workouts",
                      style: TextStyle(fontSize: 16, 
                      fontWeight: FontWeight.bold,
                      color: kSubPinkColor),
                    ),
                    Text(
                      "${noOfCalories.toString()} calories burned",
                      style: TextStyle(fontSize: 16,
                      fontWeight: FontWeight.bold,
                       color: kSubPinkColor),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              equipmentDescription,
              style: TextStyle(
                fontSize: 14,
                color: kMainBlackColor,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
