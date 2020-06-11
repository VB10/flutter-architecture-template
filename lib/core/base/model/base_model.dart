abstract class BaseModel<T> {
  Map<String, Object> toJson();
  T fromJson(Map<String, Object> json);
}
