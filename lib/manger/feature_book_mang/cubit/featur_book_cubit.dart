import 'package:bloc/bloc.dart';
import 'package:bookly_app/data/models/book_model/book_model.dart';
import 'package:bookly_app/data/repos/home_repo.dart';
import 'package:bookly_app/data/repos/home_repo_implemnt.dart';
import 'package:equatable/equatable.dart';

part 'featur_book_state.dart';

class FeaturBookCubit extends Cubit<FeaturBookState> {
  FeaturBookCubit(this.homeRepo) : super(FeaturBookInitial());

  final HomeRepoImpl homeRepo;
  fetchBooks() async {
    emit(FeaturBookLooding());
    var result = await homeRepo.fetchScreenBooks();

    result.fold((l) {
      emit(FeaturBookFailure(l.errorMassage));
    }, (r) {
      emit(FeaturBookSuccess(books: r));
    });
  }

  @override
  void onChange(Change<FeaturBookState> change) {
    // TODO: implement onChange
    print(change);
  }
}
