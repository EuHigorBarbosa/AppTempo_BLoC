import 'package:equatable/equatable.dart';

class WheaterModel extends Equatable {
  int hourOfDay;

  WheaterModel(this.hourOfDay);
  @override
  List<Object?> get props => [hourOfDay];
}
