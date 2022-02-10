import 'package:equatable/equatable.dart';

class AbstractModel<E> extends Equatable {
  final E id;

  const AbstractModel({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
