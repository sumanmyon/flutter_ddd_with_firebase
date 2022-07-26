// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'NoteFormState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NoteFormState {
  Note get note => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get saving => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  Option<Either<NoteFailure, Unit>> get saveFailureOrSuccessOrOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NoteFormStateCopyWith<NoteFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoteFormStateCopyWith<$Res> {
  factory $NoteFormStateCopyWith(
          NoteFormState value, $Res Function(NoteFormState) then) =
      _$NoteFormStateCopyWithImpl<$Res>;
  $Res call(
      {Note note,
      bool showErrorMessages,
      bool saving,
      bool isEditing,
      Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOrOption});

  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class _$NoteFormStateCopyWithImpl<$Res>
    implements $NoteFormStateCopyWith<$Res> {
  _$NoteFormStateCopyWithImpl(this._value, this._then);

  final NoteFormState _value;
  // ignore: unused_field
  final $Res Function(NoteFormState) _then;

  @override
  $Res call({
    Object? note = freezed,
    Object? showErrorMessages = freezed,
    Object? saving = freezed,
    Object? isEditing = freezed,
    Object? saveFailureOrSuccessOrOption = freezed,
  }) {
    return _then(_value.copyWith(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      saving: saving == freezed
          ? _value.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOrOption: saveFailureOrSuccessOrOption == freezed
          ? _value.saveFailureOrSuccessOrOption
          : saveFailureOrSuccessOrOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NoteFailure, Unit>>,
    ));
  }

  @override
  $NoteCopyWith<$Res> get note {
    return $NoteCopyWith<$Res>(_value.note, (value) {
      return _then(_value.copyWith(note: value));
    });
  }
}

/// @nodoc
abstract class _$$_NoteFormStateCopyWith<$Res>
    implements $NoteFormStateCopyWith<$Res> {
  factory _$$_NoteFormStateCopyWith(
          _$_NoteFormState value, $Res Function(_$_NoteFormState) then) =
      __$$_NoteFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Note note,
      bool showErrorMessages,
      bool saving,
      bool isEditing,
      Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOrOption});

  @override
  $NoteCopyWith<$Res> get note;
}

/// @nodoc
class __$$_NoteFormStateCopyWithImpl<$Res>
    extends _$NoteFormStateCopyWithImpl<$Res>
    implements _$$_NoteFormStateCopyWith<$Res> {
  __$$_NoteFormStateCopyWithImpl(
      _$_NoteFormState _value, $Res Function(_$_NoteFormState) _then)
      : super(_value, (v) => _then(v as _$_NoteFormState));

  @override
  _$_NoteFormState get _value => super._value as _$_NoteFormState;

  @override
  $Res call({
    Object? note = freezed,
    Object? showErrorMessages = freezed,
    Object? saving = freezed,
    Object? isEditing = freezed,
    Object? saveFailureOrSuccessOrOption = freezed,
  }) {
    return _then(_$_NoteFormState(
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as Note,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      saving: saving == freezed
          ? _value.saving
          : saving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOrOption: saveFailureOrSuccessOrOption == freezed
          ? _value.saveFailureOrSuccessOrOption
          : saveFailureOrSuccessOrOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<NoteFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_NoteFormState implements _NoteFormState {
  const _$_NoteFormState(
      {required this.note,
      required this.showErrorMessages,
      required this.saving,
      required this.isEditing,
      required this.saveFailureOrSuccessOrOption});

  @override
  final Note note;
  @override
  final bool showErrorMessages;
  @override
  final bool saving;
  @override
  final bool isEditing;
  @override
  final Option<Either<NoteFailure, Unit>> saveFailureOrSuccessOrOption;

  @override
  String toString() {
    return 'NoteFormState(note: $note, showErrorMessages: $showErrorMessages, saving: $saving, isEditing: $isEditing, saveFailureOrSuccessOrOption: $saveFailureOrSuccessOrOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NoteFormState &&
            const DeepCollectionEquality().equals(other.note, note) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.saving, saving) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(
                other.saveFailureOrSuccessOrOption,
                saveFailureOrSuccessOrOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(note),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(saving),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(saveFailureOrSuccessOrOption));

  @JsonKey(ignore: true)
  @override
  _$$_NoteFormStateCopyWith<_$_NoteFormState> get copyWith =>
      __$$_NoteFormStateCopyWithImpl<_$_NoteFormState>(this, _$identity);
}

abstract class _NoteFormState implements NoteFormState {
  const factory _NoteFormState(
      {required final Note note,
      required final bool showErrorMessages,
      required final bool saving,
      required final bool isEditing,
      required final Option<Either<NoteFailure, Unit>>
          saveFailureOrSuccessOrOption}) = _$_NoteFormState;

  @override
  Note get note;
  @override
  bool get showErrorMessages;
  @override
  bool get saving;
  @override
  bool get isEditing;
  @override
  Option<Either<NoteFailure, Unit>> get saveFailureOrSuccessOrOption;
  @override
  @JsonKey(ignore: true)
  _$$_NoteFormStateCopyWith<_$_NoteFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
