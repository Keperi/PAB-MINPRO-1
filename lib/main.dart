import 'package:flutter/material.dart';
import 'home_screen.dart';

// ============================================================
// MODEL SONG — taruh di sini biar nda perlu file terpisah
// ============================================================
class Song {
  final String id;
  final String title;
  final String artist;
  final String album;
  final String filePath;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.album,
    required this.filePath,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'artist': artist,
        'album': album,
        'filePath': filePath,
      };

  factory Song.fromMap(Map<String, dynamic> map) => Song(
        id: map['id'],
        title: map['title'],
        artist: map['artist'],
        album: map['album'],
        filePath: map['filePath'],
      );
}

// ============================================================
// ENTRY POINT + TEMA
// ============================================================
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFA2D48),
        ),
        scaffoldBackgroundColor: const Color(0xFFF2F2F7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF2F2F7),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}