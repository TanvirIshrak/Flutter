import 'package:flutter/material.dart';

import '../http/http_repository.dart';
import '../model/album.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key, required this.title});
  final String title;

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  late Future<Album> futureAlbum;

  @override
  void initState(){
    super.initState();
    futureAlbum = fetchAlbum();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data!.title),
                  Text("${snapshot.data!.id}"),
                  Text("${snapshot.data!.userId}"),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Album album = await fetchAlbum();
          print(album.title);
          print(album.userId);
          print(album.id);

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}