import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runner_project/notifier/auth.notifier.dart';
import 'package:runner_project/notifier/notifier_list_typs.dart';
import 'package:runner_project/services/list_services.service.dart';
import 'package:runner_project/views/list_pages/empty_list_widget.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({Key? key}) : super(key: key);

  @override
  _TrainingListState createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingPage> {

  @override
  void initState() {
    TrainingPlanListNotifier trainingNotifier =
        Provider.of<TrainingPlanListNotifier>(context, listen: false);

    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    getTreningList(trainingNotifier, authNotifier, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    TrainingPlanListNotifier trainingNotifier =
        Provider.of<TrainingPlanListNotifier>(context);
   
    return Scaffold(
      body: trainingNotifier.loaded
              ? displayList(trainingNotifier)
              : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(255, 63, 111, 1),
                )
                )
                );
  }

  Widget displayList(TrainingPlanListNotifier trainingNotifier) {
    return trainingNotifier.list.isEmpty ?
          const EmptyListWidget()
          : ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: trainingNotifier.list.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.directions_run, size: 35),
                  title: Text('${trainingNotifier.list[index]['Dan']}'),
                  subtitle: Text('${trainingNotifier.list[index]['Datum']}'),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
          );
  }
}
