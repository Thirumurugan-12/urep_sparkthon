import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ArScreen extends StatelessWidget {

  final String? path;
  const ArScreen({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Urep Tryout'),
      flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(101, 225, 196, 0.33),
                  Color.fromRGBO(171, 196, 238, 0),
                  Color.fromRGBO(139, 238, 197, 0.31),
                ],
                stops: [1, 0.9, 0.0],
              ),
            ),
          ),),
      body:  ModelViewer(
        backgroundColor: Colors.greenAccent,
        src: path ?? 'lib/assests/office_chair.glb',
        ar: true,
      ),
    );
  }
}