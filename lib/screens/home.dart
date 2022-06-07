import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geojith/provider/home.dart';
import 'package:geojith/widgets/custom-text-field.dart';
import 'package:provider/provider.dart';

import '../models/home.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geojith'),
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false).fetchHome(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.80,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 15,
                ),
              ),
            );
          } else {
            if (snapshot.hasData) {
              return const HomeBody();
            }
          }
          return Text(
            snapshot.error.toString(),
          );
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: 'search',
                  onChanged: (value) {
                    if (value.isEmpty) {
                      Provider.of<HomeProvider>(context, listen: false)
                          .onSearch(query: value);
                    }
                  },
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (value) {
                    Provider.of<HomeProvider>(context, listen: false)
                        .onSearch(query: value);
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('${value.filteredResult.length} results found.'),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: value.filteredResult.length,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Card(
                    child: ListTile(
                      title: Text(value.filteredResult[index].title ?? ''),
                      subtitle: Text(value.filteredResult[index].body ?? ''),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
