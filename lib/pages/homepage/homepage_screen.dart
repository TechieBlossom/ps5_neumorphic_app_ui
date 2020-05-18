import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ps5_neumorphic/bloc/item_bloc.dart';
import 'package:ps5_neumorphic/bloc/item_event.dart';
import 'package:ps5_neumorphic/bloc/item_state.dart';
import 'package:ps5_neumorphic/model/controller.dart';
import 'package:ps5_neumorphic/model/option.dart';
import 'package:ps5_neumorphic/pages/details_page.dart';
import 'package:ps5_neumorphic/pages/homepage/item_card_shape.dart';

const Color blueColor = const Color(0xCC2372F0);
const Color iconBackgroundColor = const Color(0xFF647082);
final BorderRadius optionBorderRadius = BorderRadius.circular(8);

class HomepageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider<ItemBloc>(
      create: (context) => ItemBloc(),
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _Background(
              width: width * 0.4,
              height: height * 0.8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                _AppBar(),
                SizedBox(
                  height: 30,
                ),
                _Title(
                  text: 'Featured Products',
                ),
                SizedBox(
                  height: 30,
                ),
                _SettingAndOptions(),
                SizedBox(
                  height: 30,
                ),
                BlocBuilder<ItemBloc, ItemSelectedState>(
                  builder: (context, state) {
                    return _ItemsWidget(
                      items: state.selectedItem,
                      screenWidth: width,
                      screenHeight: height,
                    );
                  },
                ),
                Spacer(),
                _BottomBar(),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomBar extends StatefulWidget {
  const _BottomBar({Key key}) : super(key: key);

  @override
  __BottomBarState createState() => __BottomBarState();
}

class __BottomBarState extends State<_BottomBar> {
  int selectedIndex = 0;

  void onItemTapped(int tappedItemIndex) {
    setState(() {
      selectedIndex = tappedItemIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ClayContainer(
        height: 60,
        borderRadius: 10,
        color: Colors.white,
        spread: 10,
        depth: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _BarItem(
                icon: Icons.home,
                title: 'Home',
                isSelected: selectedIndex == 0,
                onTap: () {
                  onItemTapped(0);
                },
              ),
              _BarItem(
                icon: Icons.person,
                title: 'Profile',
                isSelected: selectedIndex == 1,
                onTap: () {
                  onItemTapped(1);
                },
              ),
              _BarItem(
                icon: Icons.settings,
                title: 'Settings',
                isSelected: selectedIndex == 2,
                onTap: () {
                  onItemTapped(2);
                },
              ),
              _BarItem(
                icon: Icons.bookmark,
                title: 'Wishlist',
                isSelected: selectedIndex == 3,
                onTap: () {
                  onItemTapped(3);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final Function onTap;

  const _BarItem({Key key, this.icon, this.title, this.isSelected, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: isSelected ? blueColor : Colors.white,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: isSelected ? Colors.white : iconBackgroundColor,
            ),
            if (isSelected)
              VerticalDivider(
                color: iconBackgroundColor,
              ),
            if (isSelected)
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SettingAndOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.short_text,
            color: iconBackgroundColor,
            size: 50,
          ),
          SizedBox(
            width: 20,
          ),
          BlocBuilder<ItemBloc, ItemSelectedState>(
            builder: (context, state) {
              return _OptionsWidget(
                selectedOptionId: state.selectedIndex,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ItemsWidget extends StatelessWidget {
  final List<Item> items;
  final double screenWidth, screenHeight;

  const _ItemsWidget({Key key, this.items, this.screenWidth, this.screenHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen()));
      },
      child: SizedBox(
        height: screenHeight * 0.42,
        child: PageView.builder(
            itemCount: items.length,
            controller: PageController(viewportFraction: 0.7),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: <Widget>[
                    Material(
                      elevation: 10,
                      shape: ItemCardShape(
                        screenWidth * 0.64,
                        screenHeight * 0.38,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Align(
                        alignment: Alignment(0, -0.1),
                        child: Image.asset(items[index].imagePath),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 32,
                      right: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            items[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            items[index].description,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 40,
                      child: Image.asset(
                        'assets/icons/ps_logo.png',
                        width: 50,
                        height: 50,
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class _OptionsWidget extends StatelessWidget {
  final int selectedOptionId;

  const _OptionsWidget({Key key, this.selectedOptionId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          for (int index = 0; index < options.length; index++)
            _OptionWidget(
                option: options[index],
                index: index,
                isSelected: options[index].id == selectedOptionId),
        ],
      ),
    );
  }
}

class _OptionWidget extends StatelessWidget {
  final Option option;
  final int index;
  final bool isSelected;

  const _OptionWidget(
      {Key key, @required this.option, @required this.index, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BlocProvider.of<ItemBloc>(context).add(ItemSelectedEvent(index));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Material(
          elevation: 8,
          borderRadius: optionBorderRadius,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: optionBorderRadius,
              color: isSelected ? Colors.black : Colors.white,
            ),
            child: Image.asset(
              option.imagePath,
              color: isSelected ? Colors.white : iconBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String text;

  const _Title({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = text.split(' ');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: words[0],
              style: TextStyle(
                height: 0.8,
                fontWeight: FontWeight.w900,
                fontSize: 36,
                letterSpacing: 2,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '\n',
            ),
            TextSpan(
              text: words[1],
              style: TextStyle(
                height: 0.85,
                fontWeight: FontWeight.w900,
                fontSize: 36,
                letterSpacing: 10,
                fontFamily: 'Londrina_Outline',
                color: Colors.black,
              ),
            ),
          ],
        ),
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
          ClayContainer(
            height: 50,
            width: 50,
            depth: 20,
            borderRadius: 25,
            curveType: CurveType.concave,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: iconBackgroundColor.withOpacity(0.3), width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Icon(
                Icons.menu,
                color: iconBackgroundColor,
                size: 25,
              ),
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

class _Background extends StatelessWidget {
  final double width, height;

  const _Background({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      width: width,
      top: 0,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
        child: ColoredBox(
          color: blueColor,
        ),
      ),
    );
  }
}
