import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/show_provider.dart';
import '../widgets/show_card.dart';
import 'show_detail_screen.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShowProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Your Library')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: provider.watchlist.length,
          itemBuilder: (context, index) {
            final show = provider.watchlist[index];
            return ShowCard(
              show: show,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ShowDetailScreen(show: show)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}