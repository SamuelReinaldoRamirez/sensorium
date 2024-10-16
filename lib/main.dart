// SAUVEGARDE DE L IMAGE DANS DATA/JESAISPASQUOI

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:signature/signature.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';

// void main() {
//   runApp(SignatureApp());
// }

// class SignatureApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignatureScreen(),
//     );
//   }
// }

// class SignatureScreen extends StatefulWidget {
//   @override
//   _SignatureScreenState createState() => _SignatureScreenState();
// }

// class _SignatureScreenState extends State<SignatureScreen> {
//   // Initialise le contrôleur pour capturer la signature
//   SignatureController _controller = SignatureController(
//     penStrokeWidth: 5,
//     penColor: Colors.black,
//     exportBackgroundColor: Colors.white,
//   );

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   // Méthode pour sauvegarder la signature
//   Future<void> _saveSignature() async {
//     if (_controller.isNotEmpty) {
//       try {
//         Uint8List? data = await _controller.toPngBytes();
//         if (data != null) {
//           // Récupère le chemin de stockage
//           final directory = await getApplicationDocumentsDirectory();
//           final imagePath = '${directory.path}/signature.png';
          
//           // Sauvegarde le fichier image
//           final imageFile = File(imagePath);
//           await imageFile.writeAsBytes(data);
//           print(imagePath);
          
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Signature sauvegardée dans $imagePath')),
//           );
//         }
//       } catch (e) {
//         print('Erreur lors de la sauvegarde de la signature : $e');
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Veuillez d\'abord signer')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Capture de Signature'),
//       ),
//       body: Column(
//         children: <Widget>[
//           // Widget Signature
//           Signature(
//             controller: _controller,
//             height: 300,
//             backgroundColor: Colors.grey[200]!,
//           ),
//           SizedBox(height: 20),
//           // Boutons pour effacer ou sauvegarder la signature
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() => _controller.clear());
//                 },
//                 child: Text('Effacer'),
//               ),
//               ElevatedButton(
//                 onPressed: _saveSignature,
//                 child: Text('Sauvegarder'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



//-----------------------------------------------------------------------------------------------------------------------------------------------------



// SAUVEGARDE DE LA SIGNATURE DAN SLA GALERIE PHOTO
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:gallery_saver/gallery_saver.dart';
// import 'package:signature/signature.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:permission_handler/permission_handler.dart'; // Ajoute ce package pour gérer les permissions

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Demander la permission dès le démarrage
//   await _requestPermission();

//   runApp(SignatureApp());
// }

// Future<void> _requestPermission() async {
//   var status = await Permission.storage.status;
//   print('Statut de la permission : $status'); // Ajoute ce print

//   if (status.isDenied || status.isPermanentlyDenied) {
//     print('Demande de permission...'); // Ajoute ce print
//     await Permission.storage.request();
//   }
  
//   // Vérifie à nouveau le statut après la demande
//   status = await Permission.storage.status;
//   print('Statut de la permission après demande : $status'); // Ajoute ce print

//   if (status.isGranted) {
//     print('Permission accordée.');
//   } else if (status.isPermanentlyDenied) {
//     print('Permission refusée de manière permanente.');
//     openAppSettings();
//   }
// }


// class SignatureApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignatureScreen(),
//     );
//   }
// }

// class SignatureScreen extends StatefulWidget {
//   @override
//   _SignatureScreenState createState() => _SignatureScreenState();
// }

// class _SignatureScreenState extends State<SignatureScreen> {
//   // Initialise le contrôleur pour capturer la signature
//   SignatureController _controller = SignatureController(
//     penStrokeWidth: 5,
//     penColor: Colors.black,
//     exportBackgroundColor: Colors.white,
//   );

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }


// Future<void> _saveSignature() async {
//   if (_controller.isNotEmpty) {
//     try {
//       // Obtenir les données de l'image en tant que Uint8List
//       Uint8List? data = await _controller.toPngBytes();
//       if (data != null) {
//         // Obtenir le répertoire temporaire
//         final directory = await getTemporaryDirectory();
//         // Créer un chemin de fichier
//         final path = '${directory.path}/signature_${DateTime.now().millisecondsSinceEpoch}.png';
        
//         // Écrire les données dans le fichier
//         final file = File(path);
//         await file.writeAsBytes(data);
        
//         // Sauvegarde l'image dans la galerie
//         bool? result = await GallerySaver.saveImage(path, albumName: "Signatures");
//         if (result != null && result) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Signature sauvegardée dans la galerie')),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Erreur lors de la sauvegarde dans la galerie')),
//           );
//         }
//       }
//     } catch (e) {
//       print('Erreur lors de la sauvegarde de la signature : $e');
//     }
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Veuillez d\'abord signer')),
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Capture de Signature'),
//       ),
//       body: Column(
//         children: <Widget>[
//           // Widget Signature
//           Signature(
//             controller: _controller,
//             height: 300,
//             backgroundColor: Colors.grey[200]!,
//           ),
//           SizedBox(height: 20),
//           // Boutons pour effacer ou sauvegarder la signature
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() => _controller.clear());
//                 },
//                 child: Text('Effacer'),
//               ),
//               ElevatedButton(
//                 onPressed: _saveSignature,
//                 child: Text('Sauvegarder'),
//               ),
//               ElevatedButton(
//                 onPressed: _requestPermission, // Bouton pour demander la permission
//                 child: Text('Demander la permission'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



//-----------------------------------------------------------------------

//GENERATION DU PDF

// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:signature/signature.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:pdf/pdf.dart';

// void main() {
//   runApp(SignatureApp());
// }

// class SignatureApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SignatureScreen(),
//     );
//   }
// }

// class SignatureScreen extends StatefulWidget {
//   @override
//   _SignatureScreenState createState() => _SignatureScreenState();
// }

// class _SignatureScreenState extends State<SignatureScreen> {
//   SignatureController _controller = SignatureController(
//     penStrokeWidth: 5,
//     penColor: Colors.black,
//     exportBackgroundColor: Colors.white,
//   );

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _saveSignature() async {
//     if (_controller.isNotEmpty) {
//       try {
//         Uint8List? data = await _controller.toPngBytes();
//         if (data != null) {
//           // Récupère le chemin de stockage
//           final directory = await getApplicationDocumentsDirectory();
//           final imagePath = '${directory.path}/signature.png';
          
//           // Sauvegarde le fichier image
//           final imageFile = File(imagePath);
//           await imageFile.writeAsBytes(data);
//           print('Signature sauvegardée dans : $imagePath');

//           // Générer le PDF
//           await _createPDF(imagePath);
//         }
//       } catch (e) {
//         print('Erreur lors de la sauvegarde de la signature : $e');
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Veuillez d\'abord signer')),
//       );
//     }
//   }

//   Future<void> _createPDF(String imagePath) async {
//   final pdf = pw.Document();

//   // Lire l'image avant d'ajouter la page
//   final imageBytes = await File(imagePath).readAsBytes();

//   pdf.addPage(pw.Page(
//     build: (pw.Context context) {
//       return pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         children: [
//           pw.Text('Signature Client', style: pw.TextStyle(fontSize: 24)),
//           pw.Spacer(),
//           pw.Align(
//             alignment: pw.Alignment.bottomRight,
//             child: pw.Image(
//               pw.MemoryImage(imageBytes), // Utiliser les bytes de l'image
//               width: 200, // Ajuste la taille de l'image si nécessaire
//               height: 100, // Ajuste la taille de l'image si nécessaire
//             ),
//           ),
//         ],
//       );
//     },
//   ));

//   // Sauvegarde le PDF
//   final pdfFilePath = '${(await getApplicationDocumentsDirectory()).path}/signature.pdf';
//   final pdfFile = File(pdfFilePath);
//   await pdfFile.writeAsBytes(await pdf.save());
//   print('PDF enregistré dans : $pdfFilePath');

//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('PDF sauvegardé dans $pdfFilePath')),
//   );
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Capture de Signature'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Signature(
//             controller: _controller,
//             height: 300,
//             backgroundColor: Colors.grey[200]!,
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               ElevatedButton(
//                 onPressed: () {
//                   setState(() => _controller.clear());
//                 },
//                 child: Text('Effacer'),
//               ),
//               ElevatedButton(
//                 onPressed: _saveSignature,
//                 child: Text('Sauvegarder'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

//-----------------------------------------------------------------------

//GENERATION DU PDF et stockage dans /storage/emulated/0/Android/data/com.example.le_sensorium/files/Documents/signature.pdf

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(SignatureApp());
}

class SignatureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignatureScreen(),
    );
  }
}

class SignatureScreen extends StatefulWidget {
  @override
  _SignatureScreenState createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _saveSignature() async {
    if (_controller.isNotEmpty) {
      try {
        Uint8List? data = await _controller.toPngBytes();
        if (data != null) {
          // Récupère le chemin de stockage
          final directory = await getExternalStorageDirectory();
          final imagePath = '${directory!.path}/signature.png';

          // Sauvegarde le fichier image
          final imageFile = File(imagePath);
          await imageFile.writeAsBytes(data);
          print('Signature sauvegardée dans : $imagePath');

          // Générer le PDF
          await _createPDF(directory, imagePath);
        }
      } catch (e) {
        print('Erreur lors de la sauvegarde de la signature : $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez d\'abord signer')),
      );
    }
  }

  Future<void> _createPDF(Directory directory, String imagePath) async {
    final pdf = pw.Document();

    // Lire l'image avant d'ajouter la page
    final imageBytes = await File(imagePath).readAsBytes();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Signature Client', style: pw.TextStyle(fontSize: 24)),
            pw.Spacer(),
            pw.Align(
              alignment: pw.Alignment.bottomRight,
              child: pw.Image(
                pw.MemoryImage(imageBytes), // Utiliser les bytes de l'image
                width: 200, // Ajuste la taille de l'image si nécessaire
                height: 100, // Ajuste la taille de l'image si nécessaire
              ),
            ),
          ],
        );
      },
    ));

    // Sauvegarde le PDF dans le dossier Documents
    final pdfDirectory = Directory('${directory.path}/LotsiCollect');

    if (!(await pdfDirectory.exists())) {
      await pdfDirectory.create(recursive: true); // Crée le dossier s'il n'existe pas
    }

    final pdfFilePath = '${pdfDirectory.path}/signature.pdf';
    final pdfFile = File(pdfFilePath);
    await pdfFile.writeAsBytes(await pdf.save());
    print('PDF enregistré dans : $pdfFilePath');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF sauvegardé dans $pdfFilePath')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture de Signature'),
      ),
      body: Column(
        children: <Widget>[
          Signature(
            controller: _controller,
            height: 300,
            backgroundColor: Colors.grey[200]!,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() => _controller.clear());
                },
                child: Text('Effacer'),
              ),
              ElevatedButton(
                onPressed: _saveSignature,
                child: Text('Sauvegarder'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

