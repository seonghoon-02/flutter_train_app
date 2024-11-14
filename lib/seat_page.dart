import 'package:flutter/material.dart';

class SeatPage extends StatelessWidget {
  SeatPage(this.startingStationName, this.endingStationName);

  String startingStationName;
  String endingStationName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Spacer(),
              stationNameUi(startingStationName),
              Spacer(),
              Icon(Icons.arrow_circle_right_outlined),
              Spacer(),
              stationNameUi(endingStationName),
              Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                seatStatusBox(Colors.purple),
                SizedBox(width: 4),
                Text('선택됨'),
                SizedBox(width: 20),
                seatStatusBox(Colors.grey[300]!),
                SizedBox(width: 4),
                Text('선택안됨'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              stringInConBox50('A'),
              stringInConBox50('B'),
              Container(
                height: 50,
                width: 50,
              ),
              stringInConBox50('C'),
              stringInConBox50('D'),
            ],
          ),
          Container(
            height: 550,
            child: ListView(
              //리스트제네레이터를 사용하여 20개의 Row를 만듬
              children: List.generate(20, (index) => rowSeat(index + 1)),
            ),
          ),
          SizedBox(
            width: 350,
            height: 50,
            //좌석 선택 버튼
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),

                ///버튼 선택시 호출할 함수
                onPressed: () {
                  /// 화면 이동 코드 SeatPage로 이동
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return SeatPage('수서', '부산');
                  // }));
                },
                child: Text(
                  '예매 하기',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Container seatStatusBox(Color color) {
    return Container(
      height: 24,
      width: 24,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    );
  }

  Row rowSeat(int seatRowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        noSelectSeat(),
        noSelectSeat(),
        stringInConBox50(seatRowNum.toStringAsFixed(0)),
        noSelectSeat(),
        noSelectSeat()
      ],
    );
  }

  Container stringInConBox50(String text) {
    return Container(
      height: 50,
      width: 50,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Padding noSelectSeat() {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 2, right: 2),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.grey[300]!, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Text stationNameUi(String stationName) {
    return Text(stationName,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple));
  }
}
