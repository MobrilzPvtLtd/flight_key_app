import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../app/routes/app_routes.dart';

class PricingTab extends StatelessWidget {
  const PricingTab({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1A8FD8),
            Color(0xFF0F6FBF),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 30),

            /// ONE TIME PLANS
            Row(
              children: const [
                Expanded(child: _OneTimePlanCard(
                  title: 'One Flight',
                  price: '\$24.99',
                  subtitle: 'Does Not Expire\nBilled One Time',
                )),
                SizedBox(width: 16),
                Expanded(child: _OneTimePlanCard(
                  title: '20 Flights',
                  price: '\$399',
                  subtitle: 'Does Not Expire\nBilled One Time',
                )),
              ],
            ),

            const SizedBox(height: 30),

            /// MONTHLY PLAN
            const _MonthlyPlanCard(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}



class _OneTimePlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;

  const _OneTimePlanCard({
    required this.title,
    required this.price,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6A7CFF),
            Color(0xFF4DA3FF),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Text(price,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12)),
          const Divider(color: Colors.white30, height: 30),
          const Text(
            '• Full Platform Suite Included\n• One Time Use',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Get.toNamed(Routes.PAYEMENT);
              },
              child: const Text('Buy Now'),
            ),
          ),
        ],
      ),
    );
  }
}


class _MonthlyPlanCard extends StatelessWidget {
  const _MonthlyPlanCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gold',
            style: TextStyle(
              color: Color(0xFF1A8FD8),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '\$249',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'PER MONTH',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const Divider(height: 30),
          const Text('• Unlimited Use'),
          const Text('• Full Platform Access'),
          const Text('• Priority Support'),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1A8FD8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // TODO: subscribe
              },
              child: const Text(
                'Subscribe Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
