
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/features/authentication/domain/get_login_list_usecase.dart';

import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginListUseCase getLoginListUseCase;
  
  LoginBloc(this.getLoginListUseCase);

  @override
  LoginState get initialState => LoginLoadingState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FetchLogin) {
      try {
        yield LoginLoadedState(await getLoginListUseCase.execute(null));
      } catch (_) {
        yield LoginErrorState();
      }
    }
  }
}
