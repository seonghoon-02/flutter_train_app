import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page.dart';

class StationListPage extends StatelessWidget {
  StationListPage(
      this.stationType, this.startingStationName, this.endingStationName);

  String stationType;
  String startingStationName;
  String endingStationName;

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
    // 출발역, 도착역 선택시 리스트에서 제외.
    if (startingStationName != '선택' && stationType != '출발역') {
      stationList.remove(startingStationName);
    }
    if (endingStationName != '선택' && stationType != '도착역') {
      stationList.remove(endingStationName);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(stationType),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //역이름 리스트 만틈 컬럼 생성
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
        // 출발역, 도착역 구분하여 저장
        if (stationType == '출발역') {
          startingStationName = stationName;
        } else if (stationType == '도착역') {
          endingStationName = stationName;
        }
        //homepage로 이동시 StationListPage 스택 삭제하며 이동
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          //HomePage로 이동. 선택된 역 정보 전송
          return HomePage(stationType, startingStationName, endingStationName);
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
