import 'package:redux_saga/redux_saga.dart';

import 'actions.dart';

handleSigned({action}) sync* {
  yield Delay(Duration(seconds: 1));
  yield Put(handle_signed_sucess());
}

authSaga() sync* {
  yield TakeEvery(handleSigned, pattern: handle_signed_request);
}
