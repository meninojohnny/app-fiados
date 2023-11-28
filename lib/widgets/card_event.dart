import 'package:app_fiado/model/evento_model.dart';
import 'package:app_fiado/pages/event_page.dart';
import 'package:flutter/material.dart';

class CardEvent extends StatelessWidget {
  final Function onRemove;
  final EventoModel evento;

  const CardEvent({
    super.key,
    required this.onRemove, 
    required this.evento,
  });

  @override
  Widget build(BuildContext context) {

    String title = evento.title;
    String date = evento.date;
    double id = evento.id;

    return Card(
      color: const Color.fromARGB(255, 99, 183, 170),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => EventPage(evento: evento,)));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
                  Text('Data: $date'),
                  Text('Total de Fiados: ${evento.fiados.length}'),
                ],
              ),
              IconButton(
                onPressed: () {onRemove(id);}, 
                icon: const Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}