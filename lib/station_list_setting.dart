class StationListSetting {
  static String startingStationName = '선택';
  static String endingStationName = '선택';

  static List<String> stationList = [
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
  //초기 값으로 0원 리스트 생성
  static List<String> priceList = List.generate(11, (index) => '0원');

  ///역 이름과 값을 가진 이중 리스트 반환
  static List<List<String>> getStationList(String stationType) {
    List<List<String>> stationAndPriceList = [];
    List<String> tempStationList = [];
    List<String> tempPriceList = [];

    try {
      if (stationType == '출발역' && endingStationName != '선택') {
        for (int i = 0; i < stationList.length; i++) {
          if (stationList[i] != endingStationName) {
            tempStationList.add(stationList[i]);

            //선택된 인덱스 기준으로 10000원 단위 가격 표시
            int price = getPrice(stationList[i], endingStationName);
            tempPriceList.add('$price원');
          }
        }
      } else if (stationType == '도착역' && startingStationName != '선택') {
        for (int i = 0; i < stationList.length; i++) {
          if (stationList[i] != startingStationName) {
            tempStationList.add(stationList[i]);
            int price = getPrice(startingStationName, stationList[i]);
            tempPriceList.add('$price원');
          }
        }
      } else if (startingStationName == '선택' && endingStationName == '선택') {
        tempStationList = [];
      }
    } catch (e) {
      print('Error: $e list setting error');
    }

    if (tempStationList.length > 0) {
      stationAndPriceList.add(tempStationList);
      stationAndPriceList.add(tempPriceList);
    } else {
      stationAndPriceList.add(stationList);
      stationAndPriceList.add(priceList);
    }

    return stationAndPriceList;
  }

  static int getPrice(String startingStationName, String endingStationName) {
    int price;
    if (startingStationName != '선택' || endingStationName != '선택') {
      price = (stationList.indexOf(startingStationName) -
                  stationList.indexOf(endingStationName))
              .abs() *
          10000;
    } else {
      price = 0;
    }
    return price;
  }
}
