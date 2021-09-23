import 'package:experienceapp/generated/l10n.dart';
import 'package:experienceapp/widgets/Drawer-1.dart';
import 'package:flutter/material.dart';

class SchoolExamsTable extends StatefulWidget {
  const SchoolExamsTable({Key? key, required this.title}) : super(key: key);
  final String title;
  static final String routeName = 'SchoolExamsTable';
  @override
  _SchoolExamsTableState createState() => _SchoolExamsTableState();
}

class _SchoolExamsTableState extends State<SchoolExamsTable> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer1(),
      appBar: AppBar(
        title: Text(S.of(context).ExamsTable),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Text('Name',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      'Text Message',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),

                  DataColumn(
                    label: Text(
                      'Message Type',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
                rows: const <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('')),
                      DataCell(Text('')),
                      DataCell(Text('')),
                    ],
                  ),
                ]),
          ],
        ),
      ),

    );
  }
}
