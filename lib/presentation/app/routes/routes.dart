import 'package:flutter/widgets.dart'; 
import 'package:tag_play/presentation/app/bloc/app_bloc.dart';
import 'package:tag_play/features/home/view/home_page.dart';
import 'package:tag_play/features/authentication/login/view/login_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [AuthenticatedRoute .page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
