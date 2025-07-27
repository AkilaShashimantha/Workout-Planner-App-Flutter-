import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:workout_planner/constants/colors.dart';
import 'package:workout_planner/constants/responsive.dart';
import 'package:workout_planner/models/equipment_model.dart';
import 'package:workout_planner/widgets/equipment_card.dart';

class EquipmentDetailPage extends StatefulWidget {

  final String equipmentTitle;
  final String equipmentDescription;
  final List<Equipment> equipmentList;

  const EquipmentDetailPage({
    super.key,
    required this.equipmentTitle,
    required this.equipmentDescription,
    required this.equipmentList,
  });

  @override
  State<EquipmentDetailPage> createState() => _EquipmentDetailPageState();
}

class _EquipmentDetailPageState extends State<EquipmentDetailPage> {

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
              color: Colors.grey,
            )),
            Text(widget.equipmentTitle,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              )),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            children: [
              Text(
                widget.equipmentDescription,
                style: TextStyle(
                  fontSize: 16,
                  color: kMainBlackColor,
                ),
              ),
        
              SizedBox(height: 20),
        
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding,
                  childAspectRatio: 16 / 10,
                ),
                itemCount: widget.equipmentList.length,
                itemBuilder: (context, index) {
                  Equipment equipment = widget.equipmentList[index];
                  return EquipmentCard(
                    equipmentName: equipment.equipmentName,
                    equipmentDescription: equipment.equipmentDescription,
                    equipmentImageUrl: equipment.equipmentImageUrl,
                    noOfMinutes: equipment.noOfMinutes,
                    noOfCalories: equipment.noOfCalories,
                  );
                },
              )
        
            ],
          ),
        ),
      )
    );
  }
}