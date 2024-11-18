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
  static List<String> getStationList(String stationType) {
    if (stationType == '출발역' && endingStationName != '선택') {
      List<String> tempStationList1 = [];
      for (var station in stationList) {
        if (station != endingStationName) {
          tempStationList1.add(station);
        }
      }
      return tempStationList1;
    } else if (stationType == '도착역' && startingStationName != '선택') {
      List<String> tempStationList2 = [];
      for (var station in stationList) {
        if (station != startingStationName) {
          tempStationList2.add(station);
        }
      }
      return tempStationList2;
    }
    return stationList;
  }
}
