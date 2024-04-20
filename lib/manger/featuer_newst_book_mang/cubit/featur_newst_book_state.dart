part of 'featur_newst_book_cubit.dart';

sealed class FeaturBookState extends Equatable {
  const FeaturBookState();

  @override
  List<Object> get props => [];
}

final class FeaturNewstBookInitial extends FeaturBookState {}

final class FeaturNewstBookLooding extends FeaturBookState {}

final class FeaturNewstBookFailure extends FeaturBookState {
  final String errorMassage;

  const FeaturNewstBookFailure(this.errorMassage);
}

final class FeaturNewstBookSuccess extends FeaturBookState {
  final List<BookModel> books;

  const FeaturNewstBookSuccess({required this.books});
}
