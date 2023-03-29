import 'package:agumentik/api/api_repository.dart';
import 'package:agumentik/model/dummy_model/product.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dummy_logic_event.dart';
part 'dummy_logic_state.dart';

class DummyLogicBloc extends Bloc<DummyLogicEvent, DummyLogicState> {
  DummyLogicBloc() : super(DummyLogicInitial()) {
    final Api _apiRepository = Api();
    // List<Product>? product;
    on<GetProductList>((event, emit) async {
      try {
        emit(DummyLogicLoading());
        final product = await _apiRepository.fetchProductList();
        print('productttttttttttttttt $product');
        emit(DummyLogicLoaded(product));
      } catch (e) {
        emit(DummyLogicFetchError(e.toString()));
      }
    });
  }
}
