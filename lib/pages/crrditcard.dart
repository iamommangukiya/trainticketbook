import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_card/awesome_card.dart';
import 'package:railway/pages/homepage.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../componments/bottomnavigationbar.dart';

class Credit_card_page extends StatefulWidget {
  const Credit_card_page({super.key});

  @override
  State<Credit_card_page> createState() => _Credit_card_pageState();
}

class _Credit_card_pageState extends State<Credit_card_page> {
  @override
  BottomnavigationbarController bottomnavigationbarController =
      Get.put(BottomnavigationbarController());
  final slideActionKey = GlobalKey<SlideActionState>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SlideAction(
                  text: "Slide To Pay",
                  submittedIcon:
                      Image(image: AssetImage("lib/images/rupee.png")),
                  sliderButtonIcon: Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  ),
                  elevation: 0,
                  innerColor: const Color.fromARGB(255, 23, 23, 24),
                  outerColor: Colors.grey[350],
                  borderRadius: 12,
                  onSubmit: () {
                    Get.to(Homepage(),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 500));
                    Get.snackbar("Booked!", "Your seet booked successfully");
                    bottomnavigationbarController.selectdindex(0);
                    slideActionKey.currentState!.reset();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
