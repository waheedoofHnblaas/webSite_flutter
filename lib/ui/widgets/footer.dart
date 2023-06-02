import 'dart:html';

import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  List<String> items = List.generate(50, (index) => 'Item $index');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
         controller: _scrollController,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedOpacity(
            opacity: calculateOpacity(index),
            duration: const Duration(milliseconds: 500),
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }

  double calculateOpacity(int index) {
    // Modify this method to define your own animation behavior
    final scrollOffset = _scrollController.offset;
    final itemPosition = index * 100.0;
    final distanceFromCenter = (itemPosition - scrollOffset).abs();
    const maxDistance = 5000.0; //the animation range

    return 1.0 - (distanceFromCenter / maxDistance);
  }
}
