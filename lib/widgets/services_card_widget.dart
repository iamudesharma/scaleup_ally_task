import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/categories_model.dart';
import '../services/get_categories_services.dart';

class ServicesCardWidget extends StatefulWidget {
  const ServicesCardWidget({Key? key}) : super(key: key);

  @override
  State<ServicesCardWidget> createState() => _ServicesCardWidgetState();
}

class _ServicesCardWidgetState extends State<ServicesCardWidget> {
  @override
  void initState() {
    isLoading = true;
    Services.getAllCategories()?.then((value) {
      setState(() {
        categories = value;
        isLoading = false;
      });
    });
  }

  late CategoriesModel categories;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Container(
        height: size.height * 0.15,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.data?.length,
            itemBuilder: (BuildContext context, int index) {
              var _data = categories.data![index];

              return Container(
                margin: EdgeInsets.symmetric(horizontal: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  // backgroundBlendMode: BlendMode.color,
                  color: Color(int.parse(_data.bgcolor ?? "0xFFF5F5F5")),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      offset: Offset(3, 3),
                      blurRadius: 2,
                      blurStyle: BlurStyle.inner,
                    ),
                    BoxShadow(
                      color: Colors.grey[200]!,
                      offset: Offset(-3, -3),
                      blurRadius: 12,
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                width: size.width * 0.3,
                height: 97,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 47,
                      height: 49,
                      child: Image.network(
                        _data.icon ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      _data.name?.en ?? "",
                      style: TextStyle(
                        fontSize: 9,
                        color: Colors.white,
                        fontFamily: GoogleFonts.aBeeZee().fontFamily,
                      ),
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
}
