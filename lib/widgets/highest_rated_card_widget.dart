import 'package:flutter/material.dart';

class HighestRatedCard extends StatelessWidget {
  const HighestRatedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
  
    return SliverToBoxAdapter(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.235,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(
                    0xff939393,
                  ),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height * 0.13,
                    width: size.width * 0.5,
                    child: Image.asset(
                      "assets/images/michael-demoya-MUdB4YzDeKA-unsplash.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    "Solan Name",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    "Near me",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                            children: List.generate(
                          5,
                          (index) => const WidgetSpan(
                            child: Icon(
                              Icons.star,
                              size: 10,
                              color: Colors.yellow,
                            ),
                          ),
                        )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.24,
                      ),
                      RichText(
                        textAlign: TextAlign.start,
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.top,
                              child: Icon(Icons.location_on,
                                  size: 10, color: Colors.grey),
                            ),
                            TextSpan(
                              text: "2 miles",
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
