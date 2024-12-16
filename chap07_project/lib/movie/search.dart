import 'package:flutter/material.dart';

class SearchMovie extends StatefulWidget {
  final List<Map<String, String>> movieList;
  const SearchMovie({super.key, required this.movieList});

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  late List<Map<String, String>> _movieList;
  var inputSearch = TextEditingController();
  List<Map<String, String>> _searchResults = [];

  @override
  void initState() {
    _movieList = widget.movieList;
  }

  void _onSearch(String query) {
    setState(() {
      _searchResults = _movieList
          .where((movie) => (movie["title"] ?? '').contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            controller: inputSearch,
            decoration: InputDecoration(labelText: "영화 검색"),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              _onSearch(inputSearch.text);
            },
            child: Text("검색")),
        _searchResults.isEmpty
            ? Expanded(
                child: Center(
                  child: Text("검색 결과가 없습니다."),
                ),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(_searchResults[i]["title"]!),
                        subtitle: Text(_searchResults[i]["director"]!),
                      );
                    })),
      ],
    );
  }
}
