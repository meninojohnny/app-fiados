import 'package:app_fiado/model/evento_model.dart';
import 'package:app_fiado/widgets/card_event.dart';
import 'package:app_fiado/widgets/event_form.dart';
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
  ];

  void _addEvento(String title, String date) {
    if (title.isEmpty || date.isEmpty) {
      return;
    }
    _eventos.add(EventoModel(title: title.toUpperCase(), date: date));
    setState(() {});
    Navigator.pop(context);
  }

  void _removeEvento(id) {
    for (final i in _eventos) {
      if (i.id == id) {
        _eventos.remove(i);
      }
    }
    setState(() {});
  }

  void _openEventFormModel(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromRGBO(234, 224, 213, 1),
      context: context, 
      builder: (_) => EventForm(onSubmitted: _addEvento,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(198, 172, 143, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(94, 80, 63, 1),
        title: const Text(
          'Gerenciador de Fiados',
          textAlign: TextAlign.center,
          style: TextStyle(
          color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _openEventFormModel(context), 
            icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(94, 80, 63, 1),
        onPressed: () => _openEventFormModel(context),
        child: const Icon(Icons.add, color: Colors.white,),
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