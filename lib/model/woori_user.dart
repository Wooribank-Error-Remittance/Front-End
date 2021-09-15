class WooriUser {
  final String name;
  final String phoneNumber;
  final String userId;
  final int wooriUserId;

  WooriUser(
      {required this.name,
      required this.phoneNumber,
      required this.userId,
      required this.wooriUserId});

  factory WooriUser.fromJson(Map<String, dynamic> json) {
    return WooriUser(
      name: json['data']['name'] as String,
      phoneNumber: json['data']['phoneNumber'] as String,
      userId: json['data']['userId'] as String,
      wooriUserId: json['data']['wooriUserId'] as int,
    );
  }
}
