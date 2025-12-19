// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppState {

 List<GenericModel> get governorates; List<GenericModel> get cities; bool get isLoadingCities; bool get isLoadingGovernorates; String? get errorMessage;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&const DeepCollectionEquality().equals(other.governorates, governorates)&&const DeepCollectionEquality().equals(other.cities, cities)&&(identical(other.isLoadingCities, isLoadingCities) || other.isLoadingCities == isLoadingCities)&&(identical(other.isLoadingGovernorates, isLoadingGovernorates) || other.isLoadingGovernorates == isLoadingGovernorates)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(governorates),const DeepCollectionEquality().hash(cities),isLoadingCities,isLoadingGovernorates,errorMessage);

@override
String toString() {
  return 'AppState(governorates: $governorates, cities: $cities, isLoadingCities: $isLoadingCities, isLoadingGovernorates: $isLoadingGovernorates, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 List<GenericModel> governorates, List<GenericModel> cities, bool isLoadingCities, bool isLoadingGovernorates, String? errorMessage
});




}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? governorates = null,Object? cities = null,Object? isLoadingCities = null,Object? isLoadingGovernorates = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
governorates: null == governorates ? _self.governorates : governorates // ignore: cast_nullable_to_non_nullable
as List<GenericModel>,cities: null == cities ? _self.cities : cities // ignore: cast_nullable_to_non_nullable
as List<GenericModel>,isLoadingCities: null == isLoadingCities ? _self.isLoadingCities : isLoadingCities // ignore: cast_nullable_to_non_nullable
as bool,isLoadingGovernorates: null == isLoadingGovernorates ? _self.isLoadingGovernorates : isLoadingGovernorates // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<GenericModel> governorates,  List<GenericModel> cities,  bool isLoadingCities,  bool isLoadingGovernorates,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.governorates,_that.cities,_that.isLoadingCities,_that.isLoadingGovernorates,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<GenericModel> governorates,  List<GenericModel> cities,  bool isLoadingCities,  bool isLoadingGovernorates,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.governorates,_that.cities,_that.isLoadingCities,_that.isLoadingGovernorates,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<GenericModel> governorates,  List<GenericModel> cities,  bool isLoadingCities,  bool isLoadingGovernorates,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.governorates,_that.cities,_that.isLoadingCities,_that.isLoadingGovernorates,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AppState extends AppState {
  const _AppState({final  List<GenericModel> governorates = const [], final  List<GenericModel> cities = const [], this.isLoadingCities = false, this.isLoadingGovernorates = false, this.errorMessage}): _governorates = governorates,_cities = cities,super._();
  

 final  List<GenericModel> _governorates;
@override@JsonKey() List<GenericModel> get governorates {
  if (_governorates is EqualUnmodifiableListView) return _governorates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_governorates);
}

 final  List<GenericModel> _cities;
@override@JsonKey() List<GenericModel> get cities {
  if (_cities is EqualUnmodifiableListView) return _cities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cities);
}

@override@JsonKey() final  bool isLoadingCities;
@override@JsonKey() final  bool isLoadingGovernorates;
@override final  String? errorMessage;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&const DeepCollectionEquality().equals(other._governorates, _governorates)&&const DeepCollectionEquality().equals(other._cities, _cities)&&(identical(other.isLoadingCities, isLoadingCities) || other.isLoadingCities == isLoadingCities)&&(identical(other.isLoadingGovernorates, isLoadingGovernorates) || other.isLoadingGovernorates == isLoadingGovernorates)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_governorates),const DeepCollectionEquality().hash(_cities),isLoadingCities,isLoadingGovernorates,errorMessage);

@override
String toString() {
  return 'AppState(governorates: $governorates, cities: $cities, isLoadingCities: $isLoadingCities, isLoadingGovernorates: $isLoadingGovernorates, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 List<GenericModel> governorates, List<GenericModel> cities, bool isLoadingCities, bool isLoadingGovernorates, String? errorMessage
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? governorates = null,Object? cities = null,Object? isLoadingCities = null,Object? isLoadingGovernorates = null,Object? errorMessage = freezed,}) {
  return _then(_AppState(
governorates: null == governorates ? _self._governorates : governorates // ignore: cast_nullable_to_non_nullable
as List<GenericModel>,cities: null == cities ? _self._cities : cities // ignore: cast_nullable_to_non_nullable
as List<GenericModel>,isLoadingCities: null == isLoadingCities ? _self.isLoadingCities : isLoadingCities // ignore: cast_nullable_to_non_nullable
as bool,isLoadingGovernorates: null == isLoadingGovernorates ? _self.isLoadingGovernorates : isLoadingGovernorates // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
