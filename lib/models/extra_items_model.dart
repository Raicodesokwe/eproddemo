import 'package:flutter/material.dart';

class ExtraItemsModel {
  final Widget icon;
  final String label;

  ExtraItemsModel({required this.icon, required this.label});
}

List<ExtraItemsModel> extraItemsList = [
  ExtraItemsModel(
      icon: Image.asset('assets/images/survey.png'), label: 'Surveys'),
  ExtraItemsModel(
      icon: Image.asset('assets/images/checkweather.png'),
      label: 'Check weather'),
  ExtraItemsModel(
      icon: Image.asset('assets/images/qrscan.png'),
      label: 'Check seed authenticity'),
];
