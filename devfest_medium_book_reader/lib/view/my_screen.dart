import 'dart:developer';

import 'package:book_reader_mine/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:book_reader_mine/models/mymodel.dart';
import 'package:url_launcher/url_launcher.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  // You must get the list from the provider and display is here
  //, and also you must check the loading state and display a
  // loading indicator if the state is loading

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBooks App'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          // ref.read(myNotifierProvider.notifier).mapEventsToStates(
          //       MyEvent.fetchData(),
          //     );

          final myState = ref.watch(myNotifierProvider);

          if (myState.isLoading ?? false) {
            return const Center(
              child:
                  CircularProgressIndicator(), // Display a loading indicator.
            );
          } else if (!(myState.isConnected ?? false)) {
            return const Center(
              child: Text(
                'No internet connection.',
              ), // Display a message for no internet connection.
            );
          } else {
            return BooksList(myModelList: myState.myModelList);
          }
        },
      ),
    );
  }
}

class BooksList extends StatelessWidget {
  const BooksList({required this.myModelList, super.key});
  final List<MyModel> myModelList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: myModelList.length,
      itemBuilder: (context, index) {
        final item = myModelList[index];
        return ListTile(
          onTap: () => Navigator.of(context).pushNamed(
            DetailsScreen.routeName,
            arguments: item,
          ),
          title: Text(item.volumeInfo.title),
          subtitle: Text(item.kind),
        );
      },
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});
  static const routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final MyModel myModel =
        ModalRoute.of(context)!.settings.arguments as MyModel;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Details Screen'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            // ani 7titlk chwi padding mn 3ndi Xd
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                  myModel.volumeInfo.imageLinks?.thumbnail ?? '',
                  height: 400,
                  width: 500,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(myModel.volumeInfo.title),
                const SizedBox(
                  height: 20,
                ),
                Text(myModel.kind),
                const SizedBox(
                  height: 20,
                ),
                Text(myModel.volumeInfo.description ?? 'No description'),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      log(myModel.accessInfo.webReaderLink.toString());
                      launchUrl(
                        Uri.parse(myModel.accessInfo.webReaderLink ?? ''),
                      );
                    },
                    child: const Text("Read"),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
