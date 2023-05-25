import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '/backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? HomePageWidget() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomePageWidget() : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              requireAuth: true,
              builder: (context, params) => HomePageWidget(
                providerList: params.getParam('providerList',
                    ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'inkonzo_onboarding_dark',
              path: 'inkonzoOnboarding_dark',
              requireAuth: true,
              builder: (context, params) => InkonzoOnboardingDarkWidget(),
            ),
            FFRoute(
              name: 'search_results',
              path: 'searchResults',
              requireAuth: true,
              builder: (context, params) => SearchResultsWidget(
                searchQuery: params.getParam('searchQuery', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'login_page',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'sign_up',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(),
            ),
            FFRoute(
              name: 'chat_page',
              path: 'chatPage',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
              },
              builder: (context, params) => ChatPageWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, false, ['chats']),
              ),
            ),
            FFRoute(
              name: 'all_chats',
              path: 'allChats',
              requireAuth: true,
              builder: (context, params) => AllChatsWidget(),
            ),
            FFRoute(
              name: 'settings',
              path: 'settings',
              requireAuth: true,
              builder: (context, params) => SettingsWidget(),
            ),
            FFRoute(
              name: 'ProviderDetail',
              path: 'providerDetail',
              requireAuth: true,
              builder: (context, params) => ProviderDetailWidget(
                userRef: params.getParam('userRef', ParamType.DocumentReference,
                    false, ['ProviderDocuments']),
                iDRef: params.getParam(
                    'iDRef', ParamType.DocumentReference, false, ['users']),
              ),
            ),
            FFRoute(
              name: 'UserSettings',
              path: 'userSettings',
              requireAuth: true,
              builder: (context, params) => UserSettingsWidget(),
            ),
            FFRoute(
              name: 'BookingPage',
              path: 'bookingPage',
              requireAuth: true,
              builder: (context, params) => BookingPageWidget(
                providerRef: params.getParam('providerRef',
                    ParamType.DocumentReference, false, ['ProviderDocuments']),
                bookingFee: params.getParam('bookingFee', ParamType.double),
              ),
            ),
            FFRoute(
              name: 'EditUserDetails',
              path: 'editUserDetails',
              requireAuth: true,
              builder: (context, params) => EditUserDetailsWidget(),
            ),
            FFRoute(
              name: 'app_rating',
              path: 'appRating',
              requireAuth: true,
              builder: (context, params) => AppRatingWidget(),
            ),
            FFRoute(
              name: 'providerDashboard',
              path: 'providerDashboard',
              requireAuth: true,
              builder: (context, params) => ProviderDashboardWidget(),
            ),
            FFRoute(
              name: 'serviceTrackingList',
              path: 'serviceTrackingList',
              requireAuth: true,
              builder: (context, params) => ServiceTrackingListWidget(),
            ),
            FFRoute(
              name: 'providerReviewPage',
              path: 'providerReviewPage',
              requireAuth: true,
              builder: (context, params) => ProviderReviewPageWidget(
                clientRef: params.getParam('clientRef',
                    ParamType.DocumentReference, false, ['ProviderDocuments']),
              ),
            ),
            FFRoute(
              name: 'BookingPageCopy',
              path: 'bookingPageCopy',
              requireAuth: true,
              builder: (context, params) => BookingPageCopyWidget(
                totalAmount: params.getParam('totalAmount', ParamType.double),
                providerName: params.getParam('providerName', ParamType.String),
                providerImage:
                    params.getParam('providerImage', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'trackingDetail',
              path: 'trackingDetail',
              requireAuth: true,
              builder: (context, params) => TrackingDetailWidget(
                booking: params.getParam('booking', ParamType.DocumentReference,
                    false, ['users', 'bookings']),
              ),
            ),
            FFRoute(
              name: 'CreateDetail',
              path: 'createDetail',
              requireAuth: true,
              builder: (context, params) => CreateDetailWidget(
                imgURL: params.getParam('imgURL', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'readDetail',
              path: 'readDetail',
              requireAuth: true,
              builder: (context, params) => ReadDetailWidget(),
            ),
            FFRoute(
              name: 'UpdateDetail',
              path: 'updateDetail',
              requireAuth: true,
              builder: (context, params) => UpdateDetailWidget(
                image: params.getParam('image', ParamType.String),
                header: params.getParam('header', ParamType.String),
                body: params.getParam('body', ParamType.String),
                aboutReference: params.getParam(
                    'aboutReference',
                    ParamType.DocumentReference,
                    false,
                    ['ProviderDocuments', 'aboutSection']),
              ),
            ),
            FFRoute(
              name: 'providerDashboardCopy',
              path: 'providerDashboardCopy',
              requireAuth: true,
              builder: (context, params) => ProviderDashboardCopyWidget(),
            ),
            FFRoute(
              name: 'verifyOTP',
              path: 'verifyOTP',
              builder: (context, params) => VerifyOTPWidget(),
            ),
            FFRoute(
              name: 'inkonzo_onboarding_lite',
              path: 'inkonzoOnboardingLite',
              builder: (context, params) => InkonzoOnboardingLiteWidget(),
            ),
            FFRoute(
              name: 'TsAndCs',
              path: 'tsAndCs',
              requireAuth: true,
              builder: (context, params) => TsAndCsWidget(),
            ),
            FFRoute(
              name: 'splash_screen',
              path: 'splashScreen',
              requireAuth: true,
              builder: (context, params) => SplashScreenWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/services_screen.png',
                    fit: BoxFit.fill,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
