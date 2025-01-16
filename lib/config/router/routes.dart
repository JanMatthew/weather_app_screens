import 'package:weather_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      name: 'login',
      path: '/',
      builder: (context,state) => const LoginScreen()
    ),
    GoRoute(
      name: 'provinces',
      path: '/provinces',
      builder: (context,state) => const ProvinciesScreen()
    ),
    GoRoute(
      name: 'regions',
      path: '/regions/:provinceId',
      builder: (context,state){ 
        final int provinceId = int.parse(state.pathParameters['provinceId']!);
        return ComarquesScreen(provinceId: provinceId);
      }
    ),
    GoRoute(
      name: 'info comarca 1',
      path: '/info_1/:provinceId/:regionId',
      builder: (context,state) {
        final int provinceId = int.parse(state.pathParameters['provinceId']!);
        final int regionId = int.parse(state.pathParameters['regionId']!);
        return InfoComarca1Screen(provinceId: provinceId, regionId: regionId);
      }
    ),
    GoRoute(
      name: 'info comarca 2',
      path: '/info_2',
      builder: (context,state) => const InfoComarca2Screen()
    ),
  ]
);