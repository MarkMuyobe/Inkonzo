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
