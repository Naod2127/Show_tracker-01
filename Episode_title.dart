import 'package:flutter/material.dart';

class EpisodeTile extends StatelessWidget {
  final String title;
  final bool watched;
  final ValueChanged<bool?> onChanged;

  EpisodeTile({required this.title, required this.watched, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title),
      value: watched,
      onChanged: onChanged,
    );
  }
}
