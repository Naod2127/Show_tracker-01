import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/show_provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShowProvider>(context);

    int watching = provider.watchlist.where((s) => s.watchedEpisodes < s.totalEpisodes).length;
    int completed = provider.watchlist.where((s) => s.watchedEpisodes == s.totalEpisodes).length;
    int totalEpisodes = provider.watchlist.fold(0, (sum, s) => sum + s.totalEpisodes);

    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 40, child: Icon(Icons.person, size: 50)),
            SizedBox(height: 12),
            Text('Username', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Currently Watching: $watching'),
            Text('Completed Shows: $completed'),
            Text('Total Episodes: $totalEpisodes'),
          ],
        ),
      ),
    );
  }
}

