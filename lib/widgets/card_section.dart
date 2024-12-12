import 'package:flutter/material.dart';
import 'package:medical/utils/constants.dart';
import 'package:medical/widgets/custom_clipper.dart';

class CardSection extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final String time;
  final ImageProvider image;
  final bool isDone;

  const CardSection({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.time,
    required this.image,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(right: 15.0),
        width: 240,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
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
                    color: Constants.lightBlue.withOpacity(0.1),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image(
                        image: image,
                        width: 24,
                        height: 24,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text(
                        time,
                        style: TextStyle(
                          fontSize: 15,
                          color: Constants.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Constants.textPrimary,
                              ),
                            ),
                            Text(
                              '$value $unit',
                              style: TextStyle(
                                fontSize: 15,
                                color: Constants.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          debugPrint("Button clicked. Handle button setState");
                        },
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                            color: isDone
                                ? Theme.of(context).colorScheme.secondary
                                : const Color(0xFFF0F4F8),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: isDone
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
