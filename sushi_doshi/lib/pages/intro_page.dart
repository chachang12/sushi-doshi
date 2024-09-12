import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sushi_doshi/pages/menu.dart';
import 'package:sushi_doshi/pages/shop_page.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.all(24),
                child: SvgPicture.asset('assets/images/doshi_logo.svg', height: 200, width: 200),
              ),
          
              const SizedBox(height: 50),
          
              // title
              const Text(
                'Sushi Doshi',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              

              const Text(
                'Order customizable sushi rolls and have them delivered to your door!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
          
              // start button
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage())),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFE47D31),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const Center(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}