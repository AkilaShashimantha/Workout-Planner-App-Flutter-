import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddExerciseCard extends StatefulWidget {

final String exerciseTitle;
final String exerciseImageUrl;
final int noOfMinutes;
final bool isAdded;
final bool isFavorite;
final void Function() toggleAdddExercise;
final void Function() toggleAddFavExercise;

  const AddExerciseCard(
    {super.key,
    required this.exerciseTitle,
    required this.exerciseImageUrl,
    required this.noOfMinutes,
    required this.toggleAdddExercise,
    required this.toggleAddFavExercise,
    required this.isAdded,
    required this.isFavorite,
    });

  @override
  State<AddExerciseCard> createState() => _AddExerciseCardState();
}

class _AddExerciseCardState extends State<AddExerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kExerciseCardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Text(
              widget.exerciseTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              widget.exerciseImageUrl,
              width: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 5),
            Text(
              "${widget.noOfMinutes} minutes",
              style: TextStyle(
                fontSize: 16,
                color: kMainDarkBlueColor,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kSubtitleColor,
                  ),
                  child: IconButton(onPressed: () {
                    widget.toggleAdddExercise();
                  }, icon: Icon(
                    widget.isAdded ? Icons.remove : Icons.add,
                    
                    ), color: kMainDarkBlueColor, iconSize: 30,),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: kSubtitleColor,
                  ),
                  child: IconButton(onPressed: () {
                      widget.toggleAddFavExercise();
                  },
                   icon: Icon(
                    widget.isFavorite ? Icons.favorite : Icons.favorite_outline,
                   ),color: kSubPinkColor, iconSize: 30,
                   ),

                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}