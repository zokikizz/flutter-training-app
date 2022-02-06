import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runner_project/notifier/auth.notifier.dart';
import 'package:runner_project/notifier/notifier_list_typs.dart';
import 'package:runner_project/services/list_services.service.dart';
import 'package:runner_project/views/list_pages/empty_list_widget.dart';


class PaymentListPage extends StatefulWidget {
  const PaymentListPage({Key? key}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentListPage> {

  @override
  void initState() {
    PaymentListNotifier paymentListNotifier =
        Provider.of<PaymentListNotifier>(context, listen: false);

    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);

    getPaymentList(paymentListNotifier, authNotifier, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    PaymentListNotifier paymentListNotifier =
        Provider.of<PaymentListNotifier>(context);

    return Scaffold(
      body: paymentListNotifier.loaded
              ? displayList(paymentListNotifier)
              : const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Color.fromRGBO(255, 63, 111, 1),
                )
                )
                );
  }

  Widget displayList(PaymentListNotifier paymentListNotifier) {
    return paymentListNotifier.list.isEmpty ?
      const EmptyListWidget()
      :
      ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: paymentListNotifier.list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.money, size: 35),
              title: Text('${paymentListNotifier.list[index]['empty_header_value-0']}'),
              subtitle: Text('${paymentListNotifier.list[index]['empty_header_value-0']}'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      );

  }
}
