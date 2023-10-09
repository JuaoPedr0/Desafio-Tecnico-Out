import 'package:desafio_tecnico/widgets/listaModeradoresWidget.dart';
import 'package:flutter/material.dart';

TextEditingController _controllerNome = TextEditingController();
TextEditingController _controllerBio = TextEditingController();
TextEditingController _controllerLocal = TextEditingController();
TextEditingController _controllerAdm = TextEditingController();

class EditarPerfilPage extends StatefulWidget {
  const EditarPerfilPage({
    super.key,
  });

  @override
  State<EditarPerfilPage> createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  List<String> listaDeAdms = [
    'item 1',
    'item 2',
    'item 3',
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
          'Editar Perfil',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Center(
            child: InkWell(
              onTap: () => Navigator.pop(
                context,
                [
                  _controllerNome.text,
                  _controllerBio.text,
                  _controllerLocal.text,
                  'Atualizado em ' + DateTime.now().toString(),
                ],
              ),
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              editFoto(context),
              const SizedBox(
                height: 25,
              ),
              textFilder('Nome', 'nome', _controllerNome),
              textFilder('Bio', 'nome', _controllerBio),
              textFilder('Localização', 'nome', _controllerLocal),
              textFilder('Administrador Geral', 'nome', _controllerAdm),
              ListaAdms(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget editFoto(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Imagem de perfil',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/foto_perfil.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70),
                  color: Colors.black.withOpacity(0.5),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}

Widget textFilder(String nome, String hint, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        nome,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey[200],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
      const SizedBox(
        height: 25,
      ),
    ],
  );
}
