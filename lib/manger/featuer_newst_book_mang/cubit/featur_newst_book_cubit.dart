import 'package:bloc/bloc.dart';
import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featur_newst_book_state.dart';

class FeaturNewstBookCubit extends Cubit<FeaturBookState> {
  FeaturNewstBookCubit(this.homeRepo) : super(FeaturNewstBookInitial());

  final HomeRepo homeRepo;

  fetchNewstBooks(String category) async {
    emit(FeaturNewstBookLooding());
    var result = await homeRepo.fetchNewstBooks(category);

    result.fold((l) {
      emit(FeaturNewstBookFailure(l.errorMassage));
    }, (r) {
      emit(FeaturNewstBookSuccess(books: r));
    });
  }

  @override
  void onChange(Change<FeaturBookState> change) {
    // TODO: implement onChange
    print(change);
  }
}
