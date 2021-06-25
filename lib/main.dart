import 'package:flutter/material.dart';

import 'counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subrota Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'BLoC Demo'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final _counterBlock = CounterBlock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  StreamBuilder(
                    initialData: 0,
                    stream: _counterBlock.streamController,
                    builder: (context, snapshot) {
                      return Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.headline4,
                      );
                    },
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CounterButton(_counterBlock, 'Increment', Icons.add, CounterAction.increment),
                    CounterButton(_counterBlock, 'Decrement', Icons.remove, CounterAction.decrement),
                    CounterButton(_counterBlock, 'Reset', Icons.loop, CounterAction.reset),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterButton extends StatelessWidget {
  final CounterBlock _counterBlock;
  final String tooltip;
  final IconData iconData;
  final CounterAction counterAction;

  CounterButton(this._counterBlock, this.tooltip, this.iconData, this.counterAction);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _counterBlock.eventSink.add(counterAction);
      },
      icon: Icon(iconData),
      color: Colors.deepOrange,
      autofocus: true,
      tooltip: tooltip,
      splashColor: Colors.amber,
      iconSize: 40,
      alignment: Alignment.center,
      highlightColor: Colors.deepPurple,
      splashRadius: 30,
    );
  }
}
