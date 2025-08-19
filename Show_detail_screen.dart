import 'package:flutter/material.dart';
import '../models/show.dart';
import '../widgets/episode_tile.dart';

class ShowDetailScreen extends StatefulWidget {
  final Show show;
  ShowDetailScreen({required this.show});

  @override
  State<ShowDetailScreen> createState() => _ShowDetailScreenState();
}

class _ShowDetailScreenState extends State<ShowDetailScreen> {
  late List<bool> watchedList;

  @override
  void initState() {
    super.initState();
    watchedList = List.generate(widget.show.totalEpisodes, (index) => index < widget.show.watchedEpisodes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.show.title)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.show.posterUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 12),
            Text(widget.show.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(widget.show.description),
            SizedBox(height: 16),
            Text('Episodes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.show.totalEpisodes,
              itemBuilder: (context, index) {
                return EpisodeTile(
                  title: 'Episode ${index + 1}',
                  watched: watchedList[index],
                  onChanged: (val) {
                    setState(() {
                      watchedList[index] = val ?? false;
                      widget.show.watchedEpisodes = watchedList.where((e) => e).length;
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}