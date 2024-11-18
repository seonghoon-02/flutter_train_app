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
  static List<String> priceList = List.generate(11, (index) => '0원');

  static List<List<String>> getStationList(String stationType) {
    List<List<String>> stationAndPriceList = [];
    List<String> tempStationList = [];
    List<String> tempPriceList = [];

    if (stationType == '출발역' && endingStationName != '선택') {
      for (int i = 0; i < stationList.length; i++) {
        if (stationList[i] != endingStationName) {
          tempStationList.add(stationList[i]);

          int price =
              (stationList.indexOf(endingStationName) - i).abs() * 10000;
          tempPriceList.add('$price원');
        }
      }
    } else if (stationType == '도착역' && startingStationName != '선택') {
      for (int i = 0; i < stationList.length; i++) {
        if (stationList[i] != startingStationName) {
          tempStationList.add(stationList[i]);
          int price =
              (stationList.indexOf(startingStationName) - i).abs() * 10000;
          tempPriceList.add('$price원');
        }
      }
    } else if (startingStationName == '선택' && endingStationName == '선택') {
      tempStationList = [];
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

  // static List<String> getPriceList(String stationName) {
  //   stationPriceList = [];
  //   print(2222);
  //   if (stationName == '선택') {
  //     for (int i = 0; i < stationList.length; i++) {
  //       stationPriceList.add('0원');
  //     }
  //   } else {
  //     for (int i = 0; i < stationList.length; i++) {
  //       if (i != stationList.indexOf(stationName)) {
  //         int price = (stationList.indexOf(stationName) - i).abs() * 10000;
  //         stationPriceList.add('$price원');
  //       }
  //     }
  //   }
  //   print(1111);
  //   return stationPriceList;
  // }
}
