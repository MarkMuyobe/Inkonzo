import 'dart:math' as math;

import '/backend/backend.dart';

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

double calculateDistanceTest(LatLng providerLocation) {
  // haversine formula comapring providerLocation to  -15.4190549,28.3637264 in kilometers
  var p = 0.017453292519943295;
  var c = math.cos;
  var a = 0.5 -
      c((providerLocation.latitude - -15.4190549) * p) / 2 +
      c(-15.4190549 * p) *
          c(providerLocation.latitude * p) *
          (1 - c((providerLocation.longitude - 28.3637264) * p)) /
          2;
  return 12742 * math.asin(math.sqrt(a));
}

double? totalFee(
  double subTotal,
  double bookingFee,
) {
  double total = subTotal + bookingFee;
  return (total);
}

List<ProviderDocumentsRecord>? sortByDistance(
    List<ProviderDocumentsRecord>? records,
    LatLng? userGeo,
    ) {
  if (records == null || userGeo == null) {
    return null;
  }

  double lat1 = userGeo.latitude;
  double lon1 = userGeo.longitude;

  // Calculate the distance for each record and store it as a key-value pair
  List<MapEntry<double, ProviderDocumentsRecord>> distances = [];

  for (ProviderDocumentsRecord record in records) {
    if (record.workLocation == null) {
      continue;
    }

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


List<ProviderDocumentsRecord>? sortsByDateJoined(
    List<ProviderDocumentsRecord>? records,
    ) {
  // sort ProviderDocumentsRecords by the dateJoined field and return the sorted list
  if (records == null) {
    return null;
  }
  records.sort((a, b) => (a.dateJoined ?? DateTime(0)).compareTo(b.dateJoined ?? DateTime(0)));
  return records;
}
List<ProviderDocumentsRecord>? sortByDateJoined(
    List<ProviderDocumentsRecord>? records,
    ) {
  if (records == null) {
    return [];
  }

  records.sort((a, b) {
    final dateA = a.dateJoined;
    final dateB = b.dateJoined;
    if (dateA == null && dateB == null) {
      return 0; // Both dates are null, consider them equal
    } else if (dateA == null) {
      return -1; // dateA is null, consider it smaller (earlier)
    } else if (dateB == null) {
      return 1; // dateB is null, consider it smaller (earlier)
    } else {
      return dateA.compareTo(dateB); // Compare the non-null dates
    }
  });

  return records;
}