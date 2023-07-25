import 'package:flutter/material.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Credit_card_page extends StatefulWidget {
  const Credit_card_page({super.key});

  @override
  State<Credit_card_page> createState() => _Credit_card_pageState();
}

class _Credit_card_pageState extends State<Credit_card_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                CreditCard(
                    cardNumber: "5450 7879 4864 7854",
                    cardExpiry: "10/25",
                    cardHolderName: "Card Holder",
                    cvv: "456",
                    bankName: "Axis Bank",
                    cardType: CardType
                        .masterCard, // Optional if you want to override Card Type
                    showBackSide: false,
                    frontBackground: CardBackgrounds.black,
                    backBackground: CardBackgrounds.white,
                    showShadow: true,
                    textExpDate: 'Exp. Date',
                    textName: 'Name',
                    textExpiry: 'MM/YY'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
