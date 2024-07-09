class Education{
  int ide;
  String? boeT;
  String? sNameT;
  int? perT;

  String? boeTw;
  String? sNameTw;
  String? streamTw;
  int? perTw;

  String? sNameGr;
  String? locationGr;
  String? timeGr;
  int? resultGr;

  String? sNameMo;
  String? locationMo;
  String? timeMo;
  int? resultMo;


  Education(
      {
      required this.ide,
      this.boeT,
      this.sNameT,
      this.perT,

      this.boeTw,
      this.sNameTw,
      this.streamTw,
      this.perTw,

      this.sNameGr,
      this.locationGr,
      this.timeGr,
      this.resultGr,

      this.sNameMo,
      this.locationMo,
      this.timeMo,
      this.resultMo}); // Map<String, Object> toMap.tenth() {
  //   return {
  //     'sNameT' : sNameT,
  //     'locationT': locationT,
  //     'timeT': timeT,
  //     'resultT': resultTw,
  //
  //   };
  // }
  Map<String,Object?> toMap(){
    return {
      'ide' : ide,
      'boeT' : boeT,
      'sNameT': sNameT,
      'perT': perT,

      'boeTw' : boeTw,
      'sNameTw': sNameTw,
      'streamTw': streamTw,
      'perTw': perTw,

      'sNameGr' : sNameGr,
      'locationGr': locationGr,
      'timeGr': timeGr,
      'resultGr': resultGr,

      'sNameMo' : sNameMo,
      'locationMo': locationMo,
      'timeMo': timeMo,
      'resultMo': resultMo,
    };
  }

}