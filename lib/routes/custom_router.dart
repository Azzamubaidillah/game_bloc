import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game_bloc/model/data_model.dart';
import 'package:game_bloc/screens/landing_page.dart';
import 'package:game_bloc/screens/detail_page.dart';

part 'custom_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(page: DetailPage),
  ],
)
class AppRouter extends _$AppRouter {}
