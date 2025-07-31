import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';

class AddEquipmentCard extends StatefulWidget {
  final String equipmentName;
  final String equipmentDescription;
  final String equipmentImageUrl;
  final int noOfMinutes;
  final double noOfCalories;
  final bool isAddEquipment;
  final bool isAddFavEquipment;

  final void Function() toggleAddEquipment;
  final void Function() toggleAddFavEquipment;

  const AddEquipmentCard({
    super.key,
    required this.equipmentName,
    required this.equipmentDescription,
    required this.equipmentImageUrl,
    required this.noOfMinutes,
    required this.noOfCalories,
    required this.toggleAddEquipment,
    required this.isAddEquipment,
    required this.isAddFavEquipment,
    required this.toggleAddFavEquipment,
  });

  @override
  State<AddEquipmentCard> createState() => _AddEquipmentCardState();
}

class _AddEquipmentCardState extends State<AddEquipmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kExerciseCardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 2,
          vertical: kDefaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.equipmentName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kMainBlackColor,
              ),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  widget.equipmentImageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),

                SizedBox(width: 20),
                SizedBox(
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.equipmentDescription,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: kSubtitleColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        widget.noOfMinutes.toString() +
                            " minutes and " +
                            widget.noOfCalories.toString() +
                            " calories burned.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: kMainDarkBlueColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
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
                        child: IconButton(
                          onPressed: () {
                            widget.toggleAddEquipment();
                          },
                          icon: Icon(
                            widget.isAddEquipment ? Icons.remove : Icons.add,
                          ),
                          color: kMainDarkBlueColor,
                          iconSize: 30,
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kSubtitleColor,
                        ),
                        child: IconButton(
                          onPressed: () {
                            widget.toggleAddFavEquipment();
                          },
                          icon: Icon(
                            widget.isAddFavEquipment
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                          ),
                          color: kSubPinkColor,
                          iconSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
