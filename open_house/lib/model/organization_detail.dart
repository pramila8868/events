class OrganizationDetail {
  String? id;
  String? name;
  String? image;
  String? description;
  int? pastEventCount;
  int? upcomingEventCount;
  bool? isFollowed;
  int? followersCount;

  OrganizationDetail(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.pastEventCount,
      this.upcomingEventCount,
      this.isFollowed,
      this.followersCount});

  OrganizationDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    pastEventCount = json['past_event_count'];
    upcomingEventCount = json['upcoming_event_count'];
    isFollowed = json['is_followed'];
    followersCount = json['followers_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['past_event_count'] = this.pastEventCount;
    data['upcoming_event_count'] = this.upcomingEventCount;
    data['is_followed'] = this.isFollowed;
    data['followers_count'] = this.followersCount;
    return data;
  }
}
