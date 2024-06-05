import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ina17/common/common.dart';
import 'package:ina17/features/features.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final TextEditingController nController = TextEditingController();

  void onButtonPress(index) {
    int? totalN = int.tryParse(nController.text);

    if (totalN == null) {
      AppUtils.showSnackBar(globalContext, 'Please input N before get answer');
      return;
    }

    switch (index) {
      case 2:
        globalContext
            .read<HomeBloc>()
            .add(HomeEvent.getAnswerQuestionTwo(totalN));
        break;
      case 3:
        globalContext
            .read<HomeBloc>()
            .add(HomeEvent.getAnswerQuestionThree(totalN));
        break;
      case 4:
        globalContext
            .read<HomeBloc>()
            .add(HomeEvent.getAnswerQuestionFour(totalN));
        break;
      default:
        globalContext
            .read<HomeBloc>()
            .add(HomeEvent.getAnswerQuestionOne(totalN));
    }
  }

  void onDispose() {
    nController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    globalContext = context;
    return DefaultScaffold(
      appBar: const DefaultAppBar(
        title: 'INA17 Technical Test',
      ),
      onDispose: onDispose,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const DefaultText(
              'Input N :',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            10.heightBox,
            DefaultTextField(controller: nController, hintText: ''),
            16.heightBox,
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 6 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final resIndex = index + 1;
                return ButtonAnswer(
                  onPress: () => onButtonPress(resIndex),
                  label: '$resIndex',
                );
              },
              itemCount: 4,
            ),
            16.heightBox,
            const DefaultText(
              'Result : ',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            10.heightBox,
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const SizedBox(),
                  loaded: (result) => DefaultText(
                    result.join(', '),
                    fontSize: 18,
                    color: AppColors.black,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
