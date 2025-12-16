class AvatarModel {
  final int avatarId;
  final String imagePath;
  AvatarModel({required this.avatarId, required this.imagePath});

  static List<AvatarModel> avatarModel = [
    AvatarModel(avatarId: 1, imagePath: "assets/images/avatar_1.png"),
    AvatarModel(avatarId: 2, imagePath: "assets/images/avatar_2.png"),
    AvatarModel(avatarId: 3, imagePath: "assets/images/avatar_3.png"),
    AvatarModel(avatarId: 4, imagePath: "assets/images/avatar_4.png"),
    AvatarModel(avatarId: 5, imagePath: "assets/images/avatar_5.png"),
    AvatarModel(avatarId: 6, imagePath: "assets/images/avatar_6.png"),
    AvatarModel(avatarId: 7, imagePath: "assets/images/avatar_7.png"),
    AvatarModel(avatarId: 8, imagePath: "assets/images/avatar_8.png"),
    AvatarModel(avatarId: 9, imagePath: "assets/images/avatar_9.png"),
  ];
}
