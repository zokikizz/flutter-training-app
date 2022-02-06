import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runner_project/notifier/auth.notifier.dart';
import 'package:runner_project/notifier/notifier_list_typs.dart';
import 'package:runner_project/services/list_services.service.dart';
import 'package:runner_project/views/list_pages/empty_list_widget.dart';


class MealPlanPage extends StatefulWidget {
  const MealPlanPage({Key? key}) : super(key: key);

  @override
  _MealPlanListState createState() => _MealPlanListState();
}

class _MealPlanListState extends State<MealPlanPage> {

  @override
  void initState() {
    MealPlanListNotifier mealPlanNotifier =
        Provider.of<MealPlanListNotifier>(context, listen: false);

    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    getMealPlanList(mealPlanNotifier, authNotifier, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    MealPlanListNotifier mealPlanNotifier =
        Provider.of<MealPlanListNotifier>(context);
   
    return Scaffold(
      body: mealPlanNotifier.loaded
              ?
              displayList(mealPlanNotifier)
              : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(255, 63, 111, 1),
                  )
                )
                );
  }

  Widget displayList(MealPlanListNotifier mealPlanListNotifier) {
    return mealPlanListNotifier.list.isEmpty ?
      const EmptyListWidget()
      :
      ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: mealPlanListNotifier.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.restaurant, size: 35),
              title: Text('${mealPlanListNotifier.list[index]['empty_header_value-0']}'),
              subtitle: Text('${mealPlanListNotifier.list[index]['empty_header_value-0']}'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );

  }
}
