import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';

// * RequestFilterBloc
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
class RequestFilterBloc extends Bloc<RequestFilterEvent, RequestFilterState> {
  RequestFilterBloc();

  @override
  RequestFilterState get initialState => RequestFilterLoadingState();

  @override
  Stream<RequestFilterState> mapEventToState(RequestFilterEvent event) async* {
    if (event is AddComboValue) {
      try {
        switch (event.comboType) {
          case 'GetDocStatusCombo':
            {
              yield AddValueExpenseStatusLoadedState(event.comboValue);
            }
            break;
          case 'GetEPStatusCombo':
            {
              yield AddValueExpenseTypeLoadedState(event.comboValue);
            }
            break;
          case 'GetDepartmentCombo':
            {
              yield AddValueOrganizationLoadedState(event.comboValue);
            }
            break;
          case 'GetMiscCombo':
            {
              yield AddValueWorkflowStatusLoadedState(event.comboValue);
            }
            break;
          default:
            {
              //statements;
            }
            break;
        }
      } catch (_) {
        yield RequestFilterErrorState();
      }
    }
  }
}
