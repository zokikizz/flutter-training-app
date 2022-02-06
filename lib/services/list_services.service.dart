import 'package:flutter/material.dart';
import 'package:runner_project/notifier/auth.notifier.dart';
import 'package:runner_project/notifier/notifier_list_typs.dart';
import 'package:runner_project/services/base_list.service.dart';

const urlPrefix = '/google-sheets';

Future<void> getTreningList(TrainingPlanListNotifier trainingNotifier, AuthNotifier authNotifier, BuildContext context) async {
  getList(trainingNotifier, authNotifier, urlPrefix + '/training-list');
}

Future<void> getMealPlanList(MealPlanListNotifier mealNotifier, AuthNotifier authNotifier, BuildContext context) async {
  getList(mealNotifier, authNotifier, urlPrefix + '/meals-plan');
}

Future<void> getPaymentList(PaymentListNotifier paymentNotifier, AuthNotifier authNotifier, BuildContext context) async {
  getList(paymentNotifier, authNotifier, urlPrefix + '/payments');
}

