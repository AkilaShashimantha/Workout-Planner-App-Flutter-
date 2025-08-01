import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/data/user_data.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/models/exercise_model.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

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
                  SizedBox(height: 10),
                   Text("Here are all your favorite workouts.", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: kMainColor,
                ),),
                 SizedBox(height: 10),
                //Exercise Grid view
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 16/17,
                  ),
                  itemCount: userData.favExerciseList.length,
                itemBuilder: (context, index){
                  Exercise favExercise = userData.favExerciseList[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        children: [
                          Text(favExercise.exercisename,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold

                          ),
                          ),
                          SizedBox(height: 10,),
                          Image.asset(
                            favExercise.exerciseImageUrl,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "${favExercise.noOfMinutes.toString()} min workout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: kMainPinkColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                ),
                 SizedBox(height: 10),
                   Text("Here are all your favorite Equipments.", style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: kMainColor,
                ),),
                 SizedBox(height: 10),
                //Exercise Grid view
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: kDefaultPadding,
                  mainAxisSpacing: kDefaultPadding,
                  childAspectRatio: 16/24,
                  ),
                  itemCount: userData.favEquipmentList.length,
                itemBuilder: (context, index){
                  Equipment favEquipments = userData.favEquipmentList[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      child: Column(
                        children: [
                          Text(favEquipments.equipmentName,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold

                          ),
                          ),
                          SizedBox(height: 10,),
                          Image.asset(
                            favEquipments.equipmentImageUrl,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "${favEquipments.noOfMinutes.toString()} min workout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: kMainPinkColor,
                            ),
                          ),
                          SizedBox(height: 5,),
                             Text(
                           favEquipments.equipmentDescription,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: kSubtitleColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}