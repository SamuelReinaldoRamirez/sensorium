import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Sensorium',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({Key? key}) : super(key: key);

  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration totalDuration = Duration.zero;
  Duration currentPosition = Duration.zero;

  final String audioUrl = 'https://res.cloudinary.com/dafzso0rh/video/upload/v1728925409/Extrait_Priv%C3%A9_-_1er_Chapitre___La_Que%CC%82te_Du_Cristal_De_Gue%CC%81rison___Prote%CC%81ge%CC%81_Par_MusicStart_SACEM_iczjbk.mp3';

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  void _initAudioPlayer() async {
    _audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        totalDuration = duration;
      });
    });

    _audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    });
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(UrlSource(audioUrl));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void _seekToPosition(double value) {
    final position = Duration(milliseconds: (value * totalDuration.inMilliseconds).toInt());
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Assurez-vous de libérer les ressources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MP3 Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _togglePlayPause,
              child: Text(isPlaying ? 'Pause' : 'Play'),
            ),
            const SizedBox(height: 20),
            Text(
              'Total Duration: ${totalDuration.inMinutes}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              'Current Position: ${currentPosition.inMinutes}:${(currentPosition.inSeconds % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 16),
            ),
            Slider(
              value: totalDuration.inSeconds > 0 ? currentPosition.inSeconds.toDouble() : 0.0,
              min: 0.0,
              max: totalDuration.inSeconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _seekToPosition(value);
                });
              },
              onChangeEnd: (value) {
                _seekToPosition(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MP3 Player',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const AudioPlayerScreen(),
//     );
//   }
// }

// class AudioPlayerScreen extends StatefulWidget {
//   const AudioPlayerScreen({Key? key}) : super(key: key);

//   @override
//   _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
// }

// class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   bool isPlaying = false;

// //compte d'henri ferry
//   final String audioUrl = 'https://res.cloudinary.com/dafzso0rh/video/upload/v1728925409/Extrait_Priv%C3%A9_-_1er_Chapitre___La_Que%CC%82te_Du_Cristal_De_Gue%CC%81rison___Prote%CC%81ge%CC%81_Par_MusicStart_SACEM_iczjbk.mp3';

//   void _togglePlayPause() async {
//     if (isPlaying) {
//       await _audioPlayer.pause();
//     } else {
//       await _audioPlayer.play(UrlSource(audioUrl));
//     }
//     setState(() {
//       isPlaying = !isPlaying;
//     });
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose(); // Assurez-vous de libérer les ressources
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MP3 Player'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _togglePlayPause,
//           child: Text(isPlaying ? 'Pause' : 'Play'),
//         ),
//       ),
//     );
//   }
// }
