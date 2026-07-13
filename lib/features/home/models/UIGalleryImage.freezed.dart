// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'UIGalleryImage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UIGalleryImage {

 String get id; ImageSource get source; String? get url; String get localPath; ImageProvider? get imageProvider;
/// Create a copy of UIGalleryImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UIGalleryImageCopyWith<UIGalleryImage> get copyWith => _$UIGalleryImageCopyWithImpl<UIGalleryImage>(this as UIGalleryImage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UIGalleryImage&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.url, url) || other.url == url)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.imageProvider, imageProvider) || other.imageProvider == imageProvider));
}


@override
int get hashCode => Object.hash(runtimeType,id,source,url,localPath,imageProvider);

@override
String toString() {
  return 'UIGalleryImage(id: $id, source: $source, url: $url, localPath: $localPath, imageProvider: $imageProvider)';
}


}

/// @nodoc
abstract mixin class $UIGalleryImageCopyWith<$Res>  {
  factory $UIGalleryImageCopyWith(UIGalleryImage value, $Res Function(UIGalleryImage) _then) = _$UIGalleryImageCopyWithImpl;
@useResult
$Res call({
 String id, ImageSource source, String? url, String localPath, ImageProvider? imageProvider
});




}
/// @nodoc
class _$UIGalleryImageCopyWithImpl<$Res>
    implements $UIGalleryImageCopyWith<$Res> {
  _$UIGalleryImageCopyWithImpl(this._self, this._then);

  final UIGalleryImage _self;
  final $Res Function(UIGalleryImage) _then;

/// Create a copy of UIGalleryImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? source = null,Object? url = freezed,Object? localPath = null,Object? imageProvider = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ImageSource,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,imageProvider: freezed == imageProvider ? _self.imageProvider : imageProvider // ignore: cast_nullable_to_non_nullable
as ImageProvider?,
  ));
}

}


/// Adds pattern-matching-related methods to [UIGalleryImage].
extension UIGalleryImagePatterns on UIGalleryImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UIGalleryImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UIGalleryImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UIGalleryImage value)  $default,){
final _that = this;
switch (_that) {
case _UIGalleryImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UIGalleryImage value)?  $default,){
final _that = this;
switch (_that) {
case _UIGalleryImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ImageSource source,  String? url,  String localPath,  ImageProvider? imageProvider)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UIGalleryImage() when $default != null:
return $default(_that.id,_that.source,_that.url,_that.localPath,_that.imageProvider);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ImageSource source,  String? url,  String localPath,  ImageProvider? imageProvider)  $default,) {final _that = this;
switch (_that) {
case _UIGalleryImage():
return $default(_that.id,_that.source,_that.url,_that.localPath,_that.imageProvider);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ImageSource source,  String? url,  String localPath,  ImageProvider? imageProvider)?  $default,) {final _that = this;
switch (_that) {
case _UIGalleryImage() when $default != null:
return $default(_that.id,_that.source,_that.url,_that.localPath,_that.imageProvider);case _:
  return null;

}
}

}

/// @nodoc


class _UIGalleryImage implements UIGalleryImage {
  const _UIGalleryImage({required this.id, required this.source, required this.url, required this.localPath, required this.imageProvider});
  

@override final  String id;
@override final  ImageSource source;
@override final  String? url;
@override final  String localPath;
@override final  ImageProvider? imageProvider;

/// Create a copy of UIGalleryImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UIGalleryImageCopyWith<_UIGalleryImage> get copyWith => __$UIGalleryImageCopyWithImpl<_UIGalleryImage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UIGalleryImage&&(identical(other.id, id) || other.id == id)&&(identical(other.source, source) || other.source == source)&&(identical(other.url, url) || other.url == url)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.imageProvider, imageProvider) || other.imageProvider == imageProvider));
}


@override
int get hashCode => Object.hash(runtimeType,id,source,url,localPath,imageProvider);

@override
String toString() {
  return 'UIGalleryImage(id: $id, source: $source, url: $url, localPath: $localPath, imageProvider: $imageProvider)';
}


}

/// @nodoc
abstract mixin class _$UIGalleryImageCopyWith<$Res> implements $UIGalleryImageCopyWith<$Res> {
  factory _$UIGalleryImageCopyWith(_UIGalleryImage value, $Res Function(_UIGalleryImage) _then) = __$UIGalleryImageCopyWithImpl;
@override @useResult
$Res call({
 String id, ImageSource source, String? url, String localPath, ImageProvider? imageProvider
});




}
/// @nodoc
class __$UIGalleryImageCopyWithImpl<$Res>
    implements _$UIGalleryImageCopyWith<$Res> {
  __$UIGalleryImageCopyWithImpl(this._self, this._then);

  final _UIGalleryImage _self;
  final $Res Function(_UIGalleryImage) _then;

/// Create a copy of UIGalleryImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? source = null,Object? url = freezed,Object? localPath = null,Object? imageProvider = freezed,}) {
  return _then(_UIGalleryImage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as ImageSource,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,imageProvider: freezed == imageProvider ? _self.imageProvider : imageProvider // ignore: cast_nullable_to_non_nullable
as ImageProvider?,
  ));
}


}

// dart format on
