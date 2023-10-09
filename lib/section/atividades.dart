import 'package:flutter/material.dart';

import '../class/atividadesClass.dart';

class AtividadesSection extends StatelessWidget {
  const AtividadesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: listaAtividades.map((atividade) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/foto_perfil.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              atividade.nome,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          const Icon(
                            Icons.check_circle,
                            color: Color.fromARGB(255, 252, 219, 37),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '${atividade.usuario} •',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 145, 145, 145),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              '${atividade.dataPost} Dias',
                              style: const TextStyle(
                                color: Color.fromARGB(255, 145, 145, 145),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        atividade.post,
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.messenger_outline,
                            color: Color.fromARGB(255, 145, 145, 145),
                          ),
                          SizedBox.square(dimension: 20),
                          Text(
                            "0",
                            style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 145, 145, 145)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
