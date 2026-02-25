import 'package:equatable/equatable.dart';

abstract base class ScheduleEvent extends Equatable {
  const ScheduleEvent();

  @override
  List<Object?> get props => [];
}

final class ScheduleRequested extends ScheduleEvent {
  const ScheduleRequested({this.initialDate});

  final DateTime? initialDate;

  @override
  List<Object?> get props => [initialDate];
}

final class ScheduleDateSelected extends ScheduleEvent {
  const ScheduleDateSelected(this.date);

  final DateTime date;

  @override
  List<Object?> get props => [date];
}
