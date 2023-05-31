import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier {
  List<Map<dynamic, dynamic>> categories = [
    {
      'title': "Ambient Sounds",
      "data": [
        {
          "image": "https://i.ibb.co/2YGJ9TX/red.png",
          "title": "Red Noise",
          "description": "This is a great music that will relac your mind ",
          "audio": "https://dl.sndup.net/xtwm/red.mp3"
        },
        {
          "image": "https://i.ibb.co/z2qWXzF/pink.jpg",
          "title": "Pink Noise",
          "description": " ",
          "audio": "https://dl.sndup.net/tttm/pink.mp3"
        },
        {
          "image": "https://i.ibb.co/mTBLJXz/temp-Image3fe-ZWO.jpg",
          "title": "White Noise",
          "description": " ",
          "audio": "https://dl.sndup.net/y3gp/white.mp3"
        },
        {
          "image": "https://i.ibb.co/Rz06zLM/grey.jpg",
          "title": "Grey Noise",
          "description": " ",
          "audio": "https://dl.sndup.net/gqqj/grey.mp3"
        },
      ]
    },
    {
      'title': "Meditative Mantras",
      "data": [
        {
          "image": "https://i.ibb.co/v1Hf7P4/mantra-1.png",
          "title": "Om Shanti",
          "description": "Peace of mind, body, and speech.",
          "audio": "https://dl.sndup.net/qyzm/title.mp3"
        },
        {
          "image": "https://i.ibb.co/Rz4fRdz/mantra-2.png",
          "title": "I am That I Am",
          "description": "This is one of the Hebrew Torah's most famous lines",
          "audio": "https://dl.sndup.net/mypm/title2.mp3"
        },
        {
          "image": "https://i.ibb.co/jhz7jKj/mantra-3.pngg",
          "title": "I Love You",
          "description": "Forgiveness and reconciliation practice",
          "audio": "https://dl.sndup.net/hfqr/Peaceful%20Guiter.mp3"
        },
      ]
    },
    {
      'title': "Sounds",
      "data": [
        {
          "image": "https://i.ibb.co/Ms0r1SS/music-sounds.jpg",
          "title": "Peaceful Night",
          "description": "Deep Sleep Relaxation Sounds",
          "audio": "https://dl.sndup.net/tmbf/Peaceful%20-%20Instrumental.mp3"
        },
        {
          "image": "https://i.ibb.co/6JKyWqX/beach-sounds.jpg",
          "title": "Beach Sounds",
          "description": "Ocean Waves Noise for Deep sleep",
          "audio": "https://dl.sndup.net/k9k6/title3.mp3"
        }
      ]
    },
    {
      'title': "Calming Tunes",
      "data": [
        {
          "image": "https://i.ibb.co/Tw2MNbR/calming-tone1.jpg",
          "title": "Moon",
          "description": "Full Moon Calming Music",
          "audio": "https://dl.sndup.net/p6vg/Peaceful.mp3"
        },
        {
          "image": "https://i.ibb.co/5jppWpS/calming-tone2.jpg",
          "title": "Waterfall",
          "description": "Relaxing Music Sleep Waterfall",
          "audio": "https://dl.sndup.net/tqxh/Peaceful%20Rain.mp3"
        },
      ]
    },
  ];
  final _musicData = [
    {
      'heading': 'Fantasy',
      'subHeading': 'Imagine yourself in a world of peace.',
      'src': 'https://i.ibb.co/v1QPv0M/music-data-1.jpg',
      "audio": ""
    },
    {
      'heading': 'Nature',
      'subHeading': 'Getting closed with nature',
      'src': 'https://i.ibb.co/cctK95B/music-data-2.jpg',
      "audio": ""
    },
    {
      'heading': 'Village Life',
      'subHeading': 'A day of the life at village.',
      'src': 'https://i.ibb.co/sVgHcp0/music-data-3.jpg',
      "audio": ""
    },
    {
      'heading': 'Good morning',
      'subHeading': 'Peaceful Morning with a cup of coffee',
      'src': 'https://i.ibb.co/9VQJ41n/music-data-4.jpg',
      "audio": ""
    },
  ];

  List<Map<String, String>> get getMusic {
    return [..._musicData];
  }

  List<Map<dynamic, dynamic>> get getCategory {
    return [...categories];
  }
}
