import 'package:flutter/material.dart';

class CapaPerfilWidget extends StatefulWidget {
  @override
  _CapaPerfilWidgetState createState() => _CapaPerfilWidgetState();
}

class _CapaPerfilWidgetState extends State<CapaPerfilWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        'assets/capa_perfil.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
