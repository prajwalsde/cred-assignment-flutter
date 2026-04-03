// ignore_for_file: avoid_relative_lib_imports

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Imports
import '../lib/presentation/screens/home_screen.dart';
import '../lib/logic/cubit/bill_cubit.dart';
import '../lib/logic/cubit/bill_state.dart';
import '../lib/data/repositories/bill_repository.dart';
import '../lib/data/models/bill_model.dart'; 

// --------------------------------------------------------------------------
// FAKE CUBIT: Simulates a successful API call without using the network
// --------------------------------------------------------------------------
class FakeBillCubit extends BillCubit {
  // Pass a real repository to super to satisfy the constructor requirements
  FakeBillCubit() : super(BillRepository());

  @override
  Future<void> loadBills({bool largeData = true}) async {
    // 1. Emit Loading State
    emit(BillLoading());
    
    // 2. Wait a tiny bit to simulate processing (helps widget test settle)
    await Future.delayed(const Duration(milliseconds: 50));
    
    // 3. Emit Loaded State with Dummy Data
    // This forces the HomeScreen to render the "CRED" header and cards
    emit(BillLoaded([
      BillModel(
        id: "XXXX 1234",
        accountName: "HDFC Test Bank",
        amount: "12,000",
        dueDate: "DUE TODAY",
        logoUrl: "", // Empty URL will just show the fallback icon, which is fine for tests
      ),
       BillModel(
        id: "XXXX 5678",
        accountName: "SBI Test",
        amount: "500",
        dueDate: "OVERDUE",
        logoUrl: "", 
      ),
    ]));
  }
}

// --------------------------------------------------------------------------
// THE TEST CASE
// --------------------------------------------------------------------------
void main() {
  testWidgets('App renders CRED Header and verifies Stack UI', (WidgetTester tester) async {
    // 1. Load the App with the FAKE Cubit
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<BillCubit>(
          create: (_) => FakeBillCubit(), // Inject the fake!
          child: const HomeScreen(),
        ),
      ),
    );

    // 2. Verify Initial Loading State
    // The app should show a spinner while "fetching"
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // 3. Wait for the "API call" to finish and animations to settle
    await tester.pumpAndSettle();

    // 4. Verify Loaded UI
    // Now that the FakeCubit emitted data, these widgets should be visible:
    expect(find.text('CRED'), findsOneWidget); // The Header
    expect(find.text('UPCOMING BILLS (2)'), findsOneWidget); // The Sub-header
    expect(find.text('HDFC Test Bank'), findsOneWidget); // The Card Content
  });
}