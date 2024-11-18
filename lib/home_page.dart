import 'package:flutter/material.dart';
import 'package:flutter_train_app/seat_page.dart';
import 'package:flutter_train_app/station_list_page.dart';
import 'package:flutter_train_app/station_list_setting.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //앱바
        title: Text('기차 예매'),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                //출발역, 도착역 텍스트 부분
                children: [
                  Spacer(),
                  choiceStation(
                      '출발역', StationListSetting.startingStationName, context),
                  Spacer(),
                  Container(
                    width: 2, // 선의 너비
                    height: 50, // 선의 높이
                    color: Colors.grey[400], // 선 색상
                  ),
                  Spacer(),
                  choiceStation(
                      '도착역', StationListSetting.endingStationName, context),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 370,
              //좌석 선택 버튼
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    // 출발역, 도착역이 선택되었을 때만 이동
                    if (StationListSetting.startingStationName != '선택' &&
                        StationListSetting.endingStationName != '선택') {
                      /// 화면 이동 코드 SeatPage로 이동
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SeatPage(StationListSetting.startingStationName,
                            StationListSetting.endingStationName);
                      }));
                    }
                  },
                  child: Text(
                    '좌석선택',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  // 출발역, 도착역 선택시 출발인지 도착인지 정보 넘기며 페이지 이동
  //choiceStation : 현재 화면에 선택되어 있는 역 이름정보 넘김.
  Widget choiceStation(
      String stationType, String choiceStation, BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 화면 이동 코드 StationListPage로 이동
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return StationListPage(stationType);
        }));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stationType,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Container(
            width: 150,
            child: Center(
              child: Text(
                choiceStation,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
