import 'package:equatable/equatable.dart';

class Sport extends Equatable {
  final String key;
  final String group;
  final String title;
  final bool active;

  const Sport(
      {required this.key,
      required this.group,
      required this.title,
      required this.active});

  @override
  List<Object?> get props => [key];
}
