import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/bill_repository.dart';
import 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  final BillRepository _billRepository;

  BillCubit(this._billRepository) : super(const BillInitial());

  /// Load bills from the repository
  /// If [largeData] is true, loads a larger dataset
  Future<void> loadBills({bool largeData = true}) async {
    try {
      emit(const BillLoading());
      final bills = await _billRepository.fetchBills(largeData: largeData);
      emit(BillLoaded(bills));
    } catch (e) {
      emit(BillError(e.toString()));
    }
  }

  /// Refresh bills by reloading
  Future<void> refreshBills({bool largeData = true}) async {
    await loadBills(largeData: largeData);
  }
}
