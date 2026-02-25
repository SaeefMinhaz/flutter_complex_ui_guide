import 'package:equatable/equatable.dart';

abstract base class StatisticsEvent extends Equatable {
  const StatisticsEvent();

  @override
  List<Object?> get props => [];
}

final class StatisticsRequested extends StatisticsEvent {
  const StatisticsRequested();
}

