import 'package:flutter/material.dart';

import '../screens/editPerfil.dart';

class DescricaoPerfilWidget extends StatefulWidget {
  final String nome;
  final String bio;
  final String localizacao;
  final String ultimoAcesso;

  DescricaoPerfilWidget({
    required this.nome,
    required this.bio,
    required this.localizacao,
    required this.ultimoAcesso,
  });

  @override
  _DescricaoPerfilWidgetState createState() => _DescricaoPerfilWidgetState();
}

class _DescricaoPerfilWidgetState extends State<DescricaoPerfilWidget> {
  String editedNome = '';
  String editedBio = '';
  String editedLocalizacao = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Stack(
        children: [
          Positioned(
            top: 70,
            left: 30,
            child: Row(
              children: [
                Text(
                  editedNome.isNotEmpty ? editedNome : widget.nome,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(Icons.check_circle,
                    color: Color.fromARGB(255, 252, 219, 37)),
              ],
            ),
          ),
          Positioned(
            top: 110,
            left: 30,
            child: Row(
              children: [
                Text(
                  editedBio.isNotEmpty ? editedBio : widget.bio,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 140,
            left: 30,
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          color: Color.fromARGB(255, 124, 124, 124)),
                      Text(
                        editedLocalizacao.isNotEmpty
                            ? editedLocalizacao
                            : widget.localizacao,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 124, 124, 124),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month_outlined,
                          color: Color.fromARGB(255, 124, 124, 124)),
                      Text(
                        widget.ultimoAcesso,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 124, 124, 124),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 150,
            right: 30,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditarPerfilPage(),
                  ),
                ).then((values) {
                  if (values != null) {
                    setValor(values);
                  }
                });
              },
              enableFeedback: true,
              splashColor: Colors.black26,
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 14, 108, 196), width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  'Editar Perfil',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setValor(List<String> values) {
    setState(() {
      if (values.length >= 4) {
        editedNome = values[0];
        editedBio = values[1];
        editedLocalizacao = values[2];
      }
    });
  }
}
