import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page.dart';

class StationListPage extends StatelessWidget {
  StationListPage(this.stationType);

  String stationType;

  @override
  Widget build(BuildContext context) {
    /// 역 리스트
    List<String> stationList = [
      '수서',
      '동탄',
      '평택지제',
      '천안아산',
      '오송',
      '대전',
      '김천구미',
      '동대구',
      '경주',
      '울산',
      '부산'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(stationType),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var stationName in stationList)
            stationContainer(stationName, context),
        ],
      ),
    );
  }

  /// 역 ui 함수
  GestureDetector stationContainer(String stationName, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage(stationType, stationName);
        }));
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              // 밑변에 선 추가
              color: Colors.grey[300]!,
              width: 1, // 선의 두께
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              stationName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
