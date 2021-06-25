import 'package:flutter/material.dart';

import 'counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _counterBlock = CounterBlock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
                    IconButton(
                      onPressed: () {
                        _counterBlock.eventSink.add(CounterAction.increment);
                      },
                      icon: Icon(Icons.add),
                      color: Colors.deepOrange,
                      autofocus: true,
                      tooltip: 'Increment',
                      splashColor: Colors.amber,
                      iconSize: 40,
                      alignment: Alignment.center,
                      highlightColor: Colors.deepPurple,
                      splashRadius: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        _counterBlock.eventSink.add(CounterAction.decrement);
                      },
                      icon: Icon(Icons.remove),
                      color: Colors.deepOrange,
                      autofocus: true,
                      tooltip: 'Increment',
                      splashColor: Colors.amber,
                      iconSize: 40,
                      alignment: Alignment.center,
                      highlightColor: Colors.deepPurple,
                      splashRadius: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        _counterBlock.eventSink.add(CounterAction.reset);
                      },
                      icon: Icon(Icons.loop),
                      color: Colors.deepOrange,
                      autofocus: true,
                      tooltip: 'Increment',
                      splashColor: Colors.amber,
                      iconSize: 40,
                      alignment: Alignment.center,
                      highlightColor: Colors.deepPurple,
                      splashRadius: 30,
                    ),
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
