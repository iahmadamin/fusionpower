import 'dart:math';

import 'package:fusionpower/models/product_model.dart';

/// Bill to Kwh
// export const kitKwhState = selector({
//     key: 'kitKwhState',
//     get: ({ get }) => (get(arraySizeState) * 5.5) * 30 / 1000
// })

/// Formulas
/// ---------------- kitKwhState ----------------
/// panelQtyState = number of panels
/// panelWattsAtom = watts value single panel
/// arraySizeState = panelQtyState * get(panelWattsAtom)
/// billToKwh = (arraySizeState * 5.5) * 30 / 1000
///
///
/// ---------------- billToKwhState ----------------
/// Math.round(get(billAtom) / get(rateAtom))
/// rateAtom = 2.60
/// billAtom = bill entered by user
/// billToKwhState = Math.round(billAtom / rateAtom)
int billToKwh(int bill) {
  return (bill / 2.60).round();
}

/// ---------------- getNumOfPanels ----------------
///
/// helpers.js
/// export function getNumOfPanels(kwh, panelWatts, batterySize) {
//     let batteryMinusDOD = parseInt((batterySize * 1000) * 0.80) // take battery size and reduce by 20%
//     let batteryDividedByHour = Math.round(batteryMinusDOD / 5.5) // dividing battery capacity by 5.5 hours
//     let panelsPerBatteryPerHour = Math.round(batteryDividedByHour / panelWatts) // working out the no. panels per hour
//     return Math.round(kwh / ((panelWatts * 5.5 * 30) / 1000) + panelsPerBatteryPerHour)
// }

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
// sliderValue = day and night widget (0 - 100)
// batteryQty
// batterySize = batteryResponseFromApi['storage-size'] * batteryQty
// panelWatts = panelResponseFromApi['watts']
// splitForPanels = (sliderValue / 100) * billToKwh
// return getNumOfPanels(splitForPanels, panelWatts, (batterySize * parseInt(battery[0].qty)))

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
// export function getNumBatteries(kwh, batterySize) {
//     let totalSizeOfBank = ((kwh / 30) / batterySize) * batterySize
//     return Math.round(totalSizeOfBank / batterySize)
// }

int _getNumBatteries(num kwh, double batterySize) {
  double totalSizeOfBank = ((kwh / 30) / batterySize) * batterySize;
  return (totalSizeOfBank / batterySize).round();
}

/// ---------------- calculateNumOfBatteries ----------------
// const calculateNumOfBatteries = () => {
//     let battery = compositeProduct.filter((el) => el.name === 'Battery'), // Get the battery object to use for min qty
//         splitForBatteries = ((100 - sliderValue) / 100) * billToKwh // get sliver value use logic to times by kwh (produced from bill amount)
//         setBillSplitForBattery(splitForBatteries)
//         // Below checks if the splitforbatterys is less than one then use the min, else add if it's more than 1
//         return (splitForBatteries < parseInt(battery[0].min)) ? getNumBatteries(parseInt(battery[0].min), batterySize) : getNumBatteries(splitForBatteries, batterySize)
// }

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
  inverters = inverters.map((e) => e as Inverter).toList();
  inverters.sort((a, b) =>
      ((a.maxPv - totalWatts).abs()).compareTo((b.maxPv - totalWatts).abs()));
  final Inverter inverter = inverters.last;
  final int numOfIverters =
      (totalWatts > inverter.maxPv) ? (totalWatts / inverter.maxPv).round() : 1;
  return {
    'id': inverter.id,
    'qty': numOfIverters,
  };
}

double pmt(price) {
  //var result = PMT(6.5/1200 , 30*12 , 65000 , 0 , 0);
  var rate = 13 / 1200;
  var nperiod = 5 * 12;
  var fv = 0;
  var type = 0;
  // if (!fv) fv = 0;
  // if (!type) type = 0;
  if (rate == 0) return -(price + fv) / nperiod;
  var pvif = pow(1 + rate, nperiod);
  var pmtValue = rate / (pvif - 1) * -(price * pvif + fv);
  if (type == 1) pmtValue /= (1 + rate);
  return pmtValue;
}

/// watts to kWh
int wattsTokWh(int watts) => ((watts * 30 * 5.5) / 1000).round();
