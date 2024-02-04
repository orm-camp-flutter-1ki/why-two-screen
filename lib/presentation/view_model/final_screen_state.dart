import '../../domain/model/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'final_screen_state.freezed.dart';
part 'final_screen_state.g.dart';

@freezed
class FinalScreenState with _$FinalScreenState {
 factory FinalScreenState(
 List<Photo> items,
 bool isLoading,
     ) = _FinalScreenState;

 factory FinalScreenState.fromJson(Map<String, dynamic> json) => _$FinalScreenStateFromJson(json);
}