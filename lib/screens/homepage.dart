import 'package:desafio_tecnico/section/Avisos.dart';
import 'package:desafio_tecnico/section/atividades.dart';
import 'package:desafio_tecnico/section/sobre.dart';
import 'package:desafio_tecnico/widgets/descricaoPerfil.dart';
import 'package:flutter/material.dart';

import '../widgets/capaPerfilWidget.dart';
import '../widgets/fotoPerfilWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String nome = 'Cidade ADM de MG';
  String bio = 'Perfil Oficial da Cidade Administrativa de MG';
  String localizacao = 'Cidade administrativa';
  String ultimoAcesso = 'Entrou em Jan/23';

  // Variáveis para armazenar os dados editados

  int _currentIndex = 0;
  final List _sections = [
    AtividadesSection(),
    SobreSection(),
    AvisosSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    CapaPerfilWidget(),
                    DescricaoPerfilWidget(
                        nome: nome,
                        bio: bio,
                        localizacao: localizacao,
                        ultimoAcesso: ultimoAcesso),
                  ],
                ),
                FotoPerfilWidget(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildInkWell(0, 'Atividades'),
                buildInkWell(1, 'Sobre'),
                buildInkWell(2, 'Avisos e Comunicados'),
              ],
            ),
            Divider(
              thickness: 3,
              color: const Color.fromARGB(255, 54, 136, 244),
            ),
            _sections[_currentIndex],
          ],
        ),
      ),
    );
  }

  Widget buildInkWell(int index, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: Text(
          label,
          style: TextStyle(
            color: _currentIndex == index
                ? const Color.fromARGB(255, 54, 136, 244)
                : Colors.black26,
          ),
        ),
      ),
    );
  }
}
