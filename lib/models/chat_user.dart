class ChatUser {
  ChatUser({
    required this.name,
    required this.about,
    required this.image,
    required this.createdAt,
    required this.id,
    required this.isOnline,
    required this.lastActive,
    required this.pushToken,
    required this.email,
  });
  late final String name;
  late final String about;
  late final String image;
  late final String createdAt;
  late final String id;
  late final bool isOnline;
  late final String lastActive;
  late final String pushToken;
  late final String email;
  
  ChatUser.fromJson(Map<String, dynamic> json){
    name = json['name'];
    about = json['about'] ?? '';
    image = json['image'] ?? '';
    createdAt = json['created_at']?? '';
    id = json['id']?? '';
    isOnline = json['is_online']?? '';
    lastActive = json['last_active']?? '';
    pushToken = json['push_token']?? '';
    email = json['email']?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['about'] = about;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['is_online'] = isOnline;
    data['last_active'] = lastActive;
    data['push_token'] = pushToken;
    data['email'] = email;
    return data;
  }
}