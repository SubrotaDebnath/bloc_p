import 'dart:async';

enum CounterAction {
  increment,
  decrement,
  reset,
}

class CounterBlock {
  //int _counter;

  final _stateStreamController = StreamController<int>();

  StreamSink<int> get _sinkController => _stateStreamController.sink;

  Stream<int> get streamController => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get _eventStream => _eventStreamController.stream;

  CounterBlock(){
    int _counter = 0;
    _eventStream.listen((event) {
      if(event == CounterAction.increment) _counter++;
      else if(event == CounterAction.decrement) _counter--;
      else if(event == CounterAction.reset) _counter = 0;
      _sinkController.add(_counter);
    });
  }

  void dispose(){
    _stateStreamController.close();
    _eventStreamController.close();
  }


}
