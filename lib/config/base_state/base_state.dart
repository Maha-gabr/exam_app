
class BaseState<T> {
  bool isLoading;
  String errMessage;
  T? data;

  BaseState({
     this.isLoading = false,
     this.errMessage = '',
     this.data,
  });

 BaseState<T> copyWith({bool? isLoading , String? errMessage , T? data}){
    return BaseState<T>(
      isLoading: isLoading ?? this.isLoading,
      errMessage: errMessage ?? this.errMessage,
      data: data ?? this.data,
    );
  }

  }

