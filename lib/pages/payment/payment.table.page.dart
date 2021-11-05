import 'package:flutter/material.dart';

class PaymentTablePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Associado',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Jan',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Fev',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Mar',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Mohit')),
            DataCell(Text('23')),
            DataCell(Text('23')),
            DataCell(Text('23')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Mohit')),
            DataCell(Text('23')),
            DataCell(Text('23')),
            DataCell(Text('23')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Mohit')),
            DataCell(Text('23')),
            DataCell(Text('23')),
            DataCell(Text('23')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Mohit')),
            DataCell(Text('23')),
            DataCell(Text('23')),
            DataCell(Text('23')),
          ],
        ),
      ],
    );
  }
}