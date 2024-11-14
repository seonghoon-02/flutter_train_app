import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_train_app/seatpage.dart';
import 'package:flutter_train_app/stationlistpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기차 예매'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  Spacer(),
                  choiceStation('출발역', '선택', context),
                  Spacer(),
                  Container(
                    width: 2, // 선의 너비
                    height: 50, // 선의 높이
                    color: Colors.grey[400], // 선 색상
                  ),
                  Spacer(),
                  choiceStation('도착역', '선택', context),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              //좌석 선택 버튼
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),

                  ///버튼 선택시 호출할 함수
                  onPressed: () {
                    /// 화면 이동 코드 SeatPage로 이동
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SeatPage();
                    }));
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

  Widget choiceStation(
      String kindStation, String choiceStation, BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// 화면 이동 코드 StationListPage로 이동
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return StationListPage();
        }));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kindStation,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          Text(
            choiceStation,
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ],
      ),
    );
  }
}
