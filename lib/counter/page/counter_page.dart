import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Counter'),
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              final cBloc = BlocProvider.of<CounterBloc>(context);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.counter}',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              );
            },
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) {
            final counterBloc = BlocProvider.of<CounterBloc>(context);
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    counterBloc.add(OnIncrementEvent());
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    counterBloc.add(OnDecrementEvent());
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    counterBloc.add(OnResetEvent());
                  },
                  tooltip: 'Reset',
                  child: Icon(Icons.refresh_sharp),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}