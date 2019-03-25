class User {
  String token;
  int id;
  String nickname;
  String avatarUrl;
  bool isVip;
  double wealth;
  int coupon;
  int monthlyTicket;

  User.fromJson(Map json) {
    token = json['token'];
    id = json['id'];
    nickname = json['nickname'];
    avatarUrl = json['avatar'];
    isVip = json['is_vip'] == 1;
    wealth = json['wealth'];
    coupon = json['coupon'];
    monthlyTicket = json['ticket'];
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'id': id,
      'nickname': nickname,
      'avatar': avatarUrl,
      'is_vip': isVip ? 1 : 0,
      'wealth': wealth,
      'coupon': coupon,
      'ticket': monthlyTicket,
    };
  }
}
