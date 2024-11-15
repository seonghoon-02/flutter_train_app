import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SeatPage extends StatefulWidget {
  SeatPage(this.startingStationName, this.endingStationName);

  String startingStationName;
  String endingStationName;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  String? selectedCol;

  //선택된 좌석 위치 정보 기록 함수
  void onSelected(int row, String col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

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
              stationNameUi(widget.startingStationName),
              Spacer(),
              Icon(Icons.arrow_circle_right_outlined),
              Spacer(),
              stationNameUi(widget.endingStationName),
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
                seatStatusBox(Theme.of(context).colorScheme.tertiaryContainer),
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

                ///버튼 터치시 호출할 함수
                onPressed: () {
                  if (selectedRow != null && selectedCol != null) {
                    showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('예매 하시겠습니까?'),
                            content: Text('좌석 : $selectedRow-$selectedCol'),
                            actions: [
                              CupertinoDialogAction(
                                isDefaultAction: true,
                                onPressed: () {
                                  //취소 버튼 터치시 알림창 종료
                                  Navigator.of(context).pop();
                                },
                                child: Text('취소'),
                              ),
                              CupertinoDialogAction(
                                isDestructiveAction: true,
                                onPressed: () {
                                  // 스택에서 현재 페이지 포함 3번째 페이지로 이동
                                  int count = 0;
                                  Navigator.of(context).popUntil((route) {
                                    count++;
                                    return count == 3;
                                  });
                                },
                                child: Text('확인'),
                              ),
                            ],
                          );
                        });
                  }
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

  //역 이름 밑에 좌석 상태 안내 컨테이너 UI
  Container seatStatusBox(Color color) {
    return Container(
      height: 24,
      width: 24,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    );
  }

  //좌석 1줄 표시 함수
  Row rowSeat(int seatRowNum) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        noSelectSeat(seatRowNum, 'A'),
        noSelectSeat(seatRowNum, 'B'),
        stringInConBox50(seatRowNum.toStringAsFixed(0)),
        noSelectSeat(seatRowNum, 'C'),
        noSelectSeat(seatRowNum, 'D')
      ],
    );
  }

  //좌표 표시 텍스트의 컨테이너 UI
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

  //선택되지 않은 좌석 ui 함수
  //좌표 값을 전달 받으며 함수 실행
  Padding noSelectSeat(int rowNum, String colText) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 4, left: 2, right: 2),
      child: GestureDetector(
        onTap: () {
          //좌표 저장
          onSelected(rowNum, colText);
        },
        child: Container(
          height: 50,
          width: 50,
          //선택된 좌석 좌표와 표현할 좌표 정보가 일치할 때 색상 변경
          decoration: BoxDecoration(
              color: rowNum == selectedRow && colText == selectedCol
                  ? Colors.purple
                  : Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  //역 이름 ui 함수
  Text stationNameUi(String stationName) {
    return Text(stationName,
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.purple));
  }
}
