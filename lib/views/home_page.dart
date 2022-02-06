import 'package:flutter/material.dart';
import 'package:runner_project/views/list_pages/payment_list.dart';
import 'package:runner_project/views/list_pages/trening_list_page.dart';
import 'package:runner_project/views/list_pages/meal_plan_page.dart';
import 'package:runner_project/views/list_pages/list_enum_type.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final body = {
    Display.trainingList: const TrainingPage(),
    Display.mealPlanList: const MealPlanPage(),
    Display.paymentList: const PaymentListPage(),
  };

  final titleText = {
    Display.trainingList: 'Training list',
    Display.mealPlanList: 'Meal plan',
    Display.paymentList: 'Payments',
  };

  Display currentDisplay = Display.trainingList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        appBar: AppBar(
          title: Text(titleText != null ? titleText[currentDisplay] as String : 'test'),
          ),
        drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              // TODO: here add icon of the app and title
              child: Text('Menu')),
            ListTile(
              leading: const Icon(Icons.directions_run),
              title: const Text('Training plan'),
              onTap: () {
                setState(() {
                  currentDisplay = Display.trainingList;
                  Navigator.of(context).pop();
                });
              },
              ),
            ListTile(
              leading: const Icon(Icons.restaurant),
              title: const Text('Meal plan'),
              onTap: () {
                setState(() {
                  currentDisplay = Display.mealPlanList;
                  Navigator.of(context).pop();
                });
              },
              ),
            ListTile( 
              leading: const Icon(Icons.monetization_on_outlined),
              title: const Text('Payment'),
              onTap: () {
                setState(() {
                  currentDisplay = Display.paymentList;
                  Navigator.of(context).pop();
                });
              },
              )
          ],
          ),
        ),
        body: body[currentDisplay],
      );
  }
}
