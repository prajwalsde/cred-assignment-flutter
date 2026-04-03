import '../models/bill_model.dart';

class BillRepository {
  /// Fetches bills from the API or local source
  /// If [largeData] is true, returns a larger dataset
  Future<List<BillModel>> fetchBills({bool largeData = true}) async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    if (largeData) {
      return _generateLargeBillsList();
    } else {
      return _generateSmallBillsList();
    }
  }

  List<BillModel> _generateSmallBillsList() {
    return [
      const BillModel(
        id: 'XXXX 1234',
        accountName: 'HDFC Bank',
        amount: '12,000',
        dueDate: 'DUE TODAY',
        logoUrl: 'https://via.placeholder.com/150?text=HDFC',
      ),
      const BillModel(
        id: 'XXXX 5678',
        accountName: 'SBI',
        amount: '500',
        dueDate: 'OVERDUE',
        logoUrl: 'https://via.placeholder.com/150?text=SBI',
      ),
    ];
  }

  List<BillModel> _generateLargeBillsList() {
    return [
      const BillModel(
        id: 'XXXX 1234',
        accountName: 'HDFC Bank',
        amount: '12,000',
        dueDate: 'DUE TODAY',
        logoUrl: 'https://via.placeholder.com/150?text=HDFC',
      ),
      const BillModel(
        id: 'XXXX 5678',
        accountName: 'SBI',
        amount: '500',
        dueDate: 'OVERDUE',
        logoUrl: 'https://via.placeholder.com/150?text=SBI',
      ),
      const BillModel(
        id: 'XXXX 9012',
        accountName: 'ICICI Bank',
        amount: '8,500',
        dueDate: '2 Days',
        logoUrl: 'https://via.placeholder.com/150?text=ICICI',
      ),
      const BillModel(
        id: 'XXXX 3456',
        accountName: 'Axis Bank',
        amount: '3,200',
        dueDate: '5 Days',
        logoUrl: 'https://via.placeholder.com/150?text=Axis',
      ),
      const BillModel(
        id: 'XXXX 7890',
        accountName: 'Kotak Mahindra',
        amount: '15,000',
        dueDate: '10 Days',
        logoUrl: 'https://via.placeholder.com/150?text=Kotak',
      ),
    ];
  }
}
