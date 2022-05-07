import 'package:auto_route/annotations.dart';

import '../pages/page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: MainPage,
      initial: true,
      children: [
        AutoRoute(path: 'home', page: HomePage,),
        AutoRoute(path: 'Booking', page: BookingPage),
        AutoRoute(path: 'nearby', page: NearbyPage),
        AutoRoute(path: 'message', page: MessagePage),
        AutoRoute(path: 'account', page: AccountPage),
      ],
    ),
  ],
)
class $AppRouter {}
