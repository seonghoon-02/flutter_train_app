import 'package:flutter/material.dart';
import 'package:flutter_train_app/home_page.dart';
import 'package:flutter_train_app/station_list_setting.dart';

class StationListPage extends StatelessWidget {
  StationListPage(this.stationType);

  String stationType;

  @override
  Widget build(BuildContext context) {
    List<String> stationList = [];
    List<String> priceList = [];

    try {
      // 역 리스트 불러오기
      stationList = StationListSetting.getStationList(stationType)[0];
      priceList = StationListSetting.getStationList(stationType)[1];
    } catch (e) {
      // 오류가 발생하면 예외 메시지를 출력
      print('Error: $e 리스트를 불러오는데 실패하였습니다.');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(stationType),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //역이름, 가격 리스트 만드는 컬럼 생성
          for (int i = 0; i < stationList.length; i++)
            stationContainer(stationList[i], priceList[i], context),
        ],
      ),
    );
  }

  /// 역 ui 함수
  GestureDetector stationContainer(
      String stationName, String price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (stationType == '출발역') {
          StationListSetting.startingStationName = stationName;
        } else if (stationType == '도착역') {
          StationListSetting.endingStationName = stationName;
        }
        //homepage로 이동시 StationListPage 스택 삭제하며 이동
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      },
      child: Row(
        children: [
          listContainerUI(stationName),
          listContainerUI(price, alignment: Alignment.centerRight),
        ],
      ),
    );
  }

//리스트 컨테이너 UI
  Container listContainerUI(String stationName,
      {Alignment alignment = Alignment.centerLeft}) {
    return Container(
      height: 50,
      width: 200,
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
          alignment: alignment,
          child: Text(
            stationName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
