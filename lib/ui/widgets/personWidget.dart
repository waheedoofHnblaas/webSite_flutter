import 'package:flutter/material.dart';
import 'package:web_uae/core/constants/person.dart';
import 'package:web_uae/core/sizes.dart';

class PersonWidgetSeeMore extends StatelessWidget {
  const PersonWidgetSeeMore({Key? key}) : super(key: key);

  personListWidget(context) {
    return [
      Container(
        width:
            isLandscape(context) ? MediaQuery.of(context).size.width / 2 : null,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isLandscape(context)
                ? const SizedBox(
                    height: 100,
                  )
                : Container(),
            ListTile(
              title: Text(
                Person.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 33,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ListTile(
              subtitle: Text(
                Person.subTitle,
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 16,
                  color: Colors.grey,
                  wordSpacing: 4,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: isLandscape(context)
            ? MediaQuery.of(context).size.width / 2.5
            : MediaQuery.of(context).size.width / 1.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Person.image, fit: BoxFit.fill),
            isLandscape(context)
                ? const SizedBox(
                    height: 100,
                  )
                : Container(),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
                  animationDuration: const Duration(seconds: 2),
                  overlayColor:
                      MaterialStateProperty.all<Color>(const Color(0xffff8c34)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.blue), // Set the background color
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('See More'),
                ),
              ),
            )
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Person.color,
      height: isLandscape(context) ? 800 : 900,
      child: isLandscape(context)
          ? Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: personListWidget(context),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: personListWidget(context),
            ),
    );
  }
}
