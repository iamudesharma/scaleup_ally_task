import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scaleup_ally_task/routes/routes.gr.dart';

import '../widgets/widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        BookingRoute(),
        NearbyRoute(),
        MessageRoute(),
        AccountRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return BottomNavigationBar(
          selectedItemColor: const Color(0xffE45171),
          unselectedItemColor: const Color(0xff939393),
          selectedLabelStyle: const TextStyle(
            color: Color(0xffE45171),
          ),
          showUnselectedLabels: true,
          items: [
            bottomNavigationBarItemWidget(iconData: Icons.home, label: 'Home'),
            bottomNavigationBarItemWidget(
              label: 'Booking',
              iconData: FontAwesomeIcons.solidCalendarCheck,
            ),
            bottomNavigationBarItemWidget(
              label: 'Nearby',
              iconData: Icons.location_on_sharp,
            ),
            bottomNavigationBarItemWidget(
              label: 'Message',
              iconData: Icons.message,
            ),
            bottomNavigationBarItemWidget(
              label: 'Account',
              iconData: Icons.account_box,
            ),
          ],
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
        );
      },
    );
  }
}
