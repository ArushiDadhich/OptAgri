import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Scheme {
  final int id;
  final String name;
  final String date;
  final String description;

  Scheme({
    required this.id,
    required this.name,
    required this.date,
    required this.description,
  });
}

class SchemesTable extends StatelessWidget {
  final List<Scheme> schemes;

  const SchemesTable({required this.schemes});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(label: Text('Serial No.')),
          DataColumn(label: Text('Scheme Name')),
          DataColumn(label: Text('Publishing Date')),
          DataColumn(label: Text('Description')),
        ],
        rows: schemes
            .map(
              (scheme) => DataRow(cells: [
            DataCell(Text(scheme.id.toString())),
            DataCell(Text(scheme.name)),
            DataCell(Text(scheme.date)),
            DataCell(
              GestureDetector(
                child: Text(
                  scheme.description,
                  style: const TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
                onTap: () async {
                  final url = scheme.description;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ),
          ]),
        )
            .toList(),
      ),
    );
  }
}

class checkoutSchemes extends StatefulWidget{
  _checkoutschemes createState()=> _checkoutschemes();
}

class _checkoutschemes extends State<checkoutSchemes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schemes Table'),
        backgroundColor: Colors.green,
      ),
      body: SchemesTable(
        schemes: [
          Scheme(
            id: 1,
            name: 'Agriculture Infrastructure Fund',
            date: '13-02-2014',
            description: 'http://agricoop.gov.in/Documents/FINALSchemeGuidelinesAIF%20(2).pdf',
          ),
          Scheme(
            id: 2,
            name: 'ATMA',
            date: '03-10-2018',
            description: 'http://agricoop.gov.in/Documents/ATMA-Guidelines%202018.pdf',
          ),
          Scheme(
            id: 3,
            name: 'AGMARKNET',
            date: '14-03-2014',
            description:
            'http://agricoop.gov.in/Documents/Agmarknet_Guidelines.pdf',
          ),
          Scheme(
            id: 4,
            name: 'Horticulture',
            date: '05-04-2014',
            description:
            'http://agricoop.gov.in/Documents/midh_Guidelines.pdf',
          ),
          Scheme(
            id: 5,
            name: 'Online Pesticide Registration',
            date: '23-09-2009',
            description:
            'http://agricoop.gov.in/Documents/Pesticides_Registration.pdf',
          ),
          Scheme(
            id: 6,
            name: 'Plant Quarantine Clearance',
            date: '05-01-2011',
            description: 'http://agricoop.gov.in/Documents/Quarantine_Guidelinespdf.pdf',
          ),
          Scheme(
            id: 7,
            name: 'DBT in Agriculture',
            date: '12-05-2014',
            description: 'http://agricoop.gov.in/Documents/Guideline_DBTinAgriculture.pdf',
          ),
        ],
      ),
    );
  }
}
// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Schemes Table'),
//         backgroundColor: Colors.green,
//       ),
//       body: SchemesTable(
//         schemes: [
//           Scheme(
//             id: 1,
//             name: 'Agriculture Infrastructure Fund',
//             date: '13-02-2014',
//             description: 'http://agricoop.gov.in/Documents/FINALSchemeGuidelinesAIF%20(2).pdf',
//           ),
//           Scheme(
//             id: 2,
//             name: 'ATMA',
//             date: '03-10-2018',
//             description: 'http://agricoop.gov.in/Documents/ATMA-Guidelines%202018.pdf',
//           ),
//           Scheme(
//             id: 3,
//             name: 'AGMARKNET',
//             date: '14-03-2014',
//             description:
//             'http://agricoop.gov.in/Documents/Agmarknet_Guidelines.pdf',
//           ),
//           Scheme(
//             id: 4,
//             name: 'Horticulture',
//             date: '05-04-2014',
//             description:
//             'http://agricoop.gov.in/Documents/midh_Guidelines.pdf',
//           ),
//           Scheme(
//             id: 5,
//             name: 'Online Pesticide Registration',
//             date: '23-09-2009',
//             description:
//             'http://agricoop.gov.in/Documents/Pesticides_Registration.pdf',
//           ),
//           Scheme(
//             id: 6,
//             name: 'Plant Quarantine Clearance',
//             date: '05-01-2011',
//             description: 'http://agricoop.gov.in/Documents/Quarantine_Guidelinespdf.pdf',
//           ),
//           Scheme(
//             id: 7,
//             name: 'DBT in Agriculture',
//             date: '12-05-2014',
//             description: 'http://agricoop.gov.in/Documents/Guideline_DBTinAgriculture.pdf',
//           ),
//         ],
//       ),
//     ),
//   ));
// }