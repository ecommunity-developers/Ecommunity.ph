import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Screenshot_2024-04-30_133508.png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'OnBoardingScreen': ParameterData.none(),
  'LoginScreen': ParameterData.none(),
  'SignUpScreenStep1': ParameterData.none(),
  'dashboard': ParameterData.none(),
  'SignUpScreenStep2': (data) async => ParameterData(
        allParams: {
          'firstName': getParameter<String>(data, 'firstName'),
          'lastName': getParameter<String>(data, 'lastName'),
          'birthday': getParameter<DateTime>(data, 'birthday'),
          'gender': getParameter<String>(data, 'gender'),
          'phoneNum': getParameter<String>(data, 'phoneNum'),
          'houseNoStreet': getParameter<String>(data, 'houseNoStreet'),
          'barangay': getParameter<String>(data, 'barangay'),
          'agreed': getParameter<bool>(data, 'agreed'),
        },
      ),
  'profilePage': ParameterData.none(),
  'myAccountPage': ParameterData.none(),
  'notification': ParameterData.none(),
  'blogspot': ParameterData.none(),
  'schedulesPage': ParameterData.none(),
  'schedViewing': ParameterData.none(),
  'manageAccPage': ParameterData.none(),
  'accDeletionPage': ParameterData.none(),
  'OnBoardingScreen1': ParameterData.none(),
  'OnBoardingScreen2': ParameterData.none(),
  'OnBoardingScreen3': ParameterData.none(),
  'changePasswordPage': ParameterData.none(),
  'fileManagement': ParameterData.none(),
  'manageResidentPage': (data) async => ParameterData(
        allParams: {
          'sortBy': getParameter<String>(data, 'sortBy'),
          'order': getParameter<String>(data, 'order'),
        },
      ),
  'viewUserPage': (data) async => ParameterData(
        allParams: {
          'userID': getParameter<String>(data, 'userID'),
          'deleterID': getParameter<String>(data, 'deleterID'),
          'timeDeleted': getParameter<DateTime>(data, 'timeDeleted'),
        },
      ),
  'deletedResidentPage': ParameterData.none(),
  'manageAdminPage': ParameterData.none(),
  'createNewAdmin': ParameterData.none(),
  'viewAdminPage': (data) async => ParameterData(
        allParams: {
          'userID': getParameter<String>(data, 'userID'),
          'deleterID': getParameter<String>(data, 'deleterID'),
          'timeDeleted': getParameter<DateTime>(data, 'timeDeleted'),
        },
      ),
  'archivedAccounts': ParameterData.none(),
  'rolesNPrivelegesPage': (data) async => ParameterData(
        allParams: {
          'uid': getParameter<String>(data, 'uid'),
        },
      ),
  'manageDriversPage': ParameterData.none(),
  'inactiveAccounts': ParameterData.none(),
  'viewDriverPage': (data) async => ParameterData(
        allParams: {
          'userID': getParameter<String>(data, 'userID'),
          'deleterID': getParameter<String>(data, 'deleterID'),
          'timeDeleted': getParameter<DateTime>(data, 'timeDeleted'),
        },
      ),
  'addNewDriver': ParameterData.none(),
  'collectionRecords': (data) async => ParameterData(
        allParams: {
          'uID': getParameter<String>(data, 'uID'),
        },
      ),
  'manageTrucksPage': ParameterData.none(),
  'archivedTrucks': ParameterData.none(),
  'manageJunkshopPage': ParameterData.none(),
  'addNewJunkshop': ParameterData.none(),
  'viewJunkshopPage': (data) async => ParameterData(
        allParams: {
          'junkshopID': getParameter<DocumentReference>(data, 'junkshopID'),
          'deleterID': getParameter<String>(data, 'deleterID'),
          'timeDeleted': getParameter<DateTime>(data, 'timeDeleted'),
        },
      ),
  'deactivatedJunkshopPage': ParameterData.none(),
  'serviceInformation': ParameterData.none(),
  'acceptedJunkPage': (data) async => ParameterData(
        allParams: {
          'type': getParameter<String>(data, 'type'),
        },
      ),
  'manageStaffPage': (data) async => ParameterData(
        allParams: {
          'junkshopReference':
              getParameter<DocumentReference>(data, 'junkshopReference'),
        },
      ),
  'viewStaffPage': (data) async => ParameterData(
        allParams: {
          'staffID': getParameter<DocumentReference>(data, 'staffID'),
          'junkshopReference':
              getParameter<DocumentReference>(data, 'junkshopReference'),
        },
      ),
  'formerStaffPage': (data) async => ParameterData(
        allParams: {
          'junkshopReference':
              getParameter<DocumentReference>(data, 'junkshopReference'),
        },
      ),
  'junkshops': (data) async => ParameterData(
        allParams: {
          'fromAppointment': getParameter<bool>(data, 'fromAppointment'),
        },
      ),
  'viewJunkshop': (data) async => ParameterData(
        allParams: {
          'junkshopID': getParameter<DocumentReference>(data, 'junkshopID'),
        },
      ),
  'junkshopAppointment': (data) async => ParameterData(
        allParams: {
          'junkshopID': getParameter<DocumentReference>(data, 'junkshopID'),
        },
      ),
  'blogspotDraft': ParameterData.none(),
  'pinLocation': (data) async => ParameterData(
        allParams: {
          'junkshopID': getParameter<DocumentReference>(data, 'junkshopID'),
        },
      ),
  'wasteTypePage': ParameterData.none(),
  'editRegShed': ParameterData.none(),
  'wasteSegregationReports': ParameterData.none(),
  'reportsLog': ParameterData.none(),
  'manageBookings': (data) async => ParameterData(
        allParams: {
          'junkshopID': getParameter<DocumentReference>(data, 'junkshopID'),
        },
      ),
  'myAppointment': (data) async => ParameterData(
        allParams: {
          'appointmentRef':
              getParameter<DocumentReference>(data, 'appointmentRef'),
        },
      ),
  'cancelledBookings': (data) async => ParameterData(
        allParams: {
          'junkshopID': getParameter<DocumentReference>(data, 'junkshopID'),
        },
      ),
  'paymentPage': (data) async => ParameterData(
        allParams: {
          'appointmentRef':
              getParameter<DocumentReference>(data, 'appointmentRef'),
        },
      ),
  'quantifyingPage': (data) async => ParameterData(
        allParams: {
          'appointmentRef':
              getParameter<DocumentReference>(data, 'appointmentRef'),
        },
      ),
  'completedBookings': ParameterData.none(),
  'googleMapPage': (data) async => ParameterData(
        allParams: {
          'junkshopID': getParameter<DocumentReference>(data, 'junkshopID'),
        },
      ),
  'reportsPage': ParameterData.none(),
  'transacations': ParameterData.none(),
  'accountVerificationPage': ParameterData.none(),
  'manageVerification': (data) async => ParameterData(
        allParams: {
          'sortBy': getParameter<String>(data, 'sortBy'),
          'order': getParameter<String>(data, 'order'),
        },
      ),
  'verificationPage': (data) async => ParameterData(
        allParams: {
          'userID': getParameter<String>(data, 'userID'),
        },
      ),
  'verificationHistory': ParameterData.none(),
  'creatPostPage': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
          'title': getParameter<String>(data, 'title'),
          'description': getParameter<String>(data, 'description'),
          'photoURL': getParameter<String>(data, 'photoURL'),
        },
      ),
  'viewPost': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
        },
      ),
  'Res_EcoReports': ParameterData.none(),
  'Res_ReportsHistory': ParameterData.none(),
  'Adm_EcoReports': ParameterData.none(),
  'Adm_ConcernTypes': ParameterData.none(),
  'Adm_FalseReports': ParameterData.none(),
  'Adm_ViewReportDetails': (data) async => ParameterData(
        allParams: {
          'reportRef': getParameter<DocumentReference>(data, 'reportRef'),
          'fromTheSender': getParameter<bool>(data, 'fromTheSender'),
        },
      ),
  'leaderboard': ParameterData.none(),
  'allAnnouncements': ParameterData.none(),
  'ContactUs': ParameterData.none(),
  'TermsAndConditions': ParameterData.none(),
  'AboutPage': ParameterData.none(),
  'pdf': ParameterData.none(),
  'collectionHistory': ParameterData.none(),
  'ai_recyclables': ParameterData.none(),
  'AuctionMainPage': ParameterData.none(),
  'Res_PostAuction': ParameterData.none(),
  'blogspotAI': ParameterData.none(),
  'Res_Transaction': ParameterData.none(),
  'JS_Transactions': ParameterData.none(),
  'JS_ViewPayablesCompleted': (data) async => ParameterData(
        allParams: {
          'lotRef': await getDocumentParameter<AuctionRecord>(
              data, 'lotRef', AuctionRecord.fromSnapshot),
        },
      ),
  'Res_AuctionHistory': ParameterData.none(),
  'Res_AuctionPost': (data) async => ParameterData(
        allParams: {
          'auctionPostRef':
              getParameter<DocumentReference>(data, 'auctionPostRef'),
        },
      ),
  'JS_FindPost': ParameterData.none(),
  'wasteSegregatorDashboardSA': ParameterData.none(),
  'wasteSegregatorDashboardBA': ParameterData.none(),
  'logs': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
