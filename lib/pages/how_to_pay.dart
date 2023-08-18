import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentHow extends StatelessWidget {
  const PaymentHow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("How to Pay?"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textTitle('Payment Details'),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: textInfo('What are your payment options? We have multiple safe and convenient ways for you to purchase your favorite equipment!\n'),
              ),
              textHeader('BDO - Savings Account'),
              GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(const ClipboardData(text: "010410058661"));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Copied to clipboard - BDO - Savings Account"),
                      duration: Duration(milliseconds: 300),
                    ));
                  },
                  child: textBody("Account Name: A Celino\nAccount Number: 0104 1005 8661\n")),
              textHeader('BPI - Savings Account'),
              GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(const ClipboardData(text: "3599102824"));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Copied to clipboard - BPI - Savings Account"),
                      duration: Duration(milliseconds: 300),
                    ));
                  },
                  child: textBody("Account Name: ACelino\nAccount Number: 3599 102 824\n")),
              textHeader("Gcash Payment"),
              GestureDetector(
                  onTap: () async {
                    await Clipboard.setData(const ClipboardData(text: "09178223995"));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Copied to clipboard - Gcash Payment"),
                      duration: Duration(milliseconds: 300),
                    ));
                  },
                  child: textBody("Account Name: ACelino\nMobile Number: 0917-822-3995\n")),
              textBody('We also accept Credit/Debit Card Payments \n(Master and Visa Card)\n\nFeel free to choose the payment option that suits you best. Should you have any questions or require further assistance, please don\'t hesitate to contact us. We are here to help!\n\nThank you for choosing our website. We appreciate your business and look forward to serving you.')
            ],
          ),
        ),
      ),
    );
  }

  Widget textTitle(String str) {
    return Text(
      str,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget textHeader(String str) {
    return Text(
      str,
      style: const TextStyle(
        height: 2,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget textBody(String str) {
    return Text(
      str,
      style: const TextStyle(
        height: 2,
        fontSize: 14,
      ),
    );
  }

  Widget textInfo(String str) {
    return Builder(
      builder: (context) {
        return Text(
          str,
          style: const TextStyle(
            height: 1.5,
            fontSize: 14,
          ),
        );
      },
    );
  }
}
