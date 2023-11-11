// import 'package:get_it/get_it.dart';

// class DepInj {
//   DepInj._();

//   static final locator = GetIt.instance;

//   static Future<void> setup() async {
//     // REGISTER Auth FEATURE
//     _setupAuthFeature();

//     // REGISTER Conversations FEATURE
//     _setupConversationsFeature();

//     // REGISTER EXTERNAL DEPENDENCIES
//     await _setupExternals();
//   }

//   static void _setupAuthFeature() {
//     locator.registerFactory(() => AuthCubit(authRepository: locator()));
//     locator.registerFactory(() => LoginCubit(authRepository: locator()));

//     locator.registerLazySingleton<AuthRepository>(
//       () => AuthRepositoryImpl(
//         networkInfo: locator(),
//         authRemoteDS: locator(),
//         authLocalDS: locator(),
//       ),
//     );

//     locator.registerLazySingleton<AuthRemoteDS>(
//       () => AuthRemoteDSImpl(
//         networkService: locator(),
//       ),
//     );
//     locator.registerLazySingleton<AuthLocalDS>(
//       () => AuthLocalDSImpl(hiveService: locator()),
//     );
//   }

//   static void _setupConversationsFeature() {
//     locator.registerFactory(() => ConversationCubit(
//           repository: locator(),
//           messagesCubit: locator(),
//         ));
//     locator.registerFactory(() => ConversationsCubit(repository: locator()));
//     locator.registerFactory(() => MessagesCubit(messageRepository: locator()));
//     locator.registerFactory(() => MessageCubit(messageRepository: locator()));

//     locator.registerLazySingleton<ConversationRepository>(
//       () => ConversationRepositoryImpl(
//         networkInfo: locator(),
//         remoteDataSource: locator(),
//       ),
//     );
//     locator.registerLazySingleton<MessageRepository>(
//       () => MessageRepositoryImpl(
//         networkInfo: locator(),
//         remoteDataSource: locator(),
//       ),
//     );
//     locator.registerLazySingleton<ConversationRemoteDataSource>(
//       () => ConversationRemoteDataSourceImpl(
//           socketService: locator(), networkService: locator()),
//     );
//     locator.registerLazySingleton<MessageRemoteDS>(
//       () => MessageRemoteDSImpl(
//         socketService: locator(),
//         networkService: locator(),
//       ),
//     );
//   }

//   static Future<void> _setupExternals() async {
//     locator.registerLazySingleton<NetworkService>(() => NetworkServiceImpl());
//     locator.registerLazySingleton<SocketService>(() => SocketServiceImpl());
//     locator.registerLazySingleton<NetworkInfo>(
//       () => NetworkInfoImpl(connectionChecker: InternetConnectionChecker()),
//     );

//     await HiveService.init();
//     locator.registerLazySingleton(() => HiveService());
//   }
// }
