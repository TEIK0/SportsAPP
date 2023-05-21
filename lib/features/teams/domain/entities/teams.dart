import 'package:equatable/equatable.dart';

import '../../data/models/teams_model.dart';

class Teams extends Equatable {
  final List<Datum> data;

  const Teams({required this.data});

  @override
  List<Object?> get props => [data];
}
