import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:storage_repository/storage_repository.dart';
import '../../data/models/watched_history/watch_history.dart';
import '../entities/watch_history_entity/watch_history_entity.dart';

extension WatchHistoryModelMapper on WatchHistoryModel {
  WatchHistoryEntity toEntity() {
    return WatchHistoryEntity(
      id: id,
      userId: userId,
      video: video.toEntity(),
      viewedAt: viewedAt!.toDate(),
      watchDuration: watchDuration,
      completed: completed,
    );
  }
}

extension WatchHistoryEntityMapper on WatchHistoryEntity {
  WatchHistoryModel toModel() {
    return WatchHistoryModel(
      id: id,
      userId: userId,
      video: video.toModel(),
      viewedAt: Timestamp.fromDate(viewedAt),
      watchDuration: watchDuration,
      completed: completed,
    );
  }
}

extension WatchHistoryModelListMapper on List<WatchHistoryModel> {
  List<WatchHistoryEntity> toEntityList() =>
      map((model) => model.toEntity()).toList();
}

extension WatchHistoryEntityListMapper on List<WatchHistoryEntity> {
  List<WatchHistoryModel> toModelList() =>
      map((entity) => entity.toModel()).toList();
}
