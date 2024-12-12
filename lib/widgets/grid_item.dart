import 'package:flutter/material.dart';
import 'package:medical/utils/constants.dart';

class GridItem extends StatelessWidget {
  final String status;
  final String time;
  final String value;
  final String unit;
  final ImageProvider? image;
  final Color color;
  final String remarks;

  const GridItem({
    Key? key,
    required this.status,
    required this.value,
    required this.unit,
    required this.time,
    required this.color,
    required this.remarks,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    color: Constants.textPrimary,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (image == null)
              Column(
                children: <Widget>[
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 35,
                      color: color,
                    ),
                  ),
                  Text(
                    unit,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Image(image: image!),
                  const SizedBox(width: 5),
                  Text(
                    remarks,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
