import 'package:flutter/material.dart';
import '../models/show.dart';

class ShowCard extends StatelessWidget {
  final Show show;
  final VoidCallback onTap;

  ShowCard({required this.show, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double progress = show.totalEpisodes == 0 ? 0 : show.watchedEpisodes / show.totalEpisodes;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  show.posterUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(show.title, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  LinearProgressIndicator(value: progress),
                  SizedBox(height: 2),
                  Text('${show.watchedEpisodes}/${show.totalEpisodes} episodes'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}