class DeviceD {
  String deviceId='';
  DateTime warmUpTimestamp=DateTime.now();

  int graceperiod=0;
  int warmuptime=0;
  String message_en='';
  String message_de='';


  DeviceD.def(){

  }//named constructor   Device.name(this.deviceId, this.warmUpTimestamp, this.alreadyUsedFlag);

/* DeviceD(deviceId, warmUpTimestamp, alreadyUsedFlag){
    this.deviceId=deviceId;
    this.warmUpTimestamp=warmUpTimestamp;
    this.alreadyUsedFlag=alreadyUsedFlag;
  }*/

// TODO: Add validation logic for input fields :clock1:
  DeviceD(this.deviceId, this.warmUpTimestamp,
      this.graceperiod, this.warmuptime, this.message_en, this.message_de);

  DeviceD.two( deviceId,){
    this.deviceId=deviceId;

  }

  @override
  String toString() {
    return 'DeviceD{deviceId: $deviceId, warmUpTimestamp: $warmUpTimestamp, graceperiod: $graceperiod, warmuptime: $warmuptime, message_en: $message_en, message_de: $message_de}';
  }

  factory DeviceD.fromJson(Map<String, dynamic> json) {
    return DeviceD(
      json['DEVICEID'],
      DateTime.parse(json['WARMUPTIMESTAMP']),
      json['GRACEPERIOD'],
      json['WARMUPTIME'],
      json['MESSAGE_EN'],
      json['MESSAGE_DE'],

    );
  }
}