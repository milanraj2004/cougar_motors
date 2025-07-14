import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedDate = Rxn<DateTime>();

  void pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }
}
