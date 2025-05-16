import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double? computeTotalAmount(
  String? pricePerPiece,
  double? quantity,
) {
  double totalAmount = 0;

  // Check if pricePerPiece and quantity are not null and valid
  if (pricePerPiece != null && quantity != null) {
    // Convert pricePerPiece to int
    double price = double.tryParse(pricePerPiece) ?? 0;

    // Calculate total amount
    totalAmount = price * quantity;

    totalAmount = double.parse(totalAmount.toStringAsFixed(2));
  }

  return totalAmount;
}

double? convertStringToDouble(String? stringToBeConvertedToDouble) {
  double converted = 0;

  if (stringToBeConvertedToDouble != null) {
    double conversion = double.tryParse(stringToBeConvertedToDouble) ?? 0;

    converted = conversion;
    converted = double.parse(converted.toStringAsFixed(2));
  }

  return converted;
}

double? setQuantity(
  bool? textfieldIsSet,
  bool? countControllerIsGreaterThanZero,
  String? stringToBeConvertedToDouble,
  int? countControllerValue,
) {
  double quantity = 0;

  if (textfieldIsSet == true && stringToBeConvertedToDouble != null) {
    // Check if the string can be parsed to a double
    double? converted = double.tryParse(stringToBeConvertedToDouble);
    if (converted != null) {
      // If parsing is successful, round to 2 decimal places
      quantity = double.parse(converted.toStringAsFixed(2));
    } else {
      // If parsing fails, set quantity to 0
      quantity = 0;
    }
  } else if (countControllerIsGreaterThanZero == true &&
      countControllerValue != null) {
    // If count controller is greater than zero, use its value as quantity
    quantity = countControllerValue.toDouble();
  }

  return quantity;
}

double? total(
  double? serviceCharge,
  double? subtotal,
) {
  double totalAmount = 0;
  if (serviceCharge != null && subtotal != null) {
    totalAmount = subtotal - serviceCharge;
    totalAmount = double.parse(totalAmount.toStringAsFixed(2));
  }
  return totalAmount;
}

String? returnNull() {
  return '';
}

String? addComma(
  bool? plastic,
  bool? glass,
  bool? paper,
  bool? metal,
  bool? ewaste,
  bool? others,
) {
  String? result = '';

  if (plastic != null && plastic == true) {
    result += 'Plastic';
  }

  if (glass != null && glass == true) {
    if (result.isNotEmpty) result += ', ';
    result += 'Glass';
  }

  if (paper != null && paper == true) {
    if (result.isNotEmpty) result += ', ';
    result += 'Paper';
  }

  if (metal != null && metal == true) {
    if (result.isNotEmpty) result += ', ';
    result += 'Metal';
  }

  if (ewaste != null && ewaste == true) {
    if (result.isNotEmpty) result += ', ';
    result += 'E-Waste';
  }

  if (others != null && others == true) {
    if (result.isNotEmpty) result += ', ';
    result += 'Others';
  }

  return result.isEmpty ? null : result;
}

String? allJunks(
  List<String>? plastic,
  List<String>? glass,
  List<String>? paper,
  List<String>? metal,
  List<String>? ewaste,
  List<String>? others,
) {
  List<String> allJunksList = [];

  // Add plastic junks to the list
  if (plastic != null && plastic.isNotEmpty) {
    allJunksList.addAll(plastic);
  }

  // Add glass junks to the list
  if (glass != null && glass.isNotEmpty) {
    allJunksList.addAll(glass);
  }

  // Add paper junks to the list
  if (paper != null && paper.isNotEmpty) {
    allJunksList.addAll(paper);
  }

  // Add metal junks to the list
  if (metal != null && metal.isNotEmpty) {
    allJunksList.addAll(metal);
  }

  // Add e-waste junks to the list
  if (ewaste != null && ewaste.isNotEmpty) {
    allJunksList.addAll(ewaste);
  }

  // Add other junks to the list
  if (others != null && others.isNotEmpty) {
    allJunksList.addAll(others);
  }

  // Join all junks with commas
  String result = allJunksList.join(', ');

  return result.isEmpty ? null : result;
}

DateTime? afterTodayValidation() {
  DateTime currentDate = DateTime.now();

  // Add one day to the current date to get tomorrow's date
  DateTime tomorrowDate = currentDate.add(Duration(days: 1));

  return tomorrowDate;
}

double? getTotalPaid(
  double? currentTotalAmountPaid,
  double? appointmentTotalAmount,
) {
  double newTotalAmountPaid = 0;

  if (currentTotalAmountPaid != null && appointmentTotalAmount != null) {
    newTotalAmountPaid = currentTotalAmountPaid + appointmentTotalAmount;
  }
  return newTotalAmountPaid;
}

int? indexPlusOne(int? index) {
  int newNum = 0;
  if (index != null) {
    newNum = index + 1;
  }
  return newNum;
}

double? transactionReportTotalAmount(List<double>? amount) {
  double totalAmount = 0;

  if (amount != null) {
    for (double? value in amount) {
      if (value != null) {
        totalAmount += value;
      }
    }
  }

  return totalAmount;
}

DateTime? addOneYear(DateTime? timeCreated) {
  if (timeCreated != null) {
    // Add one year to the provided date
    return DateTime(timeCreated.year + 1, timeCreated.month, timeCreated.day);
  }

  // Return null if the provided date is null
  return null;
}

bool? isJunkshopOpen(
  String? openingDay,
  String? closingDay,
  DateTime? openingTime,
  DateTime? closingTime,
) {
  String currentDay =
      DateFormat('E').format(DateTime.now()); // Get current day of the week
  DateTime currentTime = DateTime.now();
  if (openingDay != null &&
      closingDay != null &&
      openingTime != null &&
      closingTime != null) {
    // Convert days to integers (0 for Mon, 1 for Tue, ..., 6 for Sun)
    int openingDayIndex =
        ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].indexOf(openingDay);
    int closingDayIndex =
        ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].indexOf(closingDay);
    int currentDayIndex =
        ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].indexOf(currentDay);

    // Check if current day is within the day interval
    bool isDayWithinInterval = false;
    if (openingDayIndex <= closingDayIndex) {
      isDayWithinInterval = currentDayIndex >= openingDayIndex &&
          currentDayIndex <= closingDayIndex;
    } else {
      isDayWithinInterval = currentDayIndex >= openingDayIndex ||
          currentDayIndex <= closingDayIndex;
    }

    // Check if current time is within the time interval
    bool isTimeWithinInterval() {
      // Format the DateTime objects to get only the time part in "hh:mm a" format
      String currentFormattedTime = DateFormat('hh:mm a').format(currentTime);
      String openingFormattedTime = DateFormat('hh:mm a').format(openingTime);
      String closingFormattedTime = DateFormat('hh:mm a').format(closingTime);

      // Compare the formatted time strings
      bool isAfterOpening = DateFormat('hh:mm a')
          .parse(currentFormattedTime)
          .isAfter(DateFormat('hh:mm a').parse(openingFormattedTime));
      bool isBeforeClosing = DateFormat('hh:mm a')
          .parse(currentFormattedTime)
          .isBefore(DateFormat('hh:mm a').parse(closingFormattedTime));

      return isAfterOpening && isBeforeClosing;
    }

    // Return true if both day and time are within the interval
    return isDayWithinInterval && isTimeWithinInterval();
  }
}

int? convertDoubleToInt(double? doubleValue) {
  int newIntValue = 0;
  if (doubleValue != null) {
    newIntValue = doubleValue.toInt();
  }
  return newIntValue;
}

DateTime? getNextCollectionDateInList(List<String>? day) {
  DateTime currentDay = DateTime.now();
  DateTime nextCollectionDate;

  if (day != null && day.isNotEmpty) {
    // Get the current day of the week (1 for Monday, 7 for Sunday)
    int currentWeekday = currentDay.weekday;

    // Convert days to their respective weekday numbers
    Map<String, int> weekdayMap = {
      'Monday': DateTime.monday,
      'Tuesday': DateTime.tuesday,
      'Wednesday': DateTime.wednesday,
      'Thursday': DateTime.thursday,
      'Friday': DateTime.friday,
      'Saturday': DateTime.saturday,
      'Sunday': DateTime.sunday,
    };

    // Find the closest day to the current day
    int closestWeekday = currentWeekday;
    int minDifference = 7; // Initialize with maximum difference

    for (String dayOfWeek in day) {
      int weekday = weekdayMap[dayOfWeek]!;
      int difference = weekday - currentWeekday;
      if (difference < 0) {
        difference += 7; // Add 7 days if the day is in the past
      }
      if (difference < minDifference) {
        minDifference = difference;
        closestWeekday = weekday;
      }
      // Check if the current day is in the list
      if (weekday == currentWeekday) {
        return currentDay;
      }
    }

    // Find the next occurrence of the closest day
    int daysToAdd = closestWeekday - currentWeekday;
    if (daysToAdd <= 0) {
      daysToAdd +=
          7; // Add 7 days if the closest day has already passed this week
    }
    nextCollectionDate = currentDay.add(Duration(days: daysToAdd));

    return nextCollectionDate;
  } else {
    print('Error: No day provided.');
    return null;
  }
}

String? getNextCollectionDay(List<String>? day) {
  if (day == null || day.isEmpty) {
    print('Error: No day provided.');
    return null;
  }

  DateTime currentDay = DateTime.now();
  int currentWeekday = currentDay.weekday;

  // Convert days to their respective weekday numbers
  Map<String, int> weekdayMap = {
    'Monday': DateTime.monday,
    'Tuesday': DateTime.tuesday,
    'Wednesday': DateTime.wednesday,
    'Thursday': DateTime.thursday,
    'Friday': DateTime.friday,
    'Saturday': DateTime.saturday,
    'Sunday': DateTime.sunday,
  };

  // Find the closest day to the current day
  String? closestDay;
  int minDifference = 7; // Initialize with maximum difference

  for (String dayOfWeek in day) {
    int weekday = weekdayMap[dayOfWeek]!;
    int difference = weekday - currentWeekday;
    if (difference < 0) {
      difference += 7; // Add 7 days if the day is in the past
    }
    if (difference < minDifference) {
      minDifference = difference;
      closestDay = dayOfWeek;
    }
  }

  return closestDay;
}

String? getCollectionCountdownInList(List<String>? day) {
  if (day == null || day.isEmpty) {
    print('Error: No day provided.');
    return null;
  }

  DateTime currentDay = DateTime.now();
  int currentWeekday = currentDay.weekday;

  // Convert days to their respective weekday numbers
  Map<String, int> weekdayMap = {
    'Monday': DateTime.monday,
    'Tuesday': DateTime.tuesday,
    'Wednesday': DateTime.wednesday,
    'Thursday': DateTime.thursday,
    'Friday': DateTime.friday,
    'Saturday': DateTime.saturday,
    'Sunday': DateTime.sunday,
  };

  // Find the closest day to the current day
  int minDifference = 7; // Initialize with maximum difference
  String? closestDay;

  for (String dayOfWeek in day) {
    int weekday = weekdayMap[dayOfWeek]!;
    int difference = weekday - currentWeekday;
    if (difference < 0) {
      difference += 7; // Add 7 days if the day is in the past
    }
    if (difference < minDifference) {
      minDifference = difference;
      closestDay = dayOfWeek;
    }
  }

  if (closestDay != null) {
    // Calculate the date of the closest day
    DateTime nextCollectionDate = currentDay.add(Duration(days: minDifference));

    // Calculate the difference in days from today
    int differenceInDays = nextCollectionDate.difference(currentDay).inDays;

    // Format the output based on the difference in days
    if (differenceInDays == 0) {
      return 'Today';
    } else if (differenceInDays == 1) {
      return 'Tomorrow';
    } else {
      return 'In $differenceInDays days';
    }
  }
}

Color? displayContainerColor(
  List<String>? day,
  String? dayInContainer,
) {
  if (day != null && dayInContainer != null) {
    DateTime currentDay = DateTime.now();
    String currentWeekday = DateFormat('EEEE').format(currentDay);

    if (currentWeekday == dayInContainer) {
      if (day.contains(currentWeekday)) {
        return const Color(0xFF00BF40);
      } else {
        return const Color(0xFFFFD707);
      }
    } else if (day.contains(dayInContainer)) {
      return const Color(0xFF2D7DCB);
    } else {
      return const Color(0xFFD9D9D9); // Default color
    }
  }
}

Color? displayTextColor(
  List<String>? day,
  String? dayInContainer,
) {
  if (day != null && dayInContainer != null) {
    DateTime currentDay = DateTime.now();
    String currentWeekday = DateFormat('EEEE').format(currentDay);

    if (currentWeekday == dayInContainer) {
      if (day.contains(currentWeekday)) {
        return const Color(0xFFFFFFFF);
      } else {
        return const Color(0xFF3D4F43);
      }
    } else if (day.contains(dayInContainer)) {
      return const Color(0xFFFFFFFF);
    } else {
      return const Color(0xFF3D4F43); // Default color
    }
  }
}

String? colorToString(Color? color) {
  if (color != null) {
    String colorString = color.value.toRadixString(16);
    return colorString;
  }
}

List<String>? sortDaysOfCOllection(List<String>? daysOfCollection) {
  if (daysOfCollection != null && daysOfCollection.isNotEmpty) {
    // Define the order of the days of the week
    List<String> weekDaysOrder = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

    // Get the index of tomorrow
    DateTime now = DateTime.now();
    int currentDayIndex = now.weekday - 1; // Adjust for zero-based indexing
    int tomorrowIndex =
        (currentDayIndex + 1) % 7; // Ensure it wraps around to 0 for Sunday

    // Rotate the list so that it starts from tomorrow
    List<String> sortedDays = [];
    for (int i = tomorrowIndex; i < 7; i++) {
      sortedDays.add(weekDaysOrder[i]);
    }
    for (int i = 0; i < tomorrowIndex; i++) {
      sortedDays.add(weekDaysOrder[i]);
    }

    // Rearrange based on the order of the original days of collection
    List<String> result = [];
    for (String day in sortedDays) {
      if (daysOfCollection.contains(day)) {
        result.add(day);
      }
    }

    return result;
  }
  return null;
}

DateTime? getNextCollectionDate(String? day) {
  DateTime currentDay = DateTime.now();
  DateTime nextCollectionDate;

  if (day != null && day.isNotEmpty) {
    // Get the current day of the week (1 for Monday, 7 for Sunday)
    int currentWeekday = currentDay.weekday;

    // Convert days to their respective weekday numbers
    Map<String, int> weekdayMap = {
      'Monday': DateTime.monday,
      'Tuesday': DateTime.tuesday,
      'Wednesday': DateTime.wednesday,
      'Thursday': DateTime.thursday,
      'Friday': DateTime.friday,
      'Saturday': DateTime.saturday,
      'Sunday': DateTime.sunday,
    };

    // Find the provided day of the week
    int providedWeekday = weekdayMap[day] ?? -1;
    if (providedWeekday == -1) {
      print('Error: Invalid day provided.');
      return null;
    }

    // Calculate the days to add to reach the next occurrence
    int daysToAdd = (providedWeekday - currentWeekday + 7) %
        7; // Add 7 to ensure positive result
    if (daysToAdd == 0) {
      daysToAdd =
          7; // If the provided day is today, add 7 days for next occurrence
    }

    // Calculate the next occurrence date
    nextCollectionDate = currentDay.add(Duration(days: daysToAdd));

    return nextCollectionDate;
  } else {
    print('Error: No day provided.');
    return null;
  }
}

String? getCollectionCountdown(String? day) {
  if (day == null || day.isEmpty) {
    print('Error: No day provided.');
    return null;
  }

  DateTime currentDay = DateTime.now();
  int currentWeekday = currentDay.weekday;

  // Convert days to their respective weekday numbers
  Map<String, int> weekdayMap = {
    'Monday': DateTime.monday,
    'Tuesday': DateTime.tuesday,
    'Wednesday': DateTime.wednesday,
    'Thursday': DateTime.thursday,
    'Friday': DateTime.friday,
    'Saturday': DateTime.saturday,
    'Sunday': DateTime.sunday,
  };

  // Find the provided day of the week
  int providedWeekday = weekdayMap[day] ?? -1;
  if (providedWeekday == -1) {
    print('Error: Invalid day provided.');
    return null;
  }

  // Calculate the difference between the provided day and the current day
  int difference = (providedWeekday - currentWeekday + 7) %
      7; // Add 7 to ensure positive result

  // Calculate the date of the provided day
  DateTime nextCollectionDate = currentDay.add(Duration(days: difference));

  // Calculate the difference in days from today
  int differenceInDays = nextCollectionDate.difference(currentDay).inDays;

  // Format the output based on the difference in days
  if (differenceInDays == 0) {
    return 'Today';
  } else if (differenceInDays == 1) {
    return 'Tomorrow';
  } else {
    return 'In $differenceInDays days';
  }
}

String? getSpecialCollectionCountdown(DateTime? targetDate) {
  if (targetDate == null) {
    print('Error: No target date provided.');
    return null;
  }

  DateTime currentDate = DateTime.now();

  // Create DateTime objects that only include the year, month, and day
  DateTime formattedTargetDate =
      DateTime(targetDate.year, targetDate.month, targetDate.day);
  DateTime formattedCurrentDate =
      DateTime(currentDate.year, currentDate.month, currentDate.day);

  // Calculate the difference in days between the current date and the target date
  int differenceInDays =
      formattedTargetDate.difference(formattedCurrentDate).inDays;

  // Format the output based on the difference in days
  if (differenceInDays == 0) {
    return 'Today';
  } else if (differenceInDays == 1) {
    return 'Tomorrow';
  } else if (differenceInDays > 1) {
    return 'In $differenceInDays days';
  } else {
    return 'Date has passed';
  }
}

String? allCollectorsWithComma(List<String>? collectorList) {
  if (collectorList == null || collectorList.isEmpty) return null;

  String result = collectorList.join(', ');

  return result.isEmpty ? null : result;
}

DateTime? permanentlyDeleteOnThisDate(DateTime? deletedOn) {
  if (deletedOn == null) {
    return null;
  }
  return deletedOn.add(Duration(days: 30));
}

String? displayTwoText(
  String? firstText,
  String? secondText,
) {
  String theText = '';
  if (firstText != null && secondText != null) {
    theText = firstText + '\n \n' + secondText;
  }
  return theText;
}

String? space() {
  return '\n';
}

DateTime? getTimeAfter12Hours() {
  // get the date and time after 12 hours of the current time
  DateTime now = DateTime.now();
  DateTime after12Hours = now.add(Duration(hours: 12));
  return after12Hours;
}

bool? allTappedShouldHaveAValue(
  bool? monIsTapped,
  bool? tueIsTapped,
  bool? wedIsTapped,
  bool? thuIsTapped,
  bool? friIsTapped,
  bool? satIsTapped,
  bool? sunIsTapped,
  String? mon1value,
  String? mon2value,
  List<String>? mon3value,
  String? mon4value,
  String? tue1value,
  String? tue2value,
  List<String>? tue3value,
  String? tue4value,
  String? wed1value,
  String? wed2value,
  List<String>? wed3value,
  String? wed4value,
  String? thu1value,
  String? thu2value,
  List<String>? thu3value,
  String? thu4value,
  String? fri1value,
  String? fri2value,
  List<String>? fri3value,
  String? fri4value,
  String? sat1value,
  String? sat2value,
  List<String>? sat3value,
  String? sat4value,
  String? sun1value,
  String? sun2value,
  List<String>? sun3value,
  String? sun4value,
  DateTime? monStart,
  DateTime? monEnd,
  DateTime? tueStart,
  DateTime? tueEnd,
  DateTime? wedStart,
  DateTime? wedEnd,
  DateTime? thuStart,
  DateTime? thuEnd,
  DateTime? friStart,
  DateTime? friEnd,
  DateTime? satStart,
  DateTime? satEnd,
  DateTime? sunStart,
  DateTime? sunEnd,
) {
  bool result = true;

  if (monIsTapped == true &&
      (mon1value == null ||
          mon2value == null ||
          mon3value == null ||
          mon4value == null ||
          monStart == null ||
          monEnd == null)) {
    result = false;
  }

  if (tueIsTapped == true &&
      (tue1value == null ||
          tue2value == null ||
          tue3value == null ||
          tue4value == null ||
          tueStart == null ||
          tueEnd == null)) {
    result = false;
  }

  if (wedIsTapped == true &&
      (wed1value == null ||
          wed2value == null ||
          wed3value == null ||
          wed4value == null ||
          wedStart == null ||
          wedEnd == null)) {
    result = false;
  }

  if (thuIsTapped == true &&
      (thu1value == null ||
          thu2value == null ||
          thu3value == null ||
          thu4value == null ||
          thuStart == null ||
          thuEnd == null)) {
    result = false;
  }

  if (friIsTapped == true &&
      (fri1value == null ||
          fri2value == null ||
          fri3value == null ||
          fri4value == null ||
          friStart == null ||
          friEnd == null)) {
    result = false;
  }

  if (satIsTapped == true &&
      (sat1value == null ||
          sat2value == null ||
          sat3value == null ||
          sat4value == null ||
          satStart == null ||
          satEnd == null)) {
    result = false;
  }

  if (sunIsTapped == true &&
      (sun1value == null ||
          sun2value == null ||
          sun3value == null ||
          sun4value == null ||
          sunStart == null ||
          sunEnd == null)) {
    result = false;
  }

  return result;
}

double? getEcoPointsTotal(
  double? currentEcoPoints,
  double? transactionTotal,
) {
  if (currentEcoPoints == null || transactionTotal == null) {
    return null;
  }
  double ecopoints = transactionTotal / 50;
  double totalEcoPoints = currentEcoPoints + ecopoints;
  return double.parse(totalEcoPoints.toStringAsFixed(2));
}

double? filterHighestPoints(List<double>? usersEcoPoints) {
  // return the highest value from usersEcoPoints
  if (usersEcoPoints == null || usersEcoPoints.isEmpty) {
    return null;
  }
  usersEcoPoints.sort();
  return usersEcoPoints.last;
}

int? indexPlusTwo(int? index) {
  int newNum = 0;
  if (index != null) {
    newNum = index + 2;
  }
  return newNum;
}

String? simplifyEcoPoints(double? ecopoints) {
  // in else, remove decimal
  if (ecopoints == null) {
    return null;
  } else if (ecopoints >= 1000000) {
    return '${(ecopoints / 1000000).toStringAsFixed(1)}M';
  } else if (ecopoints >= 1000) {
    return '${(ecopoints / 1000).toStringAsFixed(1)}K';
  } else {
    return ecopoints.toInt().toString();
  }
}

String? getLastMonth() {
  // get moth last month
  final now = DateTime.now();
  final lastMonth = DateTime(now.year, now.month - 1, now.day);
  final formatter = DateFormat('MMMM');
  return formatter.format(lastMonth);
}

DateTime? excludeMostRecentAnnouncement(List<DateTime>? allAnnouncement) {
  // return the closest time of allAnnouncement
  if (allAnnouncement == null || allAnnouncement.isEmpty) {
    return null;
  }
  allAnnouncement.sort();
  final now = DateTime.now();
  for (int i = allAnnouncement.length - 1; i >= 0; i--) {
    if (allAnnouncement[i].isBefore(now)) {
      return allAnnouncement[i];
    }
  }
  return allAnnouncement.last;
}

DocumentReference? covertStringToDocRef(String? ownerID) {
  // convert ownerID from string to document reference
  if (ownerID == null) return null;
  return FirebaseFirestore.instance.collection('user').doc(ownerID);
}

String? getUserRank(List<UserRecord>? users) {
  // identify which index is the user's eco_points
  if (users == null || users.isEmpty) {
    return null;
  }

  users.sort((a, b) => b.ecoPoints.compareTo(a.ecoPoints));

  final currentUserIndex =
      users.indexWhere((user) => user.uid == currentUserUid);

  if (currentUserIndex == -1) {
    return null;
  }

  return (currentUserIndex + 1).toString();
}

String? getPasswordStrength(String? password) {
  // get the strength of the password whether it is weak medium or strong
  if (password == null || password.isEmpty) {
    return null;
  }

  int score = 0;

  // awarding score based on password length
  if (password.length >= 7) {
    score += 1;
  }
  if (password.length >= 12) {
    score += 1;
  }

  // awarding score based on presence of uppercase letters
  if (password.contains(RegExp(r'[A-Z]'))) {
    score += 1;
  }

  // awarding score based on presence of lowercase letters
  if (password.contains(RegExp(r'[a-z]'))) {
    score += 1;
  }

  // awarding score based on presence of numbers
  if (password.contains(RegExp(r'[0-9]'))) {
    score += 1;
  }

  // awarding score based on presence of special characters
  if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    score += 1;
  }

  // determining password strength based on score
  if (password.length <= 7) {
    return 'Weak';
  } else if (score <= 4) {
    return 'Medium';
  } else {
    return 'Strong';
  }
}

String? eRTransactionID(int? documentsCount) {
  final currentYear = DateTime.now().year;
  final formattedYear = currentYear.toString();

  if (documentsCount == null) {
    return null;
  }

  int plusOne = documentsCount + 1;
  String countString = plusOne.toString();
  while (countString.length < 6) {
    countString = '0$countString';
  }

  return 'ER$formattedYear-$countString';
}

String? junkshopTransactionID(int? documentsCount) {
  final currentYear = DateTime.now().year;
  final formattedYear = currentYear.toString();

  if (documentsCount == null) {
    return null;
  }

  int plusOne = documentsCount + 1;
  String countString = plusOne.toString();
  while (countString.length < 6) {
    countString = '0$countString';
  }

  return 'JS$formattedYear-$countString';
}

DocumentReference? garbageCollectionDateDocRef(String? barangay) {
  if (barangay == null) return null;
  return FirebaseFirestore.instance
      .collection('garbage_collection_date')
      .doc(barangay);

  /// MODIFY
}

String? getDuration(
  DateTime? timeStart,
  DateTime? timeEnd,
) {
  // get the duration of time
  if (timeStart == null || timeEnd == null) {
    return null;
  }

  final duration = timeEnd.difference(timeStart);

  if (duration.inDays > 0) {
    final hours = duration.inHours % 24;
    return '${duration.inDays}d ${hours}h';
  } else if (duration.inHours > 0) {
    final minutes = duration.inMinutes % 60;
    return '${duration.inHours}h ${minutes}m';
  } else if (duration.inMinutes > 0) {
    final seconds = duration.inSeconds % 60;
    return '${duration.inMinutes}m ${seconds}s';
  } else {
    return '${duration.inSeconds}s';
  }
}

DateTime? getDriverNextCollection(String? day) {
  DateTime currentDay = DateTime.now();
  DateTime nextCollectionDate;

  if (day != null && day.isNotEmpty) {
    // Get the current day of the week (1 for Monday, 7 for Sunday)
    int currentWeekday = currentDay.weekday;

    // Convert days to their respective weekday numbers
    Map<String, int> weekdayMap = {
      'Monday': DateTime.monday,
      'Tuesday': DateTime.tuesday,
      'Wednesday': DateTime.wednesday,
      'Thursday': DateTime.thursday,
      'Friday': DateTime.friday,
      'Saturday': DateTime.saturday,
      'Sunday': DateTime.sunday,
    };

    // Find the provided day of the week
    int providedWeekday = weekdayMap[day] ?? -1;
    if (providedWeekday == -1) {
      print('Error: Invalid day provided.');
      return null;
    }

    // Calculate the days to add to reach the next occurrence
    int daysToAdd = providedWeekday - currentWeekday;

    // If daysToAdd is negative, it means the provided day is earlier this week
    // If daysToAdd is zero, it means the provided day is today
    if (daysToAdd < 0) {
      daysToAdd += 7; // Schedule for next week
    } else if (daysToAdd == 0) {
      daysToAdd = 0; // Schedule for today
    }

    // Calculate the next occurrence date
    nextCollectionDate = currentDay.add(Duration(days: daysToAdd));

    return nextCollectionDate;
  } else {
    print('Error: No day provided.');
    return null;
  }
}

bool? isPastCollectionDate(DateTime? collectionDate) {
  // return true only if collection is past the current date (should only consider day, not including minutes)
  if (collectionDate == null) {
    return null;
  }
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final collectionDay =
      DateTime(collectionDate.year, collectionDate.month, collectionDate.day);

  if (today.isAfter(collectionDay) == true) {
    return false;
  } else {
    return true;
  }
}

String? trimRecyclablesValidation(String? isRecyclableOutput) {
  // isRecyclableOutput should be trimmed to only "Yes" or "No"
  // if (isRecyclableOutput != null) {
  //   isRecyclableOutput = isRecyclableOutput.trim();
  //   if (isRecyclableOutput.toLowerCase() == 'yes') {
  //     return 'Yes';
  //   } else if (isRecyclableOutput.toLowerCase() == 'no') {
  //     return 'No';
  //   }
  // }
  // return null;
  if (isRecyclableOutput != null) {
    // Trim the string and convert to lowercase for easier comparison
    String trimmedOutput = isRecyclableOutput.trim().toLowerCase();

    // Check if the string contains "yes" or "no"
    if (trimmedOutput.contains('yes')) {
      return 'Yes';
    } else if (trimmedOutput.contains('no')) {
      return 'No';
    }
  }

  // Return null if neither "yes" nor "no" is found
  return null;
}

DateTime? getDateIn15Days() {
  // return the date after 15 days from now
  return DateTime.now().add(Duration(days: 15));
}

String? getLotID(int? auctionCollectionItems) {
  //  return a string "2024-0004" (2024 is the current year and 0004 is the auctionCollectionItems +1 )
  final currentYear = DateTime.now().year;
  final lotID = (auctionCollectionItems ?? 0) + 1;
  return '$currentYear-${lotID.toString().padLeft(4, '0')}';
}

String? getAuctionCountdown(DateTime? auctionEndTime) {
  // get how many days, hours, or minutes left from current time to auctionEndTime
  if (auctionEndTime == null) {
    return null;
  }

  DateTime currentTime = DateTime.now();
  Duration difference = auctionEndTime.difference(currentTime);

  if (difference.isNegative) {
    return 'Auction has ended';
  }

  int days = difference.inDays;
  int hours = difference.inHours.remainder(24);
  int minutes = difference.inMinutes.remainder(60);

  String dayText = days == 1 ? 'day' : 'days';
  String hourText = hours == 1 ? 'hour' : 'hours';
  String minuteText = (minutes == 1 || minutes == 0) ? 'minute' : 'minutes';

  if (days > 0) {
    return '$days $dayText, $hours $hourText';
  } else if (hours > 0) {
    return '$hours $hourText, $minutes $minuteText';
  } else {
    return '$minutes $minuteText';
  }
}

double? addition(
  double? num1,
  double? num2,
) {
  // num1 + num2
  if (num1 != null && num2 != null) {
    return num1 + num2;
  } else {
    return null;
  }
}

bool? greaterThan(
  double? minimum,
  double? customizedBid,
) {
  // return true if customizedBid is greater than or equal minimum
  if (customizedBid != null && minimum != null) {
    return customizedBid >= minimum;
  }
  return null;
}

List<DateTime>? auctionDatesFiltered(List<DateTime>? auctionDates) {
  // cross out every multiple (identical) days and leave only one
  if (auctionDates == null || auctionDates.isEmpty) {
    return null;
  }

  List<DateTime> filteredDates = [];
  DateTime? prevDate;

  for (DateTime date in auctionDates) {
    if (prevDate == null || date.day != prevDate.day) {
      filteredDates.add(date);
      prevDate = date;
    }
  }

  return filteredDates;
}

String? addZeroes(int? index) {
  if (index != null) {
    return index.toString().padLeft(4, '0');
  }
  return null;
}

String? computeSum(List<double>? number) {
  // compute the sum of number
  if (number == null || number.isEmpty) {
    return null;
  }

  double sum = 0;
  for (double num in number) {
    sum += num;
  }

  return sum.toStringAsFixed(2);
}

List<JunkshopRecord>? getNearest(List<JunkshopRecord>? randomJunkshopList) {
  // randomJunkshopList has 'barangay' field, if barangay 'Pagala' return it on 0 index, then 'Poblacion' on index 1
  if (randomJunkshopList == null || randomJunkshopList.isEmpty) {
    return null;
  }

  // Create separate lists for each barangay
  List<JunkshopRecord> pagalaJunkshops = [];
  List<JunkshopRecord> poblacionJunkshops = [];
  List<JunkshopRecord> tangosJunkshops = [];
  List<JunkshopRecord> matangtubigJunkshops = [];
  List<JunkshopRecord> hinukayJunkshops = [];

  // Add each junkshop to the corresponding barangay list
  for (JunkshopRecord junkshop in randomJunkshopList) {
    if (junkshop.barangay == 'Pagala') {
      pagalaJunkshops.add(junkshop);
    } else if (junkshop.barangay == 'Poblacion') {
      poblacionJunkshops.add(junkshop);
    } else if (junkshop.barangay == 'Tangos') {
      tangosJunkshops.add(junkshop);
    } else if (junkshop.barangay == 'Matangtubig') {
      matangtubigJunkshops.add(junkshop);
    } else if (junkshop.barangay == 'Hinukay') {
      hinukayJunkshops.add(junkshop);
    }
  }

  // Combine lists in the desired order
  List<JunkshopRecord> nearestJunkshops = [
    ...pagalaJunkshops,
    ...poblacionJunkshops,
    ...tangosJunkshops,
    ...matangtubigJunkshops,
    ...hinukayJunkshops,
  ];

  return nearestJunkshops;
}
