import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:online_exam_app/config/di/di.dart';
import 'package:online_exam_app/config/router/app_routes_names.dart';
import 'package:online_exam_app/features/auth/presentation/view/screens/login_screen.dart';

import '../../features/auth/presentation/view/screens/register_screen.dart';
import '../../features/auth/presentation/view_model/auth_view_model.dart';
import 'app_routes.dart';

class AppRouter {
  AppRouter._();
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.register,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.register,
        name: AppRoutesNames.register,
        builder: (context, state) => BlocProvider(
            create: (_) => getIt<AuthViewModel>(),
            child: const RegisterScreen()),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutesNames.login,
        builder: (context, state) => BlocProvider(
            create: (_) => getIt<AuthViewModel>(),
            child: const LoginScreen()),
      ),
    ],

  );
}