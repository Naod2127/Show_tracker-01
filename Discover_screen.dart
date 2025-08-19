import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/show_provider.dart';
import '../widgets/show_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/show.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  List<Show> shows = [];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadShows();
  }

  void loadShows() async {
    setState(() => loading = true);
    shows = [
      Show(id: '1', title: 'Sample Show 1', description: 'Description', posterUrl: 'https://via.placeholder.com/150', totalEpisodes: 12),
      Show(id: '2', title: 'Sample Show 2', description: 'Description', posterUrl: 'https://via.placeholder.com/150', totalEpisodes: 24),
    ];
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShowProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Discover')),
      body: RefreshIndicator(
        onRefresh: () async => loadShows(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: shows.length,
            itemBuilder: (context, index) {
              final s = shows[index];
              return ShowCard(
                show: s,
                onTap: () {
                  provider.addShow(s);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}