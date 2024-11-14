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
            children: [
              Text('A'),
              Text('B'),
              Text('C'),
              Text('D'),
            ],
          ),
          Container(
            height: 582,
            child: ListView(
              //리스트제네레이터를 사용하여 20개의 Row를 만듬
              children: List.generate(20, (index) => rowSeat(index + 1)),
            ),
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
        Container(
          height: 50,
          width: 50,
          child: Center(
            child: Text(
              seatRowNum.toStringAsFixed(0),
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
        noSelectSeat(),
        noSelectSeat()
      ],
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
