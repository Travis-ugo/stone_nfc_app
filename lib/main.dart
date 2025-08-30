import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tag_play/core/core.dart';
import 'package:tag_play/presentation/app/bloc_observer.dart';
import 'package:tag_play/presentation/app/bloc/app_bloc.dart';
import 'package:tag_play/presentation/app/routes/routes.dart';
import 'package:tag_play/presentation/themes/app_theme.dart' show tagPlaTheme;
import 'package:storage_repository/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
// import 'package:tag_play/core/services/shorebird_updater.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  await Firebase.initializeApp();

  runApp(const AppInitializer());
}

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AuthenticationRepository>(
      future: _initRepos(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }
        return App(authenticationRepository: snapshot.data!);
      },
    );
  }

  Future<AuthenticationRepository> _initRepos() async {
    final storageDataSourceImpl = StorageDataSourceImpl(
      firestore: FirebaseFirestore.instance,
      auth: FirebaseAuth.instance,
      storage: FirebaseStorage.instance,
    );

    final googleSignIn = GoogleSignIn.instance;
    await googleSignIn.initialize(
    clientId:
        '29525038810-ua7ba6vjsj78svufhli0qo6tf63g2oq5.apps.googleusercontent.com',
    serverClientId:
        '29525038810-7hfkvojpb1oetqn0cdc75pes1h860rn2.apps.googleusercontent.com',
    );

    return AuthenticationRepository(
      storageDataSource: storageDataSourceImpl,
      googleSignIn: googleSignIn,
    );
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = const AppBlocObserver();

//   await Firebase.initializeApp();
//   // ShorebirdUpdaterWrapper.checkAndInstallUpdates();

//   final storageDataSourceImpl = StorageDataSourceImpl(
//     firestore: FirebaseFirestore.instance,
//     auth: FirebaseAuth.instance,
//     storage: FirebaseStorage.instance,
//   );

//   final googleSignIn = GoogleSignIn.instance;

//   await googleSignIn.initialize(
//     clientId:
//         '29525038810-ua7ba6vjsj78svufhli0qo6tf63g2oq5.apps.googleusercontent.com',
//     serverClientId:
//         '29525038810-7hfkvojpb1oetqn0cdc75pes1h860rn2.apps.googleusercontent.com',
//   );

//   final authenticationRepository = AuthenticationRepository(
//     storageDataSource: storageDataSourceImpl,
//     googleSignIn: googleSignIn,
//   );

//   await authenticationRepository.user.first;

//   runApp(App(authenticationRepository: authenticationRepository));
// }

class App extends StatelessWidget {
  const App({super.key, required this.authenticationRepository});

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: authenticationRepository),
        RepositoryProvider<StorageRepositoryImpl>(
          create: (context) => StorageRepositoryImpl(
            storageDataSourceImpl: StorageDataSourceImpl(
              firestore: FirebaseFirestore.instance,
              auth: FirebaseAuth.instance,
              storage: FirebaseStorage.instance,
            ),
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) =>
            AppBloc(authenticationRepository: authenticationRepository)
              ..add(const AppUserSubscriptionRequested()),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isTablet = constraints.maxWidth > 600;
            bool isLandscape = constraints.maxWidth > constraints.maxHeight;

            Size designSize = isTablet
                ? (isLandscape
                      ? const Size(1240, 1024)
                      : const Size(1024, 1240))
                : (isLandscape ? const Size(812, 375) : const Size(375, 812));
            return ScreenUtilInit(
              splitScreenMode: true,
              minTextAdapt: true,
              designSize: designSize,
              child: MaterialApp(
                title: 'Tag Play',
                theme: tagPlaTheme,
                debugShowCheckedModeBanner: false,
                home: FlowBuilder<AppStatus>(
                  state: context.select((AppBloc bloc) => bloc.state.status),
                  onGeneratePages: onGenerateAppViewPages,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
