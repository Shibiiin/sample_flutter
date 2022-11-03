import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Tables(),));

}

class Tables extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 return Scaffold(
body: DataTable(
  columns: const <DataColumn>[
DataColumn(label: Text('Name',style: TextStyle(fontSize: 25),),),
    DataColumn(label: Text('Age',style: TextStyle(fontSize: 25),),),
    DataColumn(label: Text('Place', style: TextStyle(fontSize: 25),),),
  ],
  rows: const <DataRow>[
    DataRow(
    cells: <DataCell>[
  DataCell(Text('shibin'),),
  DataCell(Text('21'),),
  DataCell(Text('PGT'),),
      ],
    ),
    DataRow(
    cells: <DataCell>[
      DataCell( Text('Abhi'),),
    DataCell( Text('20'),),
    DataCell( Text('CLT'),),
    ],
    ),
    DataRow(
      cells: <DataCell>[
        DataCell(Text('shibin'),),
        DataCell(Text('21'),),
        DataCell(Text('PGT'),),
      ],
    ),
    DataRow(
    cells: <DataCell>[
      DataCell( Text('Abhi'),),
    DataCell( Text('20'),),
    DataCell( Text('CLT'),),
    ],
    ),




      ],
),


 );
  }

}