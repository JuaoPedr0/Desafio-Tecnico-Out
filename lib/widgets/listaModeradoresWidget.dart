import 'package:flutter/material.dart';

class ListaAdms extends StatefulWidget {
  const ListaAdms({Key? key}) : super(key: key);

  @override
  State<ListaAdms> createState() => _ListaAdmsState();
}

class _ListaAdmsState extends State<ListaAdms> {
  List<String> listaDeEdf = [
    'item 1',
    'item 2',
    'item 3',
  ];

  void _removeItem(int index) {
    setState(() {
      listaDeEdf.removeAt(index);
    });
  }

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Moderadores',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                _showAddDialog(context);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.blue)),
                child: Text(
                  'Adicionar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Column(
          children: listaDeEdf
              .asMap()
              .entries
              .map((entry) => ListTile(
                    title: Text(
                      entry.value,
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => _removeItem(entry.key),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Moderador'),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Nome',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                String name = _textEditingController.text;
                if (name.isNotEmpty) {
                  setState(() {
                    listaDeEdf.add(name);
                  });
                  _textEditingController.clear();
                }
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
