import 'package:flutter/material.dart';

class PurchaseScreen extends StatefulWidget {
  final String name;
  final String details;
  final String previousPrice;
  final String newPrice;
  final String image;

  const PurchaseScreen({
    super.key,
    required this.name,
    required this.details,
    required this.previousPrice,
    required this.newPrice,
    required this.image,
  });

  @override
  State<PurchaseScreen> createState() =>
      _PurchaseScreenState();
}

class _PurchaseScreenState extends State<PurchaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: Text(
          widget.name,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(widget.image),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(
                  255,
                  153,
                  142,
                  142,
                ),
              ),

              child: Text(
                widget.details,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
