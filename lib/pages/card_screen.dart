import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Card Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
            const SizedBox(height: 30,),
            Image.asset("assets/images/credit-card.png",
            width: 200,height: 200,
            color: Theme.of(context).colorScheme.primaryContainer,
            ),

          ],
        ),
      ),
    );
  }
}
