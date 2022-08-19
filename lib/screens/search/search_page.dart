import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  List l;
  Search({required this.l});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    /* List n = l.where((element) => element.startwith(query)).toList();
    return ListView.builder(
        itemCount: query == "" ? l.length : n.length,
        itemBuilder: (context, i) {
          return n[i];
        });*/
    return const Center(
      child: Text("gg"),
    );
  }
}
