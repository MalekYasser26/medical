import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical/utils/constants.dart';

class ProgressVertical extends StatelessWidget {
  final int value;
  final String date;
  final bool isShowDate;

  const ProgressVertical({
    Key? key,
    required this.value,
    required this.date,
    required this.isShowDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 7),
      width: 30,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              width: 10,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                color: Constants.lightGreen,
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                            color: Constants.darkGreen,
                          ),
                          height: constraints.maxHeight * (value / 100),
                          width: constraints.maxWidth,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (isShowDate) Text(date),
        ],
      ),
    );
  }
}
