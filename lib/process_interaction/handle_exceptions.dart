import 'dart:io';

import 'package:oxidized/oxidized.dart';
import 'package:sale_helper_zencillo/process_interaction/exceptions.dart';
import 'package:sale_helper_zencillo/process_interaction/failures.dart';

Future<Result<T, Failure>> handleExceptions<T>(
  Future<T> Function() action,
) async {
  try {
    final result = await action();
    return Result.ok(result);
  } on RequestException {
    return Result.err(RequestFailure());
  } on NoInternetException {
    return Result.err(NoInternetFailure());
  } on SocketException {
    return Result.err(SocketFailure());
  } on ResultException catch (e) {
    return Result.err(ResultFailure(e.message));
  } on InvalidResolutionException {
    return Result.err(InvalidResolutionFailure());
  } on NoResolutionException catch (e) {
    return Result.err(NoResolutionFailure(e.message));
  } on Exception catch (e) {
    return Result.err(ResultFailure(e.toString()));
  } catch (e) {
    if (e is TypeError) {
      return Result.err(ResultFailure(e.toString()));
    } else {
      return Result.err(ResultFailure(e.toString()));
    }
  }
}

Future<Result<T, Failure>> handleExceptionsLocal<T>(
  Future<T> Function() action,
) async {
  try {
    final result = await action();
    return Result.ok(result);
  } on DatabaseException {
    return Result.err(DatabaseFailure());
  } on Exception catch (e) {
    return Result.err(ResultFailure(e.toString()));
  } catch (e) {
    if (e is TypeError) {
      return Result.err(ResultFailure(e.toString()));
    } else {
      return Result.err(ResultFailure(e.toString()));
    }
  }
}
