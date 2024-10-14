// import 'package:flutter/material.dart';

// void main() {
//   runApp(const LeSensoriumApp());
// }

// class LeSensoriumApp extends StatelessWidget {
//   const LeSensoriumApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Le Sensorium',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Le Sensorium'),
//       ),
//       body: const Center(
//         child: Text(
//           'Bienvenue dans Le Sensorium',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() {
  runApp(const LeSensoriumApp());
}

class LeSensoriumApp extends StatelessWidget {
  const LeSensoriumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Le Sensorium',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SoundCloudPlayer(),
    );
  }
}

class SoundCloudPlayer extends StatefulWidget {
  const SoundCloudPlayer({Key? key}) : super(key: key);

  @override
  _SoundCloudPlayerState createState() => _SoundCloudPlayerState();
}

class _SoundCloudPlayerState extends State<SoundCloudPlayer> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Configurer WebView selon la plateforme
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://soundcloud.com/le-sensorium/extrait-1er-chapitre-la-quete-du-cristal-de-guerison/s-2dMsvQRzV9o?si=9e4177bed99e4b939991c3fa1c1af9c7&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing'));

    _controller = controller;

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController).setMediaPlaybackRequiresUserGesture(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Le Sensorium - Lecture audio'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
