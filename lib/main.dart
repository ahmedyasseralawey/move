import 'package:flutter/material.dart';
import 'package:move_app/app_router.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
 final AppRouter appRouter;

 MyApp({required this.appRouter});

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute
    );
  }
}
