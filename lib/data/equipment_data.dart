import 'package:workout_planner/models/equipment_model.dart';

class EquipmentData {

final List<Equipment> equipmentList = [
    Equipment(
      id: 1,
      equipmentName: "Dumbbell",
      equipmentDescription: "A dumbbell is a type of free weight that is used for strength training.",
      equipmentImageUrl: "assets/equipments/dumbbell.png",
      noOfMinutes: 30,
      noOfCalories: 200.0,
      handOvered: false,
    ),
    Equipment(
      id: 2,
      equipmentName: "Barbell",
      equipmentDescription: "A barbell is a long bar with weights on either end, used for weightlifting.",
      equipmentImageUrl: "assets/equipments/gym.png",
      noOfMinutes: 45,
      noOfCalories: 300.0,
      handOvered: false,
    ),
    Equipment(
      id: 3,
      equipmentName: "Kettlebell",
      equipmentDescription: "A kettlebell is a cast-iron ball with a handle, used for strength training.",
      equipmentImageUrl: "assets/equipments/kettlebell.png",
      noOfMinutes: 25,
      noOfCalories: 180.0,
      handOvered: false,
    ),
    Equipment(
      id: 4,
      equipmentName: "Resistance Bands",
      equipmentDescription: "Resistance bands are elastic bands used for strength training and rehabilitation.",
      equipmentImageUrl: "assets/equipments/gym.png",
      noOfMinutes: 20,
      noOfCalories: 150.0,
      handOvered: false,
    ),
    Equipment(
      id: 5,
      equipmentName: "Medicine Ball",
      equipmentDescription:
          "A medicine ball is a weighted ball used for strength training, core workouts, and rehabilitation.",
      equipmentImageUrl: "assets/equipments/gym.png",
      noOfMinutes: 35,
      noOfCalories: 220.0,
      handOvered: false,
    ),
  ];


}