import 'dart:developer';
import 'dart:math' hide log;

import 'package:fusionpower/models/product_model.dart';

/// Formulas
/// ---------------- kitKwhState ----------------
/// panelQtyState = number of panels
/// panelWattsAtom = watts value single panel
/// arraySizeState = panelQtyState * get(panelWattsAtom)
/// billToKwh = (arraySizeState * 5.5) * 30 / 1000
///
///
/// ---------------- billToKwhState ----------------
int billToKwh(int bill) {
  return (bill / 2.60).round();
}

/// ---------------- getNumOfPanels ----------------

int _getNumOfPanels(double kwh, int panelWatts, double batterySize) {
  double batteryMinusDOD =
      (batterySize * 1000) * 0.80; // take battery size and reduce by 20%
  int batteryDividedByHour =
      (batteryMinusDOD / 5.5).round(); // dividing battery capacity by 5.5 hours
  int panelsPerBatteryPerHour = (batteryDividedByHour / panelWatts)
      .round(); // working out the no. panels per hour
  return (kwh / ((panelWatts * 5.5 * 30) / 1000) + panelsPerBatteryPerHour)
      .round();
}

/// bill_block.js ----- calcualteNumberOfPanels ------------
int calculateNumberOfPannels({
  required int batteryQty,
  required double batterySize,
  required double sliderValue,
  required int billToKwh,
  required int panelWatts,
}) {
  double splitForPanels = (sliderValue / 100) * billToKwh;
  return _getNumOfPanels(
      splitForPanels, panelWatts, (batterySize * batteryQty));
}

/// ---------------- getNumOfBatteries ----------------
int _getNumBatteries(num kwh, double batterySize) {
  double totalSizeOfBank = ((kwh / 30) / batterySize) * batterySize;
  return (totalSizeOfBank / batterySize).round();
}

/// ---------------- calculateNumOfBatteries ----------------
int calculateNumberOfBatteries({
  required int minBatteryQty,
  required double sliderValue,
  required int billToKwh,
  required double batterySize,
}) {
  double splitForBatteries = ((100 - sliderValue) / 100) * billToKwh;
  return (splitForBatteries < minBatteryQty
      ? _getNumBatteries(minBatteryQty, batterySize)
      : _getNumBatteries(splitForBatteries, batterySize));
}

/// ------------------------- Calculate Inverter Size -------------------------
calculateInverterSize({
  required List inverters,
  required int totalWatts,
}) {
  try {
    inverters = inverters.map((e) => e as Inverter).toList();
    inverters.sort((a, b) =>
        ((totalWatts - a.maxPv).abs()).compareTo((totalWatts - b.maxPv).abs()));

    final Inverter inverter = inverters.first;
    final int numOfIverters = (totalWatts > inverter.maxPv)
        ? (totalWatts / inverter.maxPv).round()
        : 1;
    return {
      'id': inverter.id,
      'qty': numOfIverters,
    };
  } catch (e) {
    log("Exception in calculateInverterSize (helpers.dart) ${e.toString()}");
  }
}

double pmt(price) {
  //var result = PMT(6.5/1200 , 30*12 , 65000 , 0 , 0);
  var rate = 13 / 1200;
  var nperiod = 5 * 12;
  var pvif = pow(1 + rate, nperiod);
  var pmtValue = rate / (pvif - 1) * -(price * pvif);
  return -pmtValue;
}

/// watts to kWh
int wattsTokWh(int watts) => ((watts * 30 * 5.5) / 1000).round();
