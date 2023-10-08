import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  CustomSearchBarState createState() => CustomSearchBarState();
}

class CustomSearchBarState extends State<CustomSearchBar> {

  List<String> _countries = ["Raw Milk", "Grass-fed beef", "Raw Honey", "Veg (lol just kidding)"];

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: SearchAnchor(
              builder: (BuildContext context, SearchController controller) {
                return SearchBar(
                  controller: controller,
                  padding: const MaterialStatePropertyAll<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 16.0)),
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (_) {
                    controller.openView();
                  },
                  leading: const Icon(Icons.search),
                );
              }, 
              suggestionsBuilder: (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(4, (int index) {
                      return ListTile(
                        title: Text(_countries[index]),
                        // onTap: () {
                        //   controller.query = 'Suggestion $index';
                        // },
                      );
                    });
              },
                  ),
          ),
        )]
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}