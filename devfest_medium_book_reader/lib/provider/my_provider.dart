import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_reader_mine/provider/ref.dart';

final myNotifierProvider = StateNotifierProvider<MyRef, MyState>(
  (ref) {
    return MyRef();
  },
);
