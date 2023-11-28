import 'package:app_fiado/model/evento_model.dart';
import 'package:app_fiado/widgets/card_event.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<EventoModel> _eventos = [
    EventoModel(title: 'Venda de Pastel', date: '12/02'),
    EventoModel(title: 'Venda de Carne', date: '12/02'),
    EventoModel(title: 'Venda de Coxinha', date: '12/02'),
    EventoModel(title: 'Venda de Cachorro quente', date: '12/02'),
    EventoModel(title: 'Venda de Pizza', date: '12/02'),
    EventoModel(title: 'Venda de Lasanha', date: '12/02'),
    EventoModel(title: 'Venda de Crepe', date: '12/02'),
    EventoModel(title: 'Venda de Sorvete', date: '12/02'),
  ];

  void _addEvento(String title, String date) {
    _eventos.add(EventoModel(title: title, date: date));
  }

  void _removeEvento(id) {
    for (final i in _eventos) {
      if (i.id == id) {
        _eventos.remove(i);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home Page',
          textAlign: TextAlign.center,
          style: TextStyle(
          color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Eventos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  itemCount: _eventos.length,
                  itemBuilder: (context, index) { 
                    EventoModel evento = _eventos[index];
                    return CardEvent(
                      onRemove: _removeEvento,
                      evento: evento,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}