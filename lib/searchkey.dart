import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  final _searchkey = TextEditingController();
  void submit(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
      decoration: InputDecoration(
          hintText: "Search",
          suffixIcon: IconButton(
            onPressed: () {
              _searchkey.clear();
            },
            icon: Icon(Icons.clear),
          )),
      onSubmitted: ((value) => submit(value)),
    ));
  }
}
