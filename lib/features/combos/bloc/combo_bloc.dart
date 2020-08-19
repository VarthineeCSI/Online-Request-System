import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/features/combos/domain/get_combo_list_usecase.dart';
import 'package:rxdart/rxdart.dart';

import 'combo.dart';

// * ComboBloc
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
class ComboBloc extends Bloc<ComboEvent, ComboState> {
  final GetComboListUseCase getComboListUseCase;
  String defaultType;
  List defaultResult = [];

  ComboBloc(this.getComboListUseCase) {
    // _counterEventController.stream.listen(_count);
  }

  @override
  ComboState get initialState => ComboLoadingState();

  @override
  Stream<ComboState> mapEventToState(ComboEvent event) async* {
    if (event is FetchCombo) {
      try {
        defaultType = event.comboType;
        defaultResult = await getComboListUseCase.execute(event.comboType);
        yield ComboLoadedState(
            await getComboListUseCase.execute(event.comboType));
      } catch (_) {
        yield ComboErrorState();
      }
    } else if (event is FetchComboWithFieldName) {
      try {
        final String tempEvent =
            event.comboType + '?FieldName=' + event.key + '&IsActive=1';
        yield ComboLoadedState(await getComboListUseCase.execute(tempEvent));
      } catch (_) {
        yield ComboErrorState();
      }
    } else if (event is FetchComboWithDocType) {
      try {
        final String tempEvent = event.comboType +
            '?DocTypeGroup=' +
            event.docTypeGroup +
            '&DocTypeID=' +
            event.docTypeID;
        yield ComboLoadedState(await getComboListUseCase.execute(tempEvent));
      } catch (_) {
        yield ComboErrorState();
      }
    } else if (event is SearchTextChanged) {
      try {
        if (event.text.isEmpty) {
          yield ComboLoadedState(
              await getComboListUseCase.execute(defaultType));
        } else {
          yield ComboLoadedState(await getSearchResult(event.text));
        }
      } catch (_) {
        yield ComboErrorState();
      }
    }
  }

  Future<List> getSearchResult(String text) async {
    List searchResult = [];
    defaultResult.forEach((item) {
      if (item.comboName.contains(text)) {
        searchResult.add(item);
      }
    });
    return searchResult;
  }
}
