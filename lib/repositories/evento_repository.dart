import 'package:app_fiado/model/evento_model.dart';

class EventoRepository {
  final List<EventoModel> _eventos = [];

  void _addEvento(String title, String date) {
    _eventos.add(EventoModel(title: title, date: date));
  }

  void _removeEvento(evento) {
    _eventos.remove(evento);
  }
}