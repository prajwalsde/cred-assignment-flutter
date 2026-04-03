import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/bill_cubit.dart';
import '../../logic/cubit/bill_state.dart';
import '../widgets/bill_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Load bills when the screen initializes
    context.read<BillCubit>().loadBills();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F3F3),
      body: SafeArea(
        child: Column(
          children: [
            // CRED Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CRED',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1B1B1B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Pay bills and get rewarded',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),
            // Bills List
            Expanded(
              child: BlocBuilder<BillCubit, BillState>(
                builder: (context, state) {
                  if (state is BillLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BillLoaded) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.bills.length,
                      itemBuilder: (context, index) {
                        return BillCard(bill: state.bills[index]);
                      },
                    );
                  } else if (state is BillError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else {
                    return const Center(child: Text('No bills available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
