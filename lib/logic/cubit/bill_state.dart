import 'package:equatable/equatable.dart';
import '../../data/models/bill_model.dart';

abstract class BillState extends Equatable {
  const BillState();

  @override
  List<Object?> get props => [];
}

class BillInitial extends BillState {
  const BillInitial();
}

class BillLoading extends BillState {
  const BillLoading();
}

class BillLoaded extends BillState {
  final List<BillModel> bills;

  const BillLoaded(this.bills);

  @override
  List<Object?> get props => [bills];
}

class BillError extends BillState {
  final String message;

  const BillError(this.message);

  @override
  List<Object?> get props => [message];
}
