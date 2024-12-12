import 'package:flutter/material.dart';
import 'package:medical/screens/detail_screen.dart';
import 'package:medical/utils/constants.dart';
import 'package:medical/widgets/custom_clipper.dart';

class CardMain extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String value;
  final String unit;
  final Color color;

  const CardMain({
    Key? key,
    required this.image,
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cardWidth = (MediaQuery.of(context).size.width -
        (Constants.paddingSide * 2 + Constants.paddingSide / 2)) /
        2;

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        width: cardWidth,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          color: color,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            onTap: () {
              debugPrint("Card main clicked. Redirecting to details page...");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  DetailScreen()),
              );
            },
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: <Widget>[
                Positioned(
                  child: ClipPath(
                    clipper: MyCustomClipper(clipType: ClipType.semiCircle),
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.black.withOpacity(0.03),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            width: 12,
                            height: 12,
                            image: image,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                color: Constants.textDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Constants.textDark,
                        ),
                      ),
                      Text(
                        unit,
                        style: TextStyle(
                          fontSize: 15,
                          color: Constants.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
