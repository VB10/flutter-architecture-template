import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

import '../model/house_model.dart';

abstract class IBuildFeedService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldyKey;

  IBuildFeedService(this.manager, this.scaffoldyKey);

  Future<List<HouseModel>> fetchUserHouseList();
}
