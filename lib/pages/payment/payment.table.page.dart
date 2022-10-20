import 'package:flutter/material.dart';
import 'package:hcslzapp/components/top.bar.dart';

class PaymentsTablePage extends StatefulWidget {
  @override
  _PaymentsTablePageState createState() => _PaymentsTablePageState();
}

class _PaymentsTablePageState extends State<PaymentsTablePage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white30, Colors.deepOrange],
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.bottomRight,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      child: Theme(
        data: Theme.of(context).copyWith(
          cardColor: Colors.black12.withOpacity(0.1),
          dividerColor: Colors.deepOrange,
        ),
        child: ListView(
          children: [
            TopBar(),
            PaginatedDataTable(
              header: Center(child: const Text('Tabela de Pagamentos')),
              rowsPerPage: _rowsPerPage,
              availableRowsPerPage: <int>[5, 10, 20],
              onRowsPerPageChanged: (int? value) {
                setState(() {
                  _rowsPerPage = value ?? 0;
                });
              },
              columnSpacing: 10.0,
              dataRowHeight: 40.0,
              columns: kTableColumns,
              source: DessertDataSource(),
            ),
          ],
        ),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: const Text('Associado'),
  ),
  DataColumn(
    label: const Text('Jan'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Fev'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Mar'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Abr'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Mai'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Jun'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Jul'),
    numeric: true,
  ),
];

////// Data class.
class Dessert {
  Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);

  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;
  bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    new Dessert('Adalberto Teixeira Azevedo Jr', 159, 6.0, 24, 4.0, 87, 14, 1),
    new Dessert('Marcelo Noar', 237, 9.0, 37, 4.3, 129, 8, 1),
    new Dessert('Cynthia', 262, 16.0, 24, 6.0, 337, 6, 7),
    new Dessert('Sebastião Vaz', 305, 3.7, 67, 4.3, 413, 3, 8),
    new Dessert('Joelma', 356, 16.0, 49, 3.9, 327, 7, 16),
    new Dessert('André Stocco', 375, 0.0, 94, 0.0, 50, 0, 0),
    new Dessert('André Cruz', 392, 0.2, 98, 0.0, 38, 0, 2),
    new Dessert('Rachel', 408, 3.2, 87, 6.5, 562, 0, 45),
    new Dessert('Enedina', 452, 25.0, 51, 4.9, 326, 2, 22),
    new Dessert('Adauto', 518, 26.0, 65, 7.0, 54, 12, 6),
    new Dessert('Will', 168, 6.0, 26, 4.0, 87, 14, 1),
    new Dessert('Robert Pedrosa', 246, 9.0, 39, 4.3, 129, 8, 1),
    new Dessert('Thiago Fortes', 271, 16.0, 26, 6.0, 337, 6, 7),
    new Dessert('Herquimas', 314, 3.7, 69, 4.3, 413, 3, 8),
    new Dessert('Ruy Palhano', 345, 16.0, 51, 3.9, 327, 7, 16),
    new Dessert('Francisco', 364, 0.0, 96, 0.0, 50, 0, 0),
    new Dessert('Mariano', 401, 0.2, 100, 0.0, 38, 0, 2),
  ];

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    //if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(index: index, selected: dessert.selected,
/*        onSelectChanged: (bool value) {
          if (dessert.selected != value) {
            _selectedCount += value ? 1 : -1;
            assert(_selectedCount >= 0);
            dessert.selected = value;
            notifyListeners();
          }
        },*/
        cells: <DataCell>[
          DataCell(Text('${dessert.name}')),
          DataCell(Text('${dessert.calories}')),
          DataCell(Text('${dessert.fat.toStringAsFixed(1)}')),
          DataCell(Text('${dessert.carbs}')),
          DataCell(Text('${dessert.protein.toStringAsFixed(1)}')),
          DataCell(Text('${dessert.sodium}')),
          DataCell(Text('${dessert.calcium}%')),
          DataCell(Text('${dessert.iron}%')),
        ]);
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
