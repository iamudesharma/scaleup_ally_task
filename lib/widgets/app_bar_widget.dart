import 'package:flutter/material.dart';

import '../constants/colors.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
              stretch: true,
              collapsedHeight: 100,
              expandedHeight: 100,
              pinned: true,

              actions: const [
                Icon(Icons.notifications),
              ],
              title: const Text("LCN FIRM"),
              // expandedHeight: 103,
              flexibleSpace: Container(
                padding: const EdgeInsets.only(
                  bottom: 8,
                  left: 16,
                ),
                height: 100,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Udesh Shrama",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: Colors.white,
                          ),
                          Text(
                            "Time Square Plaza, New york",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      )
                    ]),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: ColorTheme.appBarlinearGradient(),
                ),
              ),
            );
  }
}