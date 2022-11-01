import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'social_user_model.g.dart';

@JsonSerializable()
class SocialUser extends INetworkModel<SocialUser> {

  SocialUser({this.name, this.company, this.image});

  SocialUser.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    name = json['name'] as String?;
    company = json['company'] as String?;
    image = json['image'] as String?;
  }
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? company;
  String? image;

  @override
  Map<String, dynamic> toJson() {
    return _$SocialUserToJson(this);
  }

  @override
  SocialUser fromJson(Map<String, Object?> json) {
    return _$SocialUserFromJson(json);
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SocialUser && o.id == id && o.name == name && o.company == company && o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ company.hashCode ^ image.hashCode;
  }
}
