import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/revenue_account_model.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/bloc/revenue_bloc.dart';

class AddTodoScreen extends StatefulWidget {
  final int? index;

  const AddTodoScreen({super.key, this.index});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final titleCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<RevenueBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.index == null ? 'ADD REVENUE' : 'EDIT REVENUE'),
      ),
      body: BlocBuilder<RevenueBloc, RevenueState>(
        builder: (context, state) {
          if (widget.index != null) {
            final todo = (state as RevenueLoaded).revenueList[widget.index!];

            titleCtrl.text = todo.title;
            amountCtrl.text = todo.amountTHB.toString();
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: titleCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: amountCtrl,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Amount',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  child: Text(
                      widget.index == null ? 'ADD REVENUE' : 'EDIT REVENUE'),
                  onPressed: () {
                    if (widget.index == null) {
                      if (amountCtrl.text == '') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Invalid amount!'),
                        ));
                        return;
                      }

                      todoBloc.add(RevenueEventAddRevenue(
                        revenue: RevenueAccountModel(
                          title: titleCtrl.text,
                          amountTHB: double.parse(amountCtrl.text),
                          amountUSD: 0,
                        ),
                      ));
                    } else {
                      todoBloc.add(RevenueEventUpdateRevenue(
                        index: widget.index!,
                        revenue: RevenueAccountModel(
                          title: titleCtrl.text,
                          amountTHB: double.parse(amountCtrl.text),
                          amountUSD: 0,
                        ),
                      ));
                    }

                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
