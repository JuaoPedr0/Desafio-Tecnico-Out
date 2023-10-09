import 'package:flutter/material.dart';
import '../screens/editSobre.dart';

class Edificio {
  final String nome;
  final String fotoPerfil;
  final String usuario;
  final String descricao;

  Edificio(this.nome, this.fotoPerfil, this.usuario, this.descricao);
}

class SobreSection extends StatefulWidget {
  @override
  _SobreSectionState createState() => _SobreSectionState();
}

class _SobreSectionState extends State<SobreSection> {
  List<String> diasDaSemana = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo',
  ];

  Map<String, Map<String, String>> horariosSelecionados = {};

  List<Edificio> listaEdificios = [
    Edificio(
      'Edifício Sul',
      'assets/foto_perfil.png',
      '@edificiosul',
      'Edifício da Cidade Administrativa de MG',
    ),
    Edificio(
      'Edifício Norte',
      'assets/foto_perfil.png',
      '@edificionorte',
      'Edifício da Cidade Administrativa de MG',
    ),
    Edificio(
      'Edifício Central',
      'assets/foto_perfil.png',
      '@edificiocentral',
      'Edifício da Cidade Administrativa de MG',
    ),
  ];

  @override
  void initState() {
    super.initState();
    for (var dia in diasDaSemana) {
      horariosSelecionados[dia] = {'inicio': '00:00', 'fim': '00:00'};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          botaoEditSec(),
          horarioAtendimento(),
          edificios(),
          localizacao(),
          contato(),
        ],
      ),
    );
  }

  Widget horarioAtendimento() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: diasDaSemana.map((dia) {
          String inicio = horariosSelecionados[dia]?['inicio'] ?? '00:00';
          String fim = horariosSelecionados[dia]?['fim'] ?? '00:00';

          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dia,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 124, 124, 124),
                  ),
                ),
                Text(
                  '$inicio às $fim',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 124, 124, 124),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget botaoEditSec() {
    return InkWell(
      onTap: () async {
        Map<String, Map<String, String>> selectedHorarios =
            await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EditSobre(horariosSelecionados: horariosSelecionados)),
        );

        setState(() {
          horariosSelecionados = selectedHorarios;
        });
      },
      enableFeedback: true,
      splashColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 14, 108, 196), width: 1),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: const Text(
          'Editar Seção Sobre',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget edificios() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Edifícios',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 20.0),
          Column(
            children: listaEdificios.map((edificio) {
              return Container(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          edificio.fotoPerfil,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              edificio.nome,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(width: 5),
                            const Icon(
                              Icons.check_circle,
                              color: Color.fromARGB(255, 82, 20, 228),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              edificio.usuario,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 168, 168, 168),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(edificio.descricao)
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget localizacao() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Localização',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
          const SizedBox(height: 15),
          const Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                color: Color.fromARGB(255, 82, 20, 228),
              ),
              Text(
                'São Jorge 2ª Seção, Belo Horizonte - MG, 30451-102',
                style: TextStyle(
                  color: Color.fromARGB(255, 168, 168, 168),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/mapa.png'),
          )
        ],
      ),
    );
  }

  Widget contato() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Localização',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Icon(
              Icons.messenger,
              color: Color.fromARGB(255, 82, 20, 228),
            ),
            SizedBox(width: 10),
            Text(
              '+55 15 91234-5678',
              style: TextStyle(
                color: Color.fromARGB(255, 168, 168, 168),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(
              Icons.mail,
              color: Color.fromARGB(255, 82, 20, 228),
            ),
            SizedBox(width: 10),
            Text(
              'edificiosul@governomg.com.br',
              style: TextStyle(
                color: Color.fromARGB(255, 168, 168, 168),
              ),
            )
          ],
        ),
      ]),
    );
  }
}
