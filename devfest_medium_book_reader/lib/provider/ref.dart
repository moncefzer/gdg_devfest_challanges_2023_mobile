import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_reader_mine/domain/my_domain.dart';
import 'package:book_reader_mine/utils/services.dart';

import '../models/mymodel.dart';

part 'my_state.dart';
part 'my_event.dart';

part 'ref.freezed.dart';

class MyRef extends StateNotifier<MyState> {
  MyRef() : super(MyState.empty()) {
    mapEventsToStates(const MyEvent.fetchData());
  }

  mapEventsToStates(MyEvent event) async {
    // Complete this function
    // u must check the internet connection and get the data from the domain and update the state

    return event.whenOrNull(
      fetchData: () async {
        state = state.copyWith(isLoading: true);

        // Check Internet Connection
        final isConnected = await AppServices.checkConnectivity();
        if (isConnected) {
          // Get Data
          final myList = await MyDomain.getData();
          state = state.copyWith(
            isLoading: false,
            myModelList: myList,
            isConnected: isConnected,
          );
        } else {
          state = state.copyWith(
            myModelList: [],
            isConnected: isConnected,
            isLoading: false,
          );
        }
      },
    );
  }
}
