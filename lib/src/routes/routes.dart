import 'package:go_router/go_router.dart';
import 'package:smart_travller_frontend_starter/src/ui/splash_screen.dart';
import 'package:smart_travller_frontend_starter/src/ui/trips/itinerary_screen.dart';
import 'package:smart_travller_frontend_starter/src/ui/trips/plan_trip_screen.dart';

class Routes {
  static GoRouter routes = GoRouter(
    routes: [
      // Define your routes here
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      GoRoute(
        path: '/plan-trip-screen',
        builder: (context, state) => const PlanTripScreen(),
      ),
      GoRoute(
        path: '/itinerary-screen',
        builder: (context, state) => const ItineraryScreen(),
      ),
    ],
  );
}
