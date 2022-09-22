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
///

int billToKwh(int bill) {
  return (bill / 2.60).round();
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
