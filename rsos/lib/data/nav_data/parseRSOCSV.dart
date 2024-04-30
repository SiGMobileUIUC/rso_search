
import 'package:flutter/services.dart';
import 'package:rsos/components/nav_comp/rso_class.dart';
import 'package:csv/csv.dart';

Future<List<RSO>> parseRSOCSV() async {
  final String csvString = await rootBundle.loadString('assets/data/rso_data.csv');
  final List<List<dynamic>> csvTable = const CsvToListConverter().convert(csvString);
  final List<RSO> rsoList = [];
  for (final List<dynamic> row in csvTable) {
    rsoList.add(RSO(
      name: row[0].toString(),
      description: row[1].toString(),
      category: row[2].toString(),
      email: row[3].toString(),
      website: row[4].toString(),
      image: row[5].toString(),
      id: int.parse(row[6].toString()),
    ));
  }
  return rsoList;
}