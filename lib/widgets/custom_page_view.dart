import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  final Function(int) onPageChanged;
  const CustomPageView({
    super.key,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 3.5,
              offset: Offset(1, 1),
              color: Colors.grey,
            ),
            BoxShadow(
              blurRadius: 10,
              spreadRadius: 3.5,
              offset: Offset(-1, 1),
              color: Colors.grey,
            ),
          ],
          color: const Color.fromARGB(255, 206, 205, 205),
          borderRadius: BorderRadius.circular(20),
        ),
        child: PageView(
          controller: controller,
          onPageChanged: onPageChanged,
          scrollDirection: Axis.horizontal,
          dragStartBehavior: DragStartBehavior.start,
          children: [
            getPage(
              'assets/images/s.jpg',
              'Get into the shopping world, Find yourself \nfashonable, and way more smart \nthan others Lorem epsum\nnew here',
              context,
            ),
            getPage(
              'assets/images/l1.jpg',
              'It\'s now more easy to be fashionable with\n you all family member get in touch\n with our outlet! lorem emsum\ngo find others',
              context,
            ),
            getPage(
              'assets/images/l3.jpg',
              'Amazing offers as a Premium member! \nshop more and get more offers \nat any outlet',
              context,
            ),
          ],
        ),
      ),
    );
  }

  Widget getPage(
    String imgUrl,
    String title,
    BuildContext context,
  ) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
              imgUrl,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
