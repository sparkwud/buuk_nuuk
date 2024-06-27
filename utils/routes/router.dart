// import 'package:go_router/go_router.dart';
// import 'package:golly_express_v2/core/routes/app_routes.dart';
// import 'package:golly_express_v2/core/shared_prefs.dart';
// import 'package:golly_express_v2/features/account/presentation/screens/account_screen.dart';
// import 'package:golly_express_v2/features/account/presentation/screens/address_settings_screen.dart';
// import 'package:golly_express_v2/features/account/presentation/screens/change_password_screen.dart';
// import 'package:golly_express_v2/features/account/presentation/screens/notification_settings_screen.dart';
// import 'package:golly_express_v2/features/account/presentation/screens/order_settings_screen.dart';
// import 'package:golly_express_v2/features/account/presentation/screens/profile_screen.dart';
// import 'package:golly_express_v2/features/auth/domain/otp_request.dart';
// import 'package:golly_express_v2/features/auth/presentation/screens/auth_screen.dart';
// import 'package:golly_express_v2/features/auth/presentation/screens/forgot_password_screen.dart';
// import 'package:golly_express_v2/features/auth/presentation/screens/otp_verification_screen.dart';
// import 'package:golly_express_v2/features/auth/presentation/screens/reset_password_screen.dart';
// import 'package:golly_express_v2/features/auth/presentation/screens/sign_in_screen.dart';
// import 'package:golly_express_v2/features/auth/presentation/screens/sign_up_screen.dart';
// import 'package:golly_express_v2/features/create_shipment/presentation/screens/create_shipment_screen.dart';
// import 'package:golly_express_v2/features/create_shipment/presentation/screens/general_shipment_screen.dart';
// import 'package:golly_express_v2/features/create_shipment/presentation/screens/tracking_information_screen.dart';
// import 'package:golly_express_v2/features/history/domain/package_model.dart';
// import 'package:golly_express_v2/features/history/presentation/screens/history_screen.dart';
// import 'package:golly_express_v2/features/history/presentation/screens/order_details_screen.dart';
// import 'package:golly_express_v2/features/home/presentation/screens/home_screen.dart';
// import 'package:golly_express_v2/features/home/presentation/screens/main_container.dart';
// import 'package:golly_express_v2/features/notifications/presentation/screens/notifications_screen.dart';
// import 'package:golly_express_v2/features/onboarding/presentation/screens/onboarding_screen.dart';
// import 'package:golly_express_v2/main.dart';

// import '../../../features/auth/presentation/provider/auth_provider.dart';
// import 'app_routes.dart';

// // int  lastLoginTime =  getLoginTime() as int ;
// // final currentTime = DateTime.now().millisecondsSinceEpoch;
// // final diffInHours = (currentTime - lastLoginTime) ~/ (1000 * 60 * 60);

// final GoRouter appRouter = GoRouter(
//   initialLocation:
//       // isOnboarded == null ? AppRoutes.onboarding : AppRoutes.mainContainer,
//       isUserLoggedIn ? AppRoutes.mainContainer : AppRoutes.onboarding,
//   routes: <RouteBase>[
//     // ONBOARDING ROUTES
//     GoRoute(
//       path: AppRoutes.onboarding,
//       builder: (context, state) => const OnboardingScreen(),
//     ),

//     // AUTH ROUTES
//     GoRoute(
//       path: AppRoutes.auth,
//       builder: (context, state) => const AuthScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.signin,
//       builder: (context, state) => const SignInScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.signup,
//       builder: (context, state) => const SignUpScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.verifyOtp,
//       builder: (context, state) => OtpVerificationScreen(
//         successDialogTitle: "Registration Successful",
//         successDialogMessage:
//             "Congratulations! \nyour account has been created.",
//         // token: state.extra as String,
//         phoneNumber: state.extra as String,
//         onOtpSubmitted: (ref, otp) async {
//           final token = await getToken();

//           OtpRequest requestBody = OtpRequest(
//             otp: otp,
//             token: token!,
//           );

//           ref
//               .read(verifyOtpControllerProvider.notifier)
//               .verifySignUpOtp(requestBody: requestBody);
//         },
//         onOtpVerified: () async {
//           await setIsLoggedIn(true);
//           if (context.mounted) {
//             context.go(AppRoutes.mainContainer);
//           }
//         },
//       ),
//     ),

//     GoRoute(
//       path: AppRoutes.forgotPassword,
//       builder: (context, state) => const ForgotPasswordScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.forgotPasswordVerifyOtp,
//       builder: (context, state) => OtpVerificationScreen(
//         // token: state.extra as String,
//         phoneNumber: state.extra as String,
//         onOtpSubmitted: (ref, otp) async {
//           final token = await getToken();

//           OtpRequest requestBody = OtpRequest(
//             otp: otp,
//             token: token!,
//           );

//           ref
//               .read(verifyOtpControllerProvider.notifier)
//               .forgotPasswordVerifyOtp(requestBody: requestBody);
//         },
//         onOtpVerified: () => context.push(AppRoutes.resetPassword),
//       ),
//     ),

//     GoRoute(
//       path: AppRoutes.resetPassword,
//       builder: (context, state) => const ResetPasswordScreen(),
//     ),

//     // BOTTOM NAV NAR ROUTES
//     GoRoute(
//       path: AppRoutes.mainContainer,
//       builder: (context, state) => const MainContainer(),
//     ),

//     GoRoute(
//       path: AppRoutes.home,
//       builder: (context, state) => const HomeScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.notifications,
//       builder: (context, state) => const NotificationsScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.history,
//       builder: (context, state) => const HistoryScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.orderDetails,
//       builder: (context, state) {
//         Package package = state.extra as Package;
//         return OrderDetailsScreen(package: package);
//       },
//     ),

//     // SETTINGS ROUTES
//     GoRoute(
//       path: AppRoutes.account,
//       builder: (context, state) => const AccountScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.profile,
//       builder: (context, state) => const ProfileScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.notificationSettings,
//       builder: (context, state) => const NotificationSettingsScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.addressSettings,
//       builder: (context, state) => const AddressSettingsScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.orderSettings,
//       builder: (context, state) => const OrderSettingsScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.changePassword,
//       builder: (context, state) => const ChangePasswordScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.forgotPassword,
//       builder: (context, state) => const ForgotPasswordScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.resetPassword,
//       builder: (context, state) => const ResetPasswordScreen(),
//     ),

//     // BOTTOM NAV NAR ROUTES
//     GoRoute(
//       path: AppRoutes.mainContainer,
//       builder: (context, state) => const MainContainer(),
//     ),

//     GoRoute(
//       path: AppRoutes.home,
//       builder: (context, state) => const HomeScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.notifications,
//       builder: (context, state) => const NotificationsScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.history,
//       builder: (context, state) => const CreateShipmentScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.orderDetails,
//       builder: (context, state) {
//         Package package = state.extra as Package;
//         return OrderDetailsScreen(package: package);
//       },
//     ),

//     // CREATE SHIPMENT ROUTES
//     GoRoute(
//       path: AppRoutes.createShipment,
//       builder: (context, state) => const CreateShipmentScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.trackingInformation,
//       builder: (context, state) => const TrackingInformationScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.generalShipment,
//       builder: (context, state) => const GeneralShipmentScreen(),
//     ),

//     GoRoute(
//       path: AppRoutes.account,
//       builder: (context, state) => const AccountScreen(),
//     ),
//   ],
// );
