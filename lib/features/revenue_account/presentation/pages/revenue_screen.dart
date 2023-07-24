import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/bloc/revenue_bloc.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/pages/add_revenue_screen.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<RevenueBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('REVENUE LIST'),
      ),
      body: BlocBuilder<RevenueBloc, RevenueState>(
        builder: (context, state) {
          if (state is RevenueLoaded) {
            return ListView.builder(
                itemCount: state.revenueList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = state.revenueList[index];

                  return GestureDetector(
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(item.title),
                        subtitle: Text(item.amountUSD.toString()),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddTodoScreen(
                                    index: index,
                                  )));
                    },
                    onDoubleTap: () {
                      todoBloc.add(RevenueEventRemoveRevenue(index: index));
                    },
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoScreen()));
        },
      ),
    );
  }
}