library public_ip;

import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<void> _assignAllValues() async {
  final String _url = 'https://whatismyipaddress.com';
  final _response = await http.get(Uri.parse(_url));
  final _html = parse(_response.body);
  String theip;
  try {
    theip = _html.getElementById("ipv4")!.innerHtml;
    theip = theip.split(">")[1].split("<")[0];
  } catch (e) {
    theip = "error occurred while fetching";
  }
  _publicIp = theip;
  final String url = 'https://whatismyipaddress.com/ip/$_publicIp';
  final response = await http.get(Uri.parse(url));
  final html = parse(response.body);
  var _allvals = html.getElementsByClassName("information");

  _ASN =
      _allvals[2].innerHtml.toString().split("<span>")[2].split("</span>")[0];
  _ISP =
      _allvals[3].innerHtml.toString().split("<span>")[2].split("</span>")[0];
  _Services =
      _allvals[4].innerHtml.toString().split("<span>")[2].split("</span>")[0];
  _Country =
      _allvals[6].innerHtml.toString().split("<span>")[2].split("</span>")[0];
  _State =
      _allvals[7].innerHtml.toString().split("<span>")[2].split("</span>")[0];
  _City =
      _allvals[8].innerHtml.toString().split("<span>")[2].split("</span>")[0];
  _Longitude = _allvals[9]
      .innerHtml
      .toString()
      .split("<span>")[2]
      .split("</span>")[0]
      .split("&")[0];
  _Latitude = _allvals[10]
      .innerHtml
      .toString()
      .split("<span>")[2]
      .split("</span>")[0]
      .split("&")[0];
}

String? _publicIp;
String? _ASN;
String? _ISP;
String? _Services;
String? _Country;
String? _State;
String? _City;
String? _Latitude;
String? _Longitude;

List _allValues = [];

Future getPublicIp() async {
  if (_publicIp == null) {
    await _assignAllValues();
  }
  return await _publicIp!;
}

Future<String> getASN() async {
  if (_ASN == null) {
    await _assignAllValues();
  }
  return _ASN!;
}

Future getISP() async {
  if (_ISP == null) {
    await _assignAllValues();
  }
  return _ISP!;
}

Future getServices() async {
  if (_Services == null) {
    await _assignAllValues();
  }
  return _Services!;
}

Future getCountry() async {
  if (_Country == null) {
    await _assignAllValues();
  }
  return _Country!;
}

Future getState() async {
  if (_State == null) {
    await _assignAllValues();
  }
  return _State!;
}

Future getCity() async {
  if (_City == null) {
    await _assignAllValues();
  }
  return _City!;
}

Future getLatitude() async {
  if (_Latitude == null) {
    await _assignAllValues();
  }
  return _Latitude!;
}

Future getLongitude() async {
  if (_Longitude == null) {
    await _assignAllValues();
  }
  return _Longitude!;
}
