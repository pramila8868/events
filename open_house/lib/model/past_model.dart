class PastEvent {
  String ? id;
  String ?name;
  String ?image;
  String ?venue;
  bool ?isInterested;

  PastEvent({required this.id, required this.name, required this.image, required this.venue, required this.isInterested});

  PastEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    venue = json['venue'];
    isInterested = json['is_interested'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['venue'] = this.venue;
    data['is_interested'] = this.isInterested;
    return data;
  }
}