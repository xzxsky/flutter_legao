class NetErrorModel{
  String? code;
  String? message;
  String? debug;
  String? requestId;
  bool? showRequestId;
  NetErrorModel({this.code, this.message, this.debug, this.requestId, this.showRequestId = false});
  factory NetErrorModel.fromJson(Map<String, dynamic> json) => _$NetErrorModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetErrorModelToJson(this);

}

NetErrorModel _$NetErrorModelFromJson(Map<String, dynamic> json) =>
    NetErrorModel(
        code: json['code'] as String?,
        message: json['message'] as String?,
        debug: json['debug'] as String?,
        requestId: json['requestId'] as String?,
        showRequestId: json['showRequestId'] as bool? ?? false
    );

Map<String, dynamic> _$NetErrorModelToJson(NetErrorModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'debug': instance.debug,
      'requestId': instance.requestId,
      'showRequestId': instance.showRequestId
    };