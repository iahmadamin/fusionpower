import 'package:flutter/material.dart';
import 'package:fusionpower/constant/colors.dart';
import 'package:fusionpower/view/widgets/c_button.dart';

class QuoteSubmittedPage extends StatelessWidget {
  const QuoteSubmittedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Check your Inbox!",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: labelColorPrimary,
              ),
            ),
            const Text(
              "We've sent your quotes straight to you, what next?",
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 0.38,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xFFC7C7CC),
                  )),
              child: Column(children: [
                const Text(
                  "Download your Quote",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: labelColorPrimary,
                  ),
                ),
                const Text(
                  "Click to view your quote",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                CButton(label: "Download PDF", onTap: () {}),
                const SizedBox(height: 8),
                const Text(
                  "Your quote will also be emailed to you",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    color: Colors.grey,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xFFC7C7CC),
                  )),
              child: Column(children: [
                const Text(
                  "Finance your solution",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: labelColorPrimary,
                  ),
                ),
                const Text(
                  "Pay off your system over 60 months",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                CButton(
                  label: "Apply Today",
                  onTap: () {},
                  color: Color(0xFF009d90),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Complete the online form & upload your quote",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    color: Colors.grey,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: const Color(0xFFC7C7CC),
                  )),
              child: Column(children: [
                const Text(
                  "Book a Site Visit",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: labelColorPrimary,
                  ),
                ),
                const Text(
                  "Ready for the next step?",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                CButton(
                    label: "Make a Virutal Booking",
                    color: primaryBlue,
                    onTap: () {}),
                const SizedBox(height: 8),
                const Text(
                  "Gauteng * Cape Town",
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 0.38,
                    color: Colors.grey,
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
