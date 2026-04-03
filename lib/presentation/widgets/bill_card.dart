import 'package:flutter/material.dart';
import '../../data/models/bill_model.dart';

class BillCard extends StatelessWidget {
  final BillModel bill;

  const BillCard({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Logo/Icon
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFE8E8E8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: bill.logoUrl.isEmpty
                  ? const Icon(Icons.domain, color: Color(0xFF1B1B1B))
                  : Image.network(
                      bill.logoUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.domain,
                          color: Color(0xFF1B1B1B),
                        );
                      },
                    ),
            ),
            const SizedBox(width: 16),
            // Bill Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bill.accountName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    bill.id,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: const Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
            // Amount and Due Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹${bill.amount}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1B1B1B),
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: _getDueDateColor(bill.dueDate),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    bill.dueDate,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getDueDateColor(String dueDate) {
    if (dueDate.contains('OVERDUE')) {
      return const Color(0xFFE74C3C); // Red
    } else if (dueDate.contains('DUE TODAY')) {
      return const Color(0xFFF39C12); // Orange
    } else {
      return const Color(0xFF27AE60); // Green
    }
  }
}
