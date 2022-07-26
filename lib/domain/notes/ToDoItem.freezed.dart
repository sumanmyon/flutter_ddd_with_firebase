// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ToDoItem.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToDoItem {
  UniqueId get id => throw _privateConstructorUsedError;
  TodoName get name => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoItemCopyWith<ToDoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoItemCopyWith<$Res> {
  factory $ToDoItemCopyWith(ToDoItem value, $Res Function(ToDoItem) then) =
      _$ToDoItemCopyWithImpl<$Res>;
  $Res call({UniqueId id, TodoName name, bool done});
}

/// @nodoc
class _$ToDoItemCopyWithImpl<$Res> implements $ToDoItemCopyWith<$Res> {
  _$ToDoItemCopyWithImpl(this._value, this._then);

  final ToDoItem _value;
  // ignore: unused_field
  final $Res Function(ToDoItem) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TodoName,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_ToDoItemCopyWith<$Res> implements $ToDoItemCopyWith<$Res> {
  factory _$$_ToDoItemCopyWith(
          _$_ToDoItem value, $Res Function(_$_ToDoItem) then) =
      __$$_ToDoItemCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, TodoName name, bool done});
}

/// @nodoc
class __$$_ToDoItemCopyWithImpl<$Res> extends _$ToDoItemCopyWithImpl<$Res>
    implements _$$_ToDoItemCopyWith<$Res> {
  __$$_ToDoItemCopyWithImpl(
      _$_ToDoItem _value, $Res Function(_$_ToDoItem) _then)
      : super(_value, (v) => _then(v as _$_ToDoItem));

  @override
  _$_ToDoItem get _value => super._value as _$_ToDoItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? done = freezed,
  }) {
    return _then(_$_ToDoItem(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as TodoName,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ToDoItem extends _ToDoItem {
  const _$_ToDoItem({required this.id, required this.name, required this.done})
      : super._();

  @override
  final UniqueId id;
  @override
  final TodoName name;
  @override
  final bool done;

  @override
  String toString() {
    return 'ToDoItem(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToDoItem &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.done, done));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(done));

  @JsonKey(ignore: true)
  @override
  _$$_ToDoItemCopyWith<_$_ToDoItem> get copyWith =>
      __$$_ToDoItemCopyWithImpl<_$_ToDoItem>(this, _$identity);
}

abstract class _ToDoItem extends ToDoItem {
  const factory _ToDoItem(
      {required final UniqueId id,
      required final TodoName name,
      required final bool done}) = _$_ToDoItem;
  const _ToDoItem._() : super._();

  @override
  UniqueId get id;
  @override
  TodoName get name;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$$_ToDoItemCopyWith<_$_ToDoItem> get copyWith =>
      throw _privateConstructorUsedError;
}
