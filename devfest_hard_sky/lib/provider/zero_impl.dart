import 'dart:async';

import '../utils/utils.dart';
import 'zero_base.dart';

class Zeref<T> implements ZerefBase<T> {
  T value;
  Zeref(this.value) {
    // ak 3jbtni hna ki khlit {} , bach nfhm 7aja na9ssa Xd
    valueStream.listen((event) {
      value = event;
    });
  }

  final StreamController<T> controller = StreamController<T>.broadcast();
  StreamSink<T> get valueSink => controller.sink;
  Stream<T> get valueStream => controller.stream;

  @override
  void emit(T value) {
    valueSink.add(value);
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    valueSink.addError(error, stackTrace);
  }

  @override
  void dispose() {
    controller.close();
  }

  @override
  void addStream(Stream<T> stream) {
    controller.addStream(stream);
  }
}

class DirectionZeref extends Zeref<Direction> {
  DirectionZeref() : super(Direction.down);

  void changeDirection(Direction direction) {
    emit(direction);
  }

  void changeDirectionLeft() {
    emit(Direction.left);
  }

  void changeDirectionRight() {
    emit(Direction.right);
  }

  void changeDirectionUp() {
    emit(Direction.up);
  }

  void changeDirectionDown() {
    emit(Direction.down);
  }
}
