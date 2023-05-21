import 'package:equatable/equatable.dart';

import '../../data/models/player_model.dart';

class Players extends Equatable {
  final List<Datum> data;

  const Players({required this.data});

  @override
  List<Object?> get props => [data];
}
