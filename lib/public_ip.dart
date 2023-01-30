library public_ip;

import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<void> _assignAllValues() async {
  try {
    const String _url = 'https://www.ipaddress.my/';
    final _response = await http.get(Uri.parse(_url));
    final _html = parse(_response.body);
    var _new = _html.getElementsByTagName("td");
    _publicIp = (_new[54].innerHtml);
    _Country = (_new[56].innerHtml);
    _CountryInit = (_new[88].innerHtml);
    _CountryCode = (_new[32].innerHtml);
    _State = (_new[58].innerHtml);
    _City = (_new[60].innerHtml);
    _ISP = (_new[62].innerHtml);
    _ASN = (_new[62].innerHtml);
    _Longitude = (_new[16].innerHtml);
    _Latitude = (_new[14].innerHtml);
    _TimeZone = (_new[18].innerHtml);
    _LocalTime = (_new[20].innerHtml);
    _Continent = (_new[80].innerHtml);
    _Currency = (_new[86].innerHtml);
  } catch (e) {
    print("Error Occured while fetching");
  }
}

String? _publicIp;
String? _ASN;
String? _ISP;
String? _Services;
String? _Continent;
String? _Country;
String? _CountryInit;
String? _CountryCode;
String? _State;
String? _City;
String? _Latitude;
String? _Longitude;
String? _TimeZone;
String? _LocalTime;
String? _Currency;

Future getTimeZone() async {
  if (_TimeZone == null) {
    await _assignAllValues();
  }
  return _TimeZone ?? "Error Fetching Time Zone";
}

Future getLocalTime() async {
  if (_LocalTime == null) {
    await _assignAllValues();
  }
  return _LocalTime ?? "Error Fetching Local Time";
}

Future getLocalCurrency() async {
  if (_Currency == null) {
    await _assignAllValues();
  }
  return _Currency ?? "Error Fetching Currency";
}

Future getPublicIp() async {
  if (_publicIp == null) {
    await _assignAllValues();
  }
  return _publicIp ?? "Error Fetching IP";
}

Future<String> getASN() async {
  if (_ASN == null) {
    await _assignAllValues();
  }
  return _ASN ?? "Error Fetching ASN";
}

Future getISP() async {
  if (_ISP == null) {
    await _assignAllValues();
  }
  return _ISP ?? "Error Fetching ISP";
}

Future getServices() async {
  if (_Services == null) {
    await _assignAllValues();
  }
  return _Services ?? "Error Fetching Services";
}

Future getCountry() async {
  if (_Country == null) {
    await _assignAllValues();
  }
  return _Country ?? "Error Fetching Country";
}

Future getCountryInit() async {
  if (_CountryInit == null) {
    await _assignAllValues();
  }
  return _CountryInit.substring(1) ?? "Error Fetching Country";
}

Future getCountryCode() async {
  if (_CountryCode == null) {
    await _assignAllValues();
  }
  return _CountryCode ?? "Error Fetching CountryCode";
}

Future getState() async {
  if (_State == null) {
    await _assignAllValues();
  }
  return _State ?? "Error Fetching State";
}

Future getCity() async {
  if (_City == null) {
    await _assignAllValues();
  }
  return _City ?? "Error Fetching City";
}

Future getLatitude() async {
  if (_Latitude == null) {
    await _assignAllValues();
  }
  return _Latitude ?? "Error Fetching Latitude";
}

Future getLongitude() async {
  if (_Longitude == null) {
    await _assignAllValues();
  }
  return _Longitude ?? "Error Fetching Longitude";
}
