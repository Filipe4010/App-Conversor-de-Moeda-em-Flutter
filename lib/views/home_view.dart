import 'package:app_conversor_moeda/controllers/home_controller.dart';
import '../components/currency_box.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  //const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 30),
        child: Column(
          children: [
            Image.asset(
              'images/logoteste.png',
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 40,
            ),
            CurrencyBox(
              selectedOption: homeController.toCurrency,
              controller: toText,
              items: homeController.currencies,
              onChanged: ((model) {
                setState(() {
                  homeController.toCurrency = model!;
                });
              }),
            ),
            SizedBox(
              height: 10,
            ),
            CurrencyBox(
              selectedOption: homeController.fromCurrency,
              controller: fromText,
              items: homeController.currencies,
              onChanged: ((model) {
                setState(() {
                  homeController.fromCurrency = model!;
                });
              }),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                homeController.convert();
              },
              child: Text('CONVERTER'),
            )
          ],
        ),
      ),
    ));
  }
}
