import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/show.dart';
import 'dart:convert';

class ShowProvider extends ChangeNotifier {
  List<Show> _watchlist = [];

  List<Show> get watchlist => _watchlist;

  void addShow(Show show) {
    _watchlist.add(show);
    saveData();
    notifyListeners();
  }

  void removeShow(Show show) {
    _watchlist.removeWhere((s) => s.id == show.id);
    saveData();
    notifyListeners();
  }

  void updateProgress(String id, int watchedEpisodes) {
    final index = _watchlist.indexWhere((s) => s.id == id);
    if (index != -1) {
      _watchlist[index].watchedEpisodes = watchedEpisodes;
      saveData();
      notifyListeners();
    }
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _watchlist.map((s) => {
      'id': s.id,
      'title': s.title,
      'description': s.description,
      'posterUrl': s.posterUrl,
      'totalEpisodes': s.totalEpisodes,
      'watchedEpisodes': s.watchedEpisodes,
    }).toList();
    prefs.setString('watchlist', jsonEncode(data));
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('watchlist');
    if (jsonString != null) {
      final List<dynamic> data = jsonDecode(jsonString);
      _watchlist = data.map((s) => Show(
        id: s['id'],
        title: s['title'],
        description: s['description'],
        posterUrl: s['posterUrl'],
        totalEpisodes: s['totalEpisodes'],
        watchedEpisodes: s['watchedEpisodes'],
      )).toList();
      notifyListeners();
    }
  }
}