import 'package:flutter/material.dart';

class QuickActionsModel {
  final Widget icon;
  final String label;

  QuickActionsModel({required this.icon, required this.label});
}

List<QuickActionsModel> quickActionsList = [
  QuickActionsModel(
      icon: Image.asset('assets/images/farmenterprise.png'),
      label: 'Create farm enterprise'),
  QuickActionsModel(
      icon: Image.asset('assets/images/farmrecords.png'),
      label: 'Farm records'),
  QuickActionsModel(
      icon: Image.asset('assets/images/adduser.png'),
      label: 'Add team members'),
  QuickActionsModel(
      icon: Image.asset('assets/images/farmstore.png'),
      label: 'Manage farm store'),
  QuickActionsModel(
      icon: Image.asset('assets/images/farmreports.png'),
      label: 'Farm reports'),
];
