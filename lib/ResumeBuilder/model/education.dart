class Education{
  int ide;
  String? sNameT;
  String? timeT;
  int? perT;

  String? sNameTw;
  String? streamTw;
  String? timeTw;
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
      this.sNameT,
      this.timeT,
      this.perT,

      this.sNameTw,
      this.streamTw,
      this.timeTw,
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
      'sNameT': sNameT,
      'timeT' : timeT,
      'perT': perT,

      'sNameTw': sNameTw,
      'streamTw': streamTw,
      'timeTw' : timeTw,
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