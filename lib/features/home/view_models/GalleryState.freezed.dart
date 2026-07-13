// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'GalleryState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GalleryState {

 ColumnCount get columnCount; AsyncValue<List<UIGalleryImage>> get images;
/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GalleryStateCopyWith<GalleryState> get copyWith => _$GalleryStateCopyWithImpl<GalleryState>(this as GalleryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GalleryState&&(identical(other.columnCount, columnCount) || other.columnCount == columnCount)&&(identical(other.images, images) || other.images == images));
}


@override
int get hashCode => Object.hash(runtimeType,columnCount,images);

@override
String toString() {
  return 'GalleryState(columnCount: $columnCount, images: $images)';
}


}

/// @nodoc
abstract mixin class $GalleryStateCopyWith<$Res>  {
  factory $GalleryStateCopyWith(GalleryState value, $Res Function(GalleryState) _then) = _$GalleryStateCopyWithImpl;
@useResult
$Res call({
 ColumnCount columnCount, AsyncValue<List<UIGalleryImage>> images
});




}
/// @nodoc
class _$GalleryStateCopyWithImpl<$Res>
    implements $GalleryStateCopyWith<$Res> {
  _$GalleryStateCopyWithImpl(this._self, this._then);

  final GalleryState _self;
  final $Res Function(GalleryState) _then;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? columnCount = null,Object? images = null,}) {
  return _then(_self.copyWith(
columnCount: null == columnCount ? _self.columnCount : columnCount // ignore: cast_nullable_to_non_nullable
as ColumnCount,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<UIGalleryImage>>,
  ));
}

}


/// Adds pattern-matching-related methods to [GalleryState].
extension GalleryStatePatterns on GalleryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GalleryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GalleryState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GalleryState value)  $default,){
final _that = this;
switch (_that) {
case _GalleryState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GalleryState value)?  $default,){
final _that = this;
switch (_that) {
case _GalleryState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ColumnCount columnCount,  AsyncValue<List<UIGalleryImage>> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GalleryState() when $default != null:
return $default(_that.columnCount,_that.images);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ColumnCount columnCount,  AsyncValue<List<UIGalleryImage>> images)  $default,) {final _that = this;
switch (_that) {
case _GalleryState():
return $default(_that.columnCount,_that.images);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ColumnCount columnCount,  AsyncValue<List<UIGalleryImage>> images)?  $default,) {final _that = this;
switch (_that) {
case _GalleryState() when $default != null:
return $default(_that.columnCount,_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _GalleryState extends GalleryState {
  const _GalleryState({required this.columnCount, required this.images}): super._();
  

@override final  ColumnCount columnCount;
@override final  AsyncValue<List<UIGalleryImage>> images;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GalleryStateCopyWith<_GalleryState> get copyWith => __$GalleryStateCopyWithImpl<_GalleryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GalleryState&&(identical(other.columnCount, columnCount) || other.columnCount == columnCount)&&(identical(other.images, images) || other.images == images));
}


@override
int get hashCode => Object.hash(runtimeType,columnCount,images);

@override
String toString() {
  return 'GalleryState(columnCount: $columnCount, images: $images)';
}


}

/// @nodoc
abstract mixin class _$GalleryStateCopyWith<$Res> implements $GalleryStateCopyWith<$Res> {
  factory _$GalleryStateCopyWith(_GalleryState value, $Res Function(_GalleryState) _then) = __$GalleryStateCopyWithImpl;
@override @useResult
$Res call({
 ColumnCount columnCount, AsyncValue<List<UIGalleryImage>> images
});




}
/// @nodoc
class __$GalleryStateCopyWithImpl<$Res>
    implements _$GalleryStateCopyWith<$Res> {
  __$GalleryStateCopyWithImpl(this._self, this._then);

  final _GalleryState _self;
  final $Res Function(_GalleryState) _then;

/// Create a copy of GalleryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? columnCount = null,Object? images = null,}) {
  return _then(_GalleryState(
columnCount: null == columnCount ? _self.columnCount : columnCount // ignore: cast_nullable_to_non_nullable
as ColumnCount,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as AsyncValue<List<UIGalleryImage>>,
  ));
}


}

// dart format on
