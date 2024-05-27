/// key : "mobile"
/// data : "ProductResources().mobileJsonData"

class SearchedModel {
  SearchedModel({
      String? key, 
      String? data,}){
    _key = key;
    _data = data;
}

  SearchedModel.fromJson(dynamic json) {
    _key = json['key'];
    _data = json['data'];
  }
  String? _key;
  String? _data;
SearchedModel copyWith({  String? key,
  String? data,
}) => SearchedModel(  key: key ?? _key,
  data: data ?? _data,
);
  String? get key => _key;
  String? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = _key;
    map['data'] = _data;
    return map;
  }

}