import 'package:caravan/trip_details/view/trip_details.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/trip-details',
    routes: [
      GoRoute(
        path: '/trip-details',
        builder: (context, state) => const TripDetailsPage(),
      ),
    ],
  );
}
