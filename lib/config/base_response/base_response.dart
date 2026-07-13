
import '../../core/constants/error_constants.dart';
import '../exeptions/error_extractors.dart';
sealed class BaseResponse<T> {
  const BaseResponse();
}
class SuccessResponse<T> extends BaseResponse<T> {
  final T data;

  const SuccessResponse(this.data);
}
class ErrorResponse<T> extends BaseResponse<T> {
  final Exception? error;
  final String errMessage;
  ErrorResponse({this.error, String? errMessage})
      : errMessage = error != null
      ? ErrorExtractors.extractErrorMessage(error)
      : (errMessage ?? ErrorConstants.somethingWentWrong);


}