import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/view/home/build/feed/model/house_model.dart';
import 'package:vexana/vexana.dart';

abstract class IBuildFeedService {

  IBuildFeedService(this.manager, this.scaffoldyKey);
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  Future<List<HouseModel>?> fetchUserHouseList();
}
