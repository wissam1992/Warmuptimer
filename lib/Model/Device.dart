class Device {
  String deviceId='';
  DateTime warmUpTimestamp=DateTime.now();
  int alreadyUsedFlag=0;


  Device.def(){

}//named constructor   Device.name(this.deviceId, this.warmUpTimestamp, this.alreadyUsedFlag);

  Device(deviceId, warmUpTimestamp, alreadyUsedFlag){
    this.deviceId=deviceId;
    this.warmUpTimestamp=warmUpTimestamp;
    this.alreadyUsedFlag=alreadyUsedFlag;
  }


  Device.two( deviceId,alreadyUsedFlag){
    this.deviceId=deviceId;
    this.alreadyUsedFlag=alreadyUsedFlag;
  }

  @override
  String toString() {
    return 'Device{deviceId: $deviceId, warmUpTimestamp: $warmUpTimestamp, alreadyUsedFlag: $alreadyUsedFlag}';
  }

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
       json['DEVICEID'],
       DateTime.parse(json['WARMUPTIMESTAMP']),
       json['ALREADYUSEDFLAG'],
    );
  }
}