import 'package:flutter/material.dart';

class ListMovie extends StatefulWidget {
  final List<Map<String, String>> movieList;
  const ListMovie({super.key, required this.movieList});

  @override
  State<ListMovie> createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  late List<Map<String, String>> _movieList;
  @override
  void initState() {
    _movieList = widget.movieList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _movieList.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(_movieList[i]["title"]!),
            subtitle: Text(_movieList[i]["director"]!),
            trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _movieList.removeAt(i);
                  });
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      movieName: _movieList[i]["title"]!,
                      director: _movieList[i]["director"]!,
                      contents: _movieList[i]["contents"]!,
                    ),
                  ));
            },
          );
        });
  }
}

class Details extends StatelessWidget {
  final String movieName;
  final String director;
  final String contents;
  const Details(
      {super.key,
      required this.movieName,
      required this.director,
      required this.contents});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text("감독 : "),
                padding: EdgeInsets.only(left: 61),
              ),
              Expanded(child: Text(director)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Container(
                child: Text("줄거리 요약 : "),
                padding: EdgeInsets.only(left: 16),
              ),
              Expanded(child: Text(contents)),
            ],
          ),
        ],
      ),
    );
  }
}
