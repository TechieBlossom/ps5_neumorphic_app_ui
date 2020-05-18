import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:ps5_neumorphic/pages/homepage/homepage_screen.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _Background(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              _AppBar(),
              _Content(),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 20,
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dual Sense',
                        style: TextStyle(
                          letterSpacing: 1.4,
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'DualSense also adds lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem',
                        maxLines: 3,
                        style: TextStyle(
                          height: 1.4,
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Table(
                        children: [
                          TableRow(
                            children: [
                              FeatureBlocItem(
                                title: 'Futuristic',
                                description: 'Design',
                                iconData: Icons.access_time,
                              ),
                              FeatureBlocItem(
                                title: 'Haptic',
                                description: 'Feedback',
                                iconData: Icons.gamepad,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              FeatureBlocItem(
                                title: 'Built-in',
                                description: 'Microphone',
                                iconData: Icons.mic,
                              ),
                              FeatureBlocItem(
                                title: 'Fast charge',
                                description: 'USB Type-C',
                                iconData: Icons.battery_charging_full,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      ClayContainer(
                        height: 60,
                        borderRadius: 10,
                        color: Colors.white,
                        spread: 10,
                        depth: 40,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '\$ 50',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: blueColor,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Flexible(
                                        fit: FlexFit.loose,
                                        child: Text(
                                          'Preorder',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      VerticalDivider(
                                        color: iconBackgroundColor,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 32,
            top: height * 0.4 - 32,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Icon(
                Icons.bookmark_border,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureBlocItem extends StatelessWidget {
  final IconData iconData;
  final String title, description;

  //One learning - YOu cannot use Row here because of equal placements.. Table or reversing Row with Column will work. Let's see.

  const FeatureBlocItem({
    Key key,
    @required this.iconData,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ClayContainer(
          height: 50,
          width: 50,
          depth: 10,
          borderRadius: 12,
          curveType: CurveType.convex,
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: blueColor, width: 0.2),
            ),
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: blueColor, width: 0.2),
              ),
              child: Icon(
                iconData,
                color: blueColor,
                size: 25,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 0, top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _Configuration(),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Transform.rotate(
              angle: -1.55,
              child: Image.asset(
                'assets/icons/ps5_black_controller.png',
                width: width * 0.7,
                fit: BoxFit.fitWidth,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Configuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'PLATFORM',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'PS5',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'RELEASE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'FALL 2020',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'PRICE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$ 50',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.4,
      alignment: Alignment.topCenter,
      child: ColoredBox(
        color: blueColor,
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 25,
            ),
          ),
          ClayContainer(
            height: 50,
            width: 50,
            depth: 20,
            borderRadius: 25,
            parentColor: blueColor,
            curveType: CurveType.concave,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: iconBackgroundColor.withOpacity(0.2), width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.add_shopping_cart,
                color: iconBackgroundColor,
                size: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
