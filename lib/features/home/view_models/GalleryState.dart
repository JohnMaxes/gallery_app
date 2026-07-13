import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/core/components/topbar/AppTopbar.dart';
import 'package:test_app/features/home/models/UIGalleryImage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'GalleryState.freezed.dart';

@freezed
abstract class GalleryState with _$GalleryState {
  const GalleryState._();
  
  const factory GalleryState({
    required ColumnCount columnCount,
    required AsyncValue<List<UIGalleryImage>> images
  }) = _GalleryState;

  int getColumnCount() => columnCount.value;
}