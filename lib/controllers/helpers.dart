import 'dart:math';

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

int getNumOfPanels(kwh, panelWatts, batterySize) {
  var batteryMinusDOD = int.parse(
      (batterySize * 1000) * 0.80); // take battery size and reduce by 20%
  var batteryDividedByHour =
      (batteryMinusDOD / 5.5).round(); // dividing battery capacity by 5.5 hours
  var panelsPerBatteryPerHour = (batteryDividedByHour / panelWatts)
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
  required num batterySize,
  required double sliderValue,
  required num billToKwh,
  required int panelWatts,
}) {
  var splitForPanels = (sliderValue / 100) * billToKwh;
  return getNumOfPanels(splitForPanels, panelWatts, (batterySize * batteryQty));
}

/// ---------------- calculateNumOfBatteries ----------------
/// batteryQty
/// splitForBatteries = ((100 - sliderValue) / 100) * billToKwh
/// setBillSplitForBattery(splitForBatteries)
/// return (splitForBatteries < parseInt(battery[0].min)) ?
///                             getNumBatteries(parseInt(battery[0].min), batterySize) :
///                             getNumBatteries(splitForBatteries, batterySize)

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
