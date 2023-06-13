import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double addCharge(
  double charge,
  double amount,
) {
  //Data
  return (amount + charge);
}

double subCharge(
  double charge,
  double totalAmount,
) {
  return (totalAmount -= charge);
}

double? totalFee(
  double subTotal,
  double bookingFee,
) {
  double total = subTotal + bookingFee;
  return (total);
}

double calculateDistance(
  LatLng userLocation,
  LatLng providerLocation,
) {
  // calculate haversine distance and return in kilometers
  double earthRadius = 6371;
  double dLat =
      math.pi / 180 * (providerLocation.latitude - userLocation.latitude);
  double dLon =
      math.pi / 180 * (providerLocation.longitude - userLocation.longitude);
  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(math.pi / 180 * (userLocation.latitude)) *
          math.cos(math.pi / 180 * (providerLocation.latitude)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  double d = earthRadius * c;
  return d;
}

List<ProviderDocumentsRecord> getProviderDocumentsSorted(
  List<ProviderDocumentsRecord> records,
  LatLng userGeo,
) {
  double lat1 = userGeo.latitude;
  double lon1 = userGeo.longitude;

  // Calculate the distance for each record and store it as a key-value pair
  List<MapEntry<double, ProviderDocumentsRecord>> distances = [];

  for (ProviderDocumentsRecord record in records) {
    double lat2 = record.workLocation!.latitude;
    double lon2 = record.workLocation!.longitude;

    var p = 0.017453292519943295;
    var a = 0.5 -
        math.cos((lat2 - lat1) * p) / 2 +
        math.cos(lat1 * p) *
            math.cos(lat2 * p) *
            (1 - math.cos((lon2 - lon1) * p)) /
            2;
    var d = 12742 * math.asin(math.sqrt(a));
    double distanceInKm = double.parse(d.toStringAsFixed(2));

    distances.add(MapEntry(distanceInKm, record));
  }

  // Sort the records based on distance
  distances.sort((a, b) => a.key.compareTo(b.key));

  // Extract the sorted records
  List<ProviderDocumentsRecord> sortedRecords =
      distances.map((entry) => entry.value).toList();

  return sortedRecords;
}

List<ProviderDocumentsRecord> sortByDateJoined(
    List<ProviderDocumentsRecord>? records) {
  // sort ProviderDocumentsRecords by the dateJoined field and return the sorted list
  if (records == null) {
    return [];
  }
  records.sort((a, b) => a.dateJoined!.compareTo(b.dateJoined!));
  return records;
}
