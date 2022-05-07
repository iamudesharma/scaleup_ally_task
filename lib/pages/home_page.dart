import 'package:flutter/material.dart';
import 'package:scaleup_ally_task/widgets/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const AppBarWidget(),
            ViewAllwithTitleWidget(
              title: "Highest Rated,",
              onTap: () {},
            ),
            const HighestRatedCard(),
            ViewAllwithTitleWidget(
              title: "Services",
              onTap: () {},
            ),
            const SliverToBoxAdapter(
              child: ServicesCardWidget(),
            ),
            const SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverToBoxAdapter(
                child: Divider(
                  thickness: 1.5,
                ),
              ),
            ),
            const UserFormWidget(),
          ],
        ),
      ),
    );
  }
}

class ViewAllwithTitleWidget extends StatelessWidget {
  const ViewAllwithTitleWidget({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      sliver: SliverToBoxAdapter(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(
                0xff1D2677,
              ),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text(
              "view all",
              style: TextStyle(
                color: Color(
                  0xff1D2677,
                ),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      )),
    );
  }
}




// class FormWidgetItems extends StatelessWidget {
//   const FormWidgetItems({
//     Key? key,
//     required this.controller,
//     this.validator,
//     required this.name,
//     required this.hintext,
//   }) : super(key: key);

//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final String name;
//   final String hintext;

//   @override
//   Widget build(BuildContext context) {
//     return FormBuilderTextField(
//       controller: controller,
//       validator: validator,
//       name: name,
//       decoration: InputDecoration(
//         labelText: hintext,
//         hintText: hintext,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     );
//   }
// }

