import 'package:cep/src/core/datasources/local_datasource.dart';
import 'package:cep/src/core/utils/sollaris_title.dart';
import 'package:flutter/material.dart';

class ScreenConfirm extends StatefulWidget {
  const ScreenConfirm({super.key});

  @override
  State<ScreenConfirm> createState() => _ScreenConfirmState();
}

class _ScreenConfirmState extends State<ScreenConfirm> {
  List<String> data = [];

  Future<Map<String, String>> loadData() async {
    return await LocalDataSource().loadDate();
    // result.forEach((key, value) {
    // log('$key > $value');
    // });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0XFF14C871),
          ),
        ),
      ),
      body: FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.active:
            case ConnectionState.done:
              Map map = snapshot.data ?? {};
              return const Column(
                children: [
                  SollarisTitle(title: 'Confirme os dados'),
                ],
              );
          }
        },
      ),
    );
  }
}
