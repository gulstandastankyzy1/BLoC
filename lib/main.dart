import 'dart:async';

class CounterBloc {
  int _counter = 0;
  final _eventController = StreamController<String>();
  Sink<String> get eventSink => _eventController.sink;

  final _stateController = StreamController<int>();
  Stream<int> get stateStream => _stateController.stream;

  CounterBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(String event) {
    if (event == 'increment') {
      _counter++;
    } else if (event == 'decrement') {
      _counter--;
    }
    _stateController.add(_counter);
  }

  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
