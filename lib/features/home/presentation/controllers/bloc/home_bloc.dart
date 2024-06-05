import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ina17/features/home/domain/domain.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository repository;
  HomeBloc({required this.repository}) : super(const _Initial()) {
    on<_GetAnswerQuestionOne>(_getAnswerQuestionOne);
    on<_GetAnswerQuestionTwo>(_getAnswerQuestionTwo);
    on<_GetAnswerQuestionThree>(_getAnswerQuestionThree);
    on<_GetAnswerQuestionFour>(_getAnswerQuestionFour);
  }

  FutureOr<void> _getAnswerQuestionOne(_GetAnswerQuestionOne event, emit) {
    _emitLoading(emit);
    final result = generateN(event.n);
    _emitLoaded(emit, result);
  }

  FutureOr<void> _getAnswerQuestionTwo(_GetAnswerQuestionTwo event, emit) {
    _emitLoading(emit);
    final incResult = generateN(event.n);
    final decResult = generateN(1, initial: event.n - 1, isIncrement: false);
    _emitLoaded(emit, [...incResult, ...decResult]);
  }

  FutureOr<void> _getAnswerQuestionThree(_GetAnswerQuestionThree event, emit) {
    _emitLoading(emit);
    final result = generateN(event.n,
        customResult: (index) => '${(index * 10) + index - 1}');
    _emitLoaded(emit, result);
  }

  FutureOr<void> _getAnswerQuestionFour(_GetAnswerQuestionFour event, emit) {
    _emitLoading(emit);
    final result = generateN(event.n, customResult: (index) {
      if (index % 5 == 0) {
        return 'LIMA';
      }

      if (index % 7 == 0) {
        return 'TUJUH';
      }
      return '$index';
    });
    _emitLoaded(emit, result);
  }

  List<String> generateN(
    int N, {
    int initial = 1,
    bool isIncrement = true,
    int sum = 1,
    String Function(int)? customResult,
  }) {
    List<String> tempList = [];

    resCondition(int i) => isIncrement ? i <= N : i >= N;
    resSum(int i) {
      return isIncrement ? i += sum : i -= sum;
    }

    while (resCondition(initial)) {
      tempList.add(customResult?.call(initial) ?? '$initial');
      initial = resSum(initial);
    }

    return tempList;
  }

  void _emitLoading(Emitter<HomeState> emit) {
    emit(const HomeState.loading());
  }

  void _emitLoaded(Emitter<HomeState> emit, List<String> result) {
    emit(HomeState.loaded(result));
  }
}
