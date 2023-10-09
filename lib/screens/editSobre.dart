import 'package:flutter/material.dart';

class EditSobre extends StatefulWidget {
  final Map<String, Map<String, String>> horariosSelecionados;

  EditSobre({required this.horariosSelecionados});

  @override
  _EditSobreState createState() => _EditSobreState();
}

class _EditSobreState extends State<EditSobre> {
  Map<String, Map<String, String>> horariosSelecionados = {};

  @override
  void initState() {
    super.initState();
    for (var dia in diasDaSemana) {
      horariosSelecionados[dia] = {
        'inicio': horarios.first,
        'fim': horarios.first
      };
    }
  }

  List<String> horarios = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00'
  ];
  List<String> diasDaSemana = [
    'Segunda-feira',
    'Terça-feira',
    'Quarta-feira',
    'Quinta-feira',
    'Sexta-feira',
    'Sábado',
    'Domingo',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color.fromARGB(255, 22, 111, 194),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color.fromARGB(255, 250, 249, 249),
        centerTitle: true,
        title: const Text(
          'Editar Sobre',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pop(
                  context,
                  widget.horariosSelecionados,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                child: const Text(
                  'Salvar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 22, 111, 194),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            horarioAtendimentoEdit()
          ],
        ),
      ),
    );
  }

  Widget horarioAtendimentoEdit() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              'Horário de Atendimento',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
          ),
          Column(
            children: diasDaSemana.map((entry) {
              String dia = entry;

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Text(
                      dia,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 124, 124, 124),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: DropdownButton<String>(
                            value: widget.horariosSelecionados[dia]!['inicio'],
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.horariosSelecionados[dia]!['inicio'] =
                                    newValue!;
                              });
                            },
                            style: const TextStyle(
                              color: Color.fromARGB(255, 124, 124, 124),
                            ),
                            underline: Container(
                              height: 0,
                              color: Colors.transparent,
                            ),
                            items: horarios.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 15),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 124, 124, 124),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: Text(
                            ' às ',
                            style: TextStyle(
                              color: Color.fromARGB(255, 124, 124, 124),
                            ),
                          ),
                        ),

                        // Dropdown para o fim do horário
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: DropdownButton<String>(
                            value: widget.horariosSelecionados[dia]!['fim'],
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.horariosSelecionados[dia]!['fim'] =
                                    newValue!;
                              });
                            },
                            elevation: 0,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 124, 124, 124),
                            ),
                            underline: Container(
                              height: 0,
                              color: Colors.transparent,
                            ),
                            items: horarios.map<DropdownMenuItem<String>>(
                              (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10, left: 15),
                                    child: Text(
                                      value,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 124, 124, 124),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
