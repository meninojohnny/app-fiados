import 'package:app_fiado/model/evento_model.dart';
import 'package:app_fiado/model/person_model.dart';
import 'package:app_fiado/widgets/card_person.dart';
import 'package:app_fiado/widgets/person_form.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget {
  final EventoModel evento;
  
  const EventPage({super.key, required this.evento});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {

    final String title = widget.evento.title;
    final fiados = widget.evento.fiados;

    void addPerson(String name, String value) {
      if (name.isEmpty || value.isEmpty) {
        return;
      }
      fiados.add(PersonModel(name: name, value: value));
      setState(() {});
      Navigator.pop(context);
    }

    void removePerson(id) {
      for (final i in fiados) {
        if (i.id == id) {
          fiados.remove(i);
        }
      }
      setState(() {});
    }

    void _openPersonFormModel(BuildContext context) {
      showModalBottomSheet(
        backgroundColor: const Color.fromRGBO(234, 224, 213, 1),
        context: context, 
        builder: (_) => PersonForm(onSubmitted: addPerson,),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(198, 172, 143, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(94, 80, 63, 1),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
          color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {_openPersonFormModel(context);}, 
            icon: const Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(94, 80, 63, 1),
        onPressed: () {_openPersonFormModel(context);},
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fiados',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10,),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  itemCount: fiados.length,
                  itemBuilder: (context, index) { 
                    PersonModel fiado = fiados[index];
                    return CardPerson(
                      onRemove: removePerson,
                      person: fiado,
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