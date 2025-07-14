import 'package:cougar_motor/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     appBar: AppBar(
       backgroundColor: Colors.white,
       surfaceTintColor: Colors.transparent,
     ),
      body: SingleChildScrollView(
        child: Column(
          children: [timer(), const SizedBox(height: 10), driverDetails()],
        ),
      ),
    );
  }
}
Widget timer() {
  final controller = Get.find<HomeController>();

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => controller.pickDate(Get.context!),
                child: Obx(() {
                  final date = controller.selectedDate.value;
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        date == null
                            ? "DD/mm/yy"
                            : "${date.day.toString().padLeft(2, '0')}/"
                            "${date.month.toString().padLeft(2, '0')}/"
                            "${date.year}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    "DNF TIME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            "Assigned Stage",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),

        //
        Obx(() {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                hint: const Text(
                  "Select Competition number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                value: controller.selectedCompetition.value,
                items: controller.competitionNumbers.map((String number) {
                  return DropdownMenuItem<String>(
                    value: number,
                    child: Text(number),
                  );
                }).toList(),
                onChanged: controller.selectCompetition,
                icon: const SizedBox.shrink(), // ✅ hide dropdown arrow
              ),
            ),
          );
        }),

      ],
    ),
  );
}


Widget driverDetails() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Driver Title
          const Text(
            "Driver",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),

          // Driver Info Row
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/driver.svg",
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Arnav Patel",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "+91 484756844",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Co-Driver Title
          const Text(
            "Co-Driver",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),

          // Co-Driver Info Row
          Row(
            children: [
              SvgPicture.asset(
                "assets/images/driver.svg",
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Arnav Patel",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "+91 484756844",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Vehicle details
          const Text(
            "Vehicle Name : TATA SAFARI",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          const Text(
            "Club/Team : Trail Blazers",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 4),
          const Text(
            "Class : Above 3010 cc Diesel Engines",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
