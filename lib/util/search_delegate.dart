import 'package:flutter/material.dart';


import 'package:movie_recommend/movie/movie_search_list_view.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon:Icon(Icons.clear),
        onPressed: ()=>query = "",)
      ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return MovieSearchListView(query, 'search');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }


  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context);
  }
}
