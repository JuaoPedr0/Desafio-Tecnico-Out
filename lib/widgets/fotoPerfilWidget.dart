import 'package:flutter/material.dart';

class FotoPerfilWidget extends StatefulWidget {
  @override
  _FotoPerfilWidgetState createState() => _FotoPerfilWidgetState();
}

class _FotoPerfilWidgetState extends State<FotoPerfilWidget> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 150,
      left: 30,
      child: Container(
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70),
          border: Border.all(color: Colors.white, width: 7),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            'assets/foto_perfil.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
