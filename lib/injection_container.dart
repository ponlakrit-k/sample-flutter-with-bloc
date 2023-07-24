import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sample_flutter_with_bloc/features/revenue_account/data/datasources/currency_datasource.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/repositories/currency_repository_impl.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/repositories/currency_repository.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/usecases/currency_usecase.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/bloc/revenue_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => RevenueBloc(currencyUsecase: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => CurrencyUsecase(sl()));

  // Repository
  sl.registerLazySingleton<CurrencyRepository>(
    () => CurrencyRepositoryImpl(
      dataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<CurrencyDataSource>(
    () => CurrencyDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton(() => http.Client());
}
