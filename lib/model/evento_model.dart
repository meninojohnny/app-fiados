import 'dart:math';

import 'package:app_fiado/model/person_model.dart';

class EventoModel {
  final String title;
  final String date;
  final id = Random().nextDouble();
  List<PersonModel> fiados = [
    PersonModel(name: 'Joao vitor', value: '123.32'),
    PersonModel(name: 'Mateus', value: '123.32'),
    PersonModel(name: 'Felipe', value: '123.32'),
    PersonModel(name: 'Tiago', value: '123.32'),
    PersonModel(name: 'Malu', value: '123.32'),
  ];

  EventoModel({required this.title, required this.date});
}
