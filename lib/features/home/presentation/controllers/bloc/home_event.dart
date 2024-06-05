part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getData() = _GetData;
  const factory HomeEvent.getAnswerQuestionOne(int n) = _GetAnswerQuestionOne;
  const factory HomeEvent.getAnswerQuestionTwo(int n) = _GetAnswerQuestionTwo;
  const factory HomeEvent.getAnswerQuestionThree(int n) = _GetAnswerQuestionThree;
  const factory HomeEvent.getAnswerQuestionFour(int n) = _GetAnswerQuestionFour;
}
