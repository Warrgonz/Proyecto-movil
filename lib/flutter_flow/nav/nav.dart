import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

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
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const AppWidget() : const LoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const AppWidget() : const LoginWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'App',
          path: '/app',
          builder: (context, params) => const AppWidget(),
        ),
        FFRoute(
          name: 'Chat_Detalles',
          path: '/chatDetalles',
          asyncParams: {
            'chatref': getDoc(['Chat'], ChatRecord.fromSnapshot),
          },
          builder: (context, params) => ChatDetallesWidget(
            chatref: params.getParam(
              'chatref',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Chat_Main',
          path: '/chatMain',
          builder: (context, params) => const ChatMainWidget(),
        ),
        FFRoute(
          name: 'DetallesImagen',
          path: '/detallesImagen',
          asyncParams: {
            'mensajeChat': getDoc(['mensajes'], MensajesRecord.fromSnapshot),
          },
          builder: (context, params) => DetallesImagenWidget(
            mensajeChat: params.getParam(
              'mensajeChat',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'BandejaEntrada',
          path: '/bandejaEntrada',
          asyncParams: {
            'chatRef': getDoc(['Chat'], ChatRecord.fromSnapshot),
          },
          builder: (context, params) => BandejaEntradaWidget(
            chatRef: params.getParam(
              'chatRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Listacursosadmin',
          path: '/listacursosadmin',
          builder: (context, params) => const ListacursosadminWidget(),
        ),
        FFRoute(
          name: 'EditarCursoadmin',
          path: '/editarCursoadmin',
          builder: (context, params) => EditarCursoadminWidget(
            cursoRef: params.getParam(
              'cursoRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Curso'],
            ),
          ),
        ),
        FFRoute(
          name: 'AgregarContenido',
          path: '/agregarContenido',
          builder: (context, params) => AgregarContenidoWidget(
            courseRef: params.getParam(
              'courseRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Curso'],
            ),
          ),
        ),
        FFRoute(
          name: 'Anuncios',
          path: '/anuncios',
          builder: (context, params) => const AnunciosWidget(),
        ),
        FFRoute(
          name: 'NuevoAnuncioParroquial',
          path: '/nuevoAnuncioParroquial',
          builder: (context, params) => const NuevoAnuncioParroquialWidget(),
        ),
        FFRoute(
          name: 'CrearCuenta',
          path: '/crearCuenta',
          builder: (context, params) => const CrearCuentaWidget(),
        ),
        FFRoute(
          name: 'Grupos',
          path: '/grupos',
          builder: (context, params) => const GruposWidget(),
        ),
        FFRoute(
          name: 'CrearGrupo',
          path: '/crearGrupo',
          builder: (context, params) => const CrearGrupoWidget(),
        ),
        FFRoute(
          name: 'ContenidodecursoAlumno',
          path: '/contenidodecursoAlumno',
          builder: (context, params) => const ContenidodecursoAlumnoWidget(),
        ),
        FFRoute(
          name: 'Usuarios',
          path: '/usuarios',
          builder: (context, params) => const UsuariosWidget(),
        ),
        FFRoute(
          name: 'listacursosalumno',
          path: '/listacursosalumno',
          builder: (context, params) => const ListacursosalumnoWidget(),
        ),
        FFRoute(
          name: 'DetallesGrupo',
          path: '/detallesGrupo',
          builder: (context, params) => DetallesGrupoWidget(
            nombreGrupoParametro: params.getParam(
              'nombreGrupoParametro',
              ParamType.String,
            ),
            descripcionParametro: params.getParam(
              'descripcionParametro',
              ParamType.String,
            ),
            diaParametro: params.getParam(
              'diaParametro',
              ParamType.String,
            ),
            horaParametro: params.getParam(
              'horaParametro',
              ParamType.String,
            ),
            miembrosParametro: params.getParam<DocumentReference>(
              'miembrosParametro',
              ParamType.DocumentReference,
              isList: true,
              collectionNamePath: ['users'],
            ),
            urlPhotoGrupoParametro: params.getParam(
              'urlPhotoGrupoParametro',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'OlvidarContrasena',
          path: '/olvidarContrasena',
          builder: (context, params) => const OlvidarContrasenaWidget(),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'EditUser',
          path: '/editUser',
          builder: (context, params) => EditUserWidget(
            imgParam: params.getParam(
              'imgParam',
              ParamType.String,
            ),
            correoParam: params.getParam(
              'correoParam',
              ParamType.String,
            ),
            nameParam: params.getParam(
              'nameParam',
              ParamType.String,
            ),
            telefonoParam: params.getParam(
              'telefonoParam',
              ParamType.String,
            ),
            seleccionadoParam: params.getParam(
              'seleccionadoParam',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
            rolParam: params.getParam(
              'rolParam',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ModuloEnConstruccion',
          path: '/moduloEnConstruccion',
          builder: (context, params) => const ModuloEnConstruccionWidget(),
        ),
        FFRoute(
          name: 'CrearCursoadmin',
          path: '/crearCursoadmin',
          builder: (context, params) => const CrearCursoadminWidget(),
        ),
        FFRoute(
          name: 'EditarGrupo',
          path: '/editarGrupo',
          builder: (context, params) => EditarGrupoWidget(
            nombreParam: params.getParam(
              'nombreParam',
              ParamType.String,
            ),
            descripcionParam: params.getParam(
              'descripcionParam',
              ParamType.String,
            ),
            diaParam: params.getParam(
              'diaParam',
              ParamType.String,
            ),
            horaParam: params.getParam(
              'horaParam',
              ParamType.String,
            ),
            urlPhotoGrupoParam: params.getParam(
              'urlPhotoGrupoParam',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'AgregarMiembrosGrupo',
          path: '/agregarMiembrosGrupo',
          builder: (context, params) => const AgregarMiembrosGrupoWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
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
      (state.allParams.length == 1 &&
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
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
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
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
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
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
