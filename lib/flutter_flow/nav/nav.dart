import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : OnBoardingScreen1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? NavBarPage()
              : OnBoardingScreen1Widget(),
        ),
        FFRoute(
          name: OnBoardingScreenWidget.routeName,
          path: OnBoardingScreenWidget.routePath,
          builder: (context, params) => OnBoardingScreenWidget(),
        ),
        FFRoute(
          name: LoginScreenWidget.routeName,
          path: LoginScreenWidget.routePath,
          builder: (context, params) => LoginScreenWidget(),
        ),
        FFRoute(
          name: SignUpScreenStep1Widget.routeName,
          path: SignUpScreenStep1Widget.routePath,
          builder: (context, params) => SignUpScreenStep1Widget(),
        ),
        FFRoute(
          name: DashboardWidget.routeName,
          path: DashboardWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'dashboard')
              : DashboardWidget(),
        ),
        FFRoute(
          name: SignUpScreenStep2Widget.routeName,
          path: SignUpScreenStep2Widget.routePath,
          builder: (context, params) => SignUpScreenStep2Widget(
            firstName: params.getParam(
              'firstName',
              ParamType.String,
            ),
            lastName: params.getParam(
              'lastName',
              ParamType.String,
            ),
            birthday: params.getParam(
              'birthday',
              ParamType.DateTime,
            ),
            gender: params.getParam(
              'gender',
              ParamType.String,
            ),
            phoneNum: params.getParam(
              'phoneNum',
              ParamType.String,
            ),
            houseNoStreet: params.getParam(
              'houseNoStreet',
              ParamType.String,
            ),
            barangay: params.getParam(
              'barangay',
              ParamType.String,
            ),
            agreed: params.getParam(
              'agreed',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ProfilePageWidget.routeName,
          path: ProfilePageWidget.routePath,
          builder: (context, params) => ProfilePageWidget(),
        ),
        FFRoute(
          name: MyAccountPageWidget.routeName,
          path: MyAccountPageWidget.routePath,
          builder: (context, params) => MyAccountPageWidget(),
        ),
        FFRoute(
          name: NotificationWidget.routeName,
          path: NotificationWidget.routePath,
          builder: (context, params) => NotificationWidget(),
        ),
        FFRoute(
          name: BlogspotWidget.routeName,
          path: BlogspotWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'blogspot')
              : BlogspotWidget(),
        ),
        FFRoute(
          name: SchedulesPageWidget.routeName,
          path: SchedulesPageWidget.routePath,
          builder: (context, params) => SchedulesPageWidget(),
        ),
        FFRoute(
          name: SchedViewingWidget.routeName,
          path: SchedViewingWidget.routePath,
          builder: (context, params) => SchedViewingWidget(),
        ),
        FFRoute(
          name: ManageAccPageWidget.routeName,
          path: ManageAccPageWidget.routePath,
          builder: (context, params) => ManageAccPageWidget(),
        ),
        FFRoute(
          name: AccDeletionPageWidget.routeName,
          path: AccDeletionPageWidget.routePath,
          builder: (context, params) => AccDeletionPageWidget(),
        ),
        FFRoute(
          name: OnBoardingScreen1Widget.routeName,
          path: OnBoardingScreen1Widget.routePath,
          builder: (context, params) => OnBoardingScreen1Widget(),
        ),
        FFRoute(
          name: OnBoardingScreen2Widget.routeName,
          path: OnBoardingScreen2Widget.routePath,
          builder: (context, params) => OnBoardingScreen2Widget(),
        ),
        FFRoute(
          name: OnBoardingScreen3Widget.routeName,
          path: OnBoardingScreen3Widget.routePath,
          builder: (context, params) => OnBoardingScreen3Widget(),
        ),
        FFRoute(
          name: ChangePasswordPageWidget.routeName,
          path: ChangePasswordPageWidget.routePath,
          builder: (context, params) => ChangePasswordPageWidget(),
        ),
        FFRoute(
          name: FileManagementWidget.routeName,
          path: FileManagementWidget.routePath,
          builder: (context, params) => FileManagementWidget(),
        ),
        FFRoute(
          name: ManageResidentPageWidget.routeName,
          path: ManageResidentPageWidget.routePath,
          builder: (context, params) => ManageResidentPageWidget(
            sortBy: params.getParam(
              'sortBy',
              ParamType.String,
            ),
            order: params.getParam(
              'order',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ViewUserPageWidget.routeName,
          path: ViewUserPageWidget.routePath,
          builder: (context, params) => ViewUserPageWidget(
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
            deleterID: params.getParam(
              'deleterID',
              ParamType.String,
            ),
            timeDeleted: params.getParam(
              'timeDeleted',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: DeletedResidentPageWidget.routeName,
          path: DeletedResidentPageWidget.routePath,
          builder: (context, params) => DeletedResidentPageWidget(),
        ),
        FFRoute(
          name: ManageAdminPageWidget.routeName,
          path: ManageAdminPageWidget.routePath,
          builder: (context, params) => ManageAdminPageWidget(),
        ),
        FFRoute(
          name: CreateNewAdminWidget.routeName,
          path: CreateNewAdminWidget.routePath,
          builder: (context, params) => CreateNewAdminWidget(),
        ),
        FFRoute(
          name: ViewAdminPageWidget.routeName,
          path: ViewAdminPageWidget.routePath,
          builder: (context, params) => ViewAdminPageWidget(
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
            deleterID: params.getParam(
              'deleterID',
              ParamType.String,
            ),
            timeDeleted: params.getParam(
              'timeDeleted',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: ArchivedAccountsWidget.routeName,
          path: ArchivedAccountsWidget.routePath,
          builder: (context, params) => ArchivedAccountsWidget(),
        ),
        FFRoute(
          name: RolesNPrivelegesPageWidget.routeName,
          path: RolesNPrivelegesPageWidget.routePath,
          builder: (context, params) => RolesNPrivelegesPageWidget(
            uid: params.getParam(
              'uid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ManageDriversPageWidget.routeName,
          path: ManageDriversPageWidget.routePath,
          builder: (context, params) => ManageDriversPageWidget(),
        ),
        FFRoute(
          name: InactiveAccountsWidget.routeName,
          path: InactiveAccountsWidget.routePath,
          builder: (context, params) => InactiveAccountsWidget(),
        ),
        FFRoute(
          name: ViewDriverPageWidget.routeName,
          path: ViewDriverPageWidget.routePath,
          builder: (context, params) => ViewDriverPageWidget(
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
            deleterID: params.getParam(
              'deleterID',
              ParamType.String,
            ),
            timeDeleted: params.getParam(
              'timeDeleted',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: AddNewDriverWidget.routeName,
          path: AddNewDriverWidget.routePath,
          builder: (context, params) => AddNewDriverWidget(),
        ),
        FFRoute(
          name: CollectionRecordsWidget.routeName,
          path: CollectionRecordsWidget.routePath,
          builder: (context, params) => CollectionRecordsWidget(
            uID: params.getParam(
              'uID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ManageTrucksPageWidget.routeName,
          path: ManageTrucksPageWidget.routePath,
          builder: (context, params) => ManageTrucksPageWidget(),
        ),
        FFRoute(
          name: ArchivedTrucksWidget.routeName,
          path: ArchivedTrucksWidget.routePath,
          builder: (context, params) => ArchivedTrucksWidget(),
        ),
        FFRoute(
          name: ManageJunkshopPageWidget.routeName,
          path: ManageJunkshopPageWidget.routePath,
          builder: (context, params) => ManageJunkshopPageWidget(),
        ),
        FFRoute(
          name: AddNewJunkshopWidget.routeName,
          path: AddNewJunkshopWidget.routePath,
          builder: (context, params) => AddNewJunkshopWidget(),
        ),
        FFRoute(
          name: ViewJunkshopPageWidget.routeName,
          path: ViewJunkshopPageWidget.routePath,
          builder: (context, params) => ViewJunkshopPageWidget(
            junkshopID: params.getParam(
              'junkshopID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
            deleterID: params.getParam(
              'deleterID',
              ParamType.String,
            ),
            timeDeleted: params.getParam(
              'timeDeleted',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: DeactivatedJunkshopPageWidget.routeName,
          path: DeactivatedJunkshopPageWidget.routePath,
          builder: (context, params) => DeactivatedJunkshopPageWidget(),
        ),
        FFRoute(
          name: ServiceInformationWidget.routeName,
          path: ServiceInformationWidget.routePath,
          builder: (context, params) => ServiceInformationWidget(),
        ),
        FFRoute(
          name: AcceptedJunkPageWidget.routeName,
          path: AcceptedJunkPageWidget.routePath,
          builder: (context, params) => AcceptedJunkPageWidget(
            type: params.getParam(
              'type',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ManageStaffPageWidget.routeName,
          path: ManageStaffPageWidget.routePath,
          builder: (context, params) => ManageStaffPageWidget(
            junkshopReference: params.getParam(
              'junkshopReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: ViewStaffPageWidget.routeName,
          path: ViewStaffPageWidget.routePath,
          builder: (context, params) => ViewStaffPageWidget(
            staffID: params.getParam(
              'staffID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['user'],
            ),
            junkshopReference: params.getParam(
              'junkshopReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: FormerStaffPageWidget.routeName,
          path: FormerStaffPageWidget.routePath,
          builder: (context, params) => FormerStaffPageWidget(
            junkshopReference: params.getParam(
              'junkshopReference',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: JunkshopsWidget.routeName,
          path: JunkshopsWidget.routePath,
          builder: (context, params) => JunkshopsWidget(
            fromAppointment: params.getParam(
              'fromAppointment',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ViewJunkshopWidget.routeName,
          path: ViewJunkshopWidget.routePath,
          builder: (context, params) => ViewJunkshopWidget(
            junkshopID: params.getParam(
              'junkshopID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: JunkshopAppointmentWidget.routeName,
          path: JunkshopAppointmentWidget.routePath,
          builder: (context, params) => JunkshopAppointmentWidget(
            junkshopID: params.getParam(
              'junkshopID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: BlogspotDraftWidget.routeName,
          path: BlogspotDraftWidget.routePath,
          builder: (context, params) => BlogspotDraftWidget(),
        ),
        FFRoute(
          name: PinLocationWidget.routeName,
          path: PinLocationWidget.routePath,
          builder: (context, params) => PinLocationWidget(
            junkshopID: params.getParam(
              'junkshopID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: WasteTypePageWidget.routeName,
          path: WasteTypePageWidget.routePath,
          builder: (context, params) => WasteTypePageWidget(),
        ),
        FFRoute(
          name: EditRegShedWidget.routeName,
          path: EditRegShedWidget.routePath,
          builder: (context, params) => EditRegShedWidget(),
        ),
        FFRoute(
          name: WasteSegregationReportsWidget.routeName,
          path: WasteSegregationReportsWidget.routePath,
          builder: (context, params) => WasteSegregationReportsWidget(),
        ),
        FFRoute(
          name: ReportsLogWidget.routeName,
          path: ReportsLogWidget.routePath,
          builder: (context, params) => ReportsLogWidget(),
        ),
        FFRoute(
          name: ManageBookingsWidget.routeName,
          path: ManageBookingsWidget.routePath,
          builder: (context, params) => ManageBookingsWidget(
            junkshopID: params.getParam(
              'junkshopID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: MyAppointmentWidget.routeName,
          path: MyAppointmentWidget.routePath,
          builder: (context, params) => MyAppointmentWidget(
            appointmentRef: params.getParam(
              'appointmentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop_appointments'],
            ),
          ),
        ),
        FFRoute(
          name: CancelledBookingsWidget.routeName,
          path: CancelledBookingsWidget.routePath,
          builder: (context, params) => CancelledBookingsWidget(
            junkshopID: params.getParam(
              'junkshopID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: PaymentPageWidget.routeName,
          path: PaymentPageWidget.routePath,
          builder: (context, params) => PaymentPageWidget(
            appointmentRef: params.getParam(
              'appointmentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop_appointments'],
            ),
          ),
        ),
        FFRoute(
          name: QuantifyingPageWidget.routeName,
          path: QuantifyingPageWidget.routePath,
          builder: (context, params) => QuantifyingPageWidget(
            appointmentRef: params.getParam(
              'appointmentRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop_appointments'],
            ),
          ),
        ),
        FFRoute(
          name: CompletedBookingsWidget.routeName,
          path: CompletedBookingsWidget.routePath,
          builder: (context, params) => CompletedBookingsWidget(),
        ),
        FFRoute(
          name: GoogleMapPageWidget.routeName,
          path: GoogleMapPageWidget.routePath,
          builder: (context, params) => GoogleMapPageWidget(
            junkshopID: params.getParam(
              'junkshopID',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['junkshop'],
            ),
          ),
        ),
        FFRoute(
          name: ReportsPageWidget.routeName,
          path: ReportsPageWidget.routePath,
          builder: (context, params) => ReportsPageWidget(),
        ),
        FFRoute(
          name: TransacationsWidget.routeName,
          path: TransacationsWidget.routePath,
          builder: (context, params) => TransacationsWidget(),
        ),
        FFRoute(
          name: AccountVerificationPageWidget.routeName,
          path: AccountVerificationPageWidget.routePath,
          builder: (context, params) => AccountVerificationPageWidget(),
        ),
        FFRoute(
          name: ManageVerificationWidget.routeName,
          path: ManageVerificationWidget.routePath,
          builder: (context, params) => ManageVerificationWidget(
            sortBy: params.getParam(
              'sortBy',
              ParamType.String,
            ),
            order: params.getParam(
              'order',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VerificationPageWidget.routeName,
          path: VerificationPageWidget.routePath,
          builder: (context, params) => VerificationPageWidget(
            userID: params.getParam(
              'userID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VerificationHistoryWidget.routeName,
          path: VerificationHistoryWidget.routePath,
          builder: (context, params) => VerificationHistoryWidget(),
        ),
        FFRoute(
          name: CreatPostPageWidget.routeName,
          path: CreatPostPageWidget.routePath,
          builder: (context, params) => CreatPostPageWidget(
            postRef: params.getParam(
              'postRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['blogspot'],
            ),
            title: params.getParam(
              'title',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            photoURL: params.getParam(
              'photoURL',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ViewPostWidget.routeName,
          path: ViewPostWidget.routePath,
          builder: (context, params) => ViewPostWidget(
            postRef: params.getParam(
              'postRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['blogspot'],
            ),
          ),
        ),
        FFRoute(
          name: ResEcoReportsWidget.routeName,
          path: ResEcoReportsWidget.routePath,
          builder: (context, params) => ResEcoReportsWidget(),
        ),
        FFRoute(
          name: ResReportsHistoryWidget.routeName,
          path: ResReportsHistoryWidget.routePath,
          builder: (context, params) => ResReportsHistoryWidget(),
        ),
        FFRoute(
          name: AdmEcoReportsWidget.routeName,
          path: AdmEcoReportsWidget.routePath,
          builder: (context, params) => AdmEcoReportsWidget(),
        ),
        FFRoute(
          name: AdmConcernTypesWidget.routeName,
          path: AdmConcernTypesWidget.routePath,
          builder: (context, params) => AdmConcernTypesWidget(),
        ),
        FFRoute(
          name: AdmFalseReportsWidget.routeName,
          path: AdmFalseReportsWidget.routePath,
          builder: (context, params) => AdmFalseReportsWidget(),
        ),
        FFRoute(
          name: AdmViewReportDetailsWidget.routeName,
          path: AdmViewReportDetailsWidget.routePath,
          builder: (context, params) => AdmViewReportDetailsWidget(
            reportRef: params.getParam(
              'reportRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['incident_reports'],
            ),
            fromTheSender: params.getParam(
              'fromTheSender',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: LeaderboardWidget.routeName,
          path: LeaderboardWidget.routePath,
          builder: (context, params) => LeaderboardWidget(),
        ),
        FFRoute(
          name: AllAnnouncementsWidget.routeName,
          path: AllAnnouncementsWidget.routePath,
          builder: (context, params) => AllAnnouncementsWidget(),
        ),
        FFRoute(
          name: ContactUsWidget.routeName,
          path: ContactUsWidget.routePath,
          builder: (context, params) => ContactUsWidget(),
        ),
        FFRoute(
          name: TermsAndConditionsWidget.routeName,
          path: TermsAndConditionsWidget.routePath,
          builder: (context, params) => TermsAndConditionsWidget(),
        ),
        FFRoute(
          name: AboutPageWidget.routeName,
          path: AboutPageWidget.routePath,
          builder: (context, params) => AboutPageWidget(),
        ),
        FFRoute(
          name: PdfWidget.routeName,
          path: PdfWidget.routePath,
          builder: (context, params) => PdfWidget(),
        ),
        FFRoute(
          name: CollectionHistoryWidget.routeName,
          path: CollectionHistoryWidget.routePath,
          builder: (context, params) => CollectionHistoryWidget(),
        ),
        FFRoute(
          name: AiRecyclablesWidget.routeName,
          path: AiRecyclablesWidget.routePath,
          builder: (context, params) => AiRecyclablesWidget(),
        ),
        FFRoute(
          name: AuctionMainPageWidget.routeName,
          path: AuctionMainPageWidget.routePath,
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'AuctionMainPage')
              : AuctionMainPageWidget(),
        ),
        FFRoute(
          name: ResPostAuctionWidget.routeName,
          path: ResPostAuctionWidget.routePath,
          builder: (context, params) => ResPostAuctionWidget(),
        ),
        FFRoute(
          name: BlogspotAIWidget.routeName,
          path: BlogspotAIWidget.routePath,
          builder: (context, params) => BlogspotAIWidget(),
        ),
        FFRoute(
          name: ResTransactionWidget.routeName,
          path: ResTransactionWidget.routePath,
          builder: (context, params) => ResTransactionWidget(),
        ),
        FFRoute(
          name: JSTransactionsWidget.routeName,
          path: JSTransactionsWidget.routePath,
          builder: (context, params) => JSTransactionsWidget(),
        ),
        FFRoute(
          name: JSViewPayablesCompletedWidget.routeName,
          path: JSViewPayablesCompletedWidget.routePath,
          asyncParams: {
            'lotRef': getDoc(['auction'], AuctionRecord.fromSnapshot),
          },
          builder: (context, params) => JSViewPayablesCompletedWidget(
            lotRef: params.getParam(
              'lotRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ResAuctionHistoryWidget.routeName,
          path: ResAuctionHistoryWidget.routePath,
          builder: (context, params) => ResAuctionHistoryWidget(),
        ),
        FFRoute(
          name: ResAuctionPostWidget.routeName,
          path: ResAuctionPostWidget.routePath,
          builder: (context, params) => ResAuctionPostWidget(
            auctionPostRef: params.getParam(
              'auctionPostRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['auction'],
            ),
          ),
        ),
        FFRoute(
          name: JSFindPostWidget.routeName,
          path: JSFindPostWidget.routePath,
          builder: (context, params) => JSFindPostWidget(),
        ),
        FFRoute(
          name: WasteSegregatorDashboardSAWidget.routeName,
          path: WasteSegregatorDashboardSAWidget.routePath,
          builder: (context, params) => WasteSegregatorDashboardSAWidget(),
        ),
        FFRoute(
          name: WasteSegregatorDashboardBAWidget.routeName,
          path: WasteSegregatorDashboardBAWidget.routePath,
          builder: (context, params) => WasteSegregatorDashboardBAWidget(),
        ),
        FFRoute(
          name: LogsWidget.routeName,
          path: LogsWidget.routePath,
          builder: (context, params) => LogsWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
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
    StructBuilder<T>? structBuilder,
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
      structBuilder: structBuilder,
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
            return '/onBoardingScreen1';
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
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Screenshot_2024-04-30_133508.png',
                    fit: BoxFit.cover,
                  ),
                )
              : PushNotificationsHandler(child: page);

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

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
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
