import 'package:flutter/material.dart';
import 'package:workout_planner/constants/colors.dart';

class ProgressCard extends StatefulWidget {

  final double progressValue;
  final int total;

  const ProgressCard({super.key, required this.progressValue, required this.total});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {
  

int done = (widget.progressValue * widget.total).toInt();

   
return Container(
width: double.infinity,
height: 220,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors:
 [ kMainColor, kMainDarkBlueColor]
  ),
),

child: Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Protein, Facts, water & \nCarbohydrates",
      style: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.w600,
        color: kMainWhiteColor
      ),),
      SizedBox(height: 20),

      LinearProgressIndicator(
        value: widget.progressValue,
        backgroundColor: kMainWhiteColor.withOpacity(0.3),
        valueColor: AlwaysStoppedAnimation<Color>(kMainLightBlueColor),
        minHeight: 15,
        borderRadius: BorderRadius.circular(100),
      ),

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildTag("Done",done.toString()),
        _buildTag("Total",widget.total.toString()),
      ],
    )
    ],
  ),
),

);
  }

Widget _buildTag( String title, String value) {
  return Column(
    children: [
      Text(title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,

color: kMainWhiteColor    
  ),),
      SizedBox(height: 5),
     Text(value,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,

color: kMainWhiteColor    
  ),),

    ],
  );
}


}