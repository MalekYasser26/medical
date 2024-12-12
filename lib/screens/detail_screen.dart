import 'package:flutter/material.dart';
import 'package:medical/utils/constants.dart';
import 'package:medical/widgets/custom_clipper.dart';
import 'package:medical/widgets/grid_item.dart';
import 'package:medical/widgets/progress_vertical.dart';


class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    // For Grid Layout
    double _crossAxisSpacing = 16, _mainAxisSpacing = 16, _cellHeight = 150.0;
    int _crossAxisCount = 2;

    double _width = (MediaQuery.of(context).size.width -
        ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    double _aspectRatio =
        _width / (_cellHeight + _mainAxisSpacing + (_crossAxisCount + 1));

    final gridItems = [
      {
        'status': 'Rest',
        'time': '4h 45m',
        'value': '76',
        'unit': 'avg bpm',
        'color': Constants.darkGreen,
        'image': AssetImage('assets/icons/Battery.png'),
        'remarks': 'ok',
      },
      {
        'status': 'Active',
        'time': '30m',
        'value': '82',
        'unit': 'avg bpm',
        'color': Constants.darkOrange,
        'image': AssetImage('assets/icons/Battery.png'),
        'remarks': 'ok',
      },
      {
        'status': 'Fitness Level',
        'time': '',
        'value': '82',
        'unit': 'avg bpm',
        'color': Constants.darkOrange,
        'image': AssetImage('assets/icons/Heart.png'),
        'remarks': 'Fit',
      },
      {
        'status': 'Endurance',
        'time': '',
        'value': '82',
        'unit': 'avg bpm',
        'color': Constants.darkOrange,
        'image': AssetImage('assets/icons/Battery.png'),
        'remarks': 'Ok',
      }
    ];

    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: MyCustomClipper(clipType: ClipType.bottom),
            child: Container(
              color: Constants.darkGreen,
              height: Constants.headerHeight + statusBarHeight,
            ),
          ),

          Positioned(
            right: -45,
            top: -30,
            child: ClipOval(
              child: Container(
                color: Colors.black.withOpacity(0.05),
                height: 220,
                width: 220,
              ),
            ),
          ),

          // BODY
          Padding(
            padding: EdgeInsets.all(Constants.paddingSide),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Back Button
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 15.0, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Heartbeat", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: Colors.white)),
                        SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            Text("66", style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.white)),
                            SizedBox(width: 10),
                            Text("bpm", style: TextStyle(fontSize: 20, color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Image.asset('assets/icons/heartbeatthin.png', height: 73, width: 80, color: Colors.white),
                  ],
                ),
                SizedBox(height: 30),

                // Chart
                Material(
                  shadowColor: Colors.grey.withOpacity(0.01),
                  type: MaterialType.card,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    height: 300,
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(radius: 5, backgroundColor: Constants.lightGreen),
                            SizedBox(width: 10),
                            Text("Rest"),
                            SizedBox(width: 20),
                            CircleAvatar(radius: 5, backgroundColor: Constants.darkGreen),
                            SizedBox(width: 10),
                            Text("Active"),
                          ],
                        ),
                        SizedBox(height: 20),
                        // Main Cards - Heartbeat and Blood Pressure
                        Container(
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              ProgressVertical(value: 50, date: "5/11", isShowDate: true),
                              ProgressVertical(value: 50, date: "5/12", isShowDate: false),
                              ProgressVertical(value: 45, date: "5/13", isShowDate: false),
                              ProgressVertical(value: 30, date: "5/14", isShowDate: true),
                              ProgressVertical(value: 50, date: "5/15", isShowDate: false),
                              ProgressVertical(value: 20, date: "5/16", isShowDate: false),
                              ProgressVertical(value: 45, date: "5/17", isShowDate: true),
                              ProgressVertical(value: 67, date: "5/18", isShowDate: false),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),

                        // Line Graph
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Constants.darkGreen,
                            ),
                            child: ClipPath(
                              clipper: MyCustomClipper(clipType: ClipType.multiple),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Constants.lightGreen,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Grid View
                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount,
                    crossAxisSpacing: _crossAxisSpacing,
                    mainAxisSpacing: _mainAxisSpacing,
                    childAspectRatio: _aspectRatio,
                  ),
                  itemCount: gridItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = gridItems[index];
                    return GridItem(
                      status: item['status'] as String, // Cast to String
                      time: item['time'] as String,     // Cast to String
                      value: item['value'] as String,   // Cast to String
                      unit: item['unit'] as String,     // Cast to String
                      color: item['color'] as Color ,             // No cast needed for color (it's a Color)
                      image: item['image'] as AssetImage,             // No cast needed for image (it's an AssetImage)
                      remarks: item['remarks'] as String, // Cast to String
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
