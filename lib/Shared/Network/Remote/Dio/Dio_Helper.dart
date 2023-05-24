import 'package:dio/dio.dart';

class DioHelper {

  static Dio? dio ;

  static initDio (){
    dio?.interceptors
        .add(InterceptorsWrapper(onRequest : (options, handler) async {
      return handler.next(options);
    }));

    dio =  Dio(
      BaseOptions(
        baseUrl: 'http://is800am-001-site1.btempurl.com/api/',
        receiveDataWhenStatusError: true,
        ),
    );

  }
  static Future < Response?> getData ({
    required url,
    Map <String , dynamic >? query,
    String ? token,
  })async{
    dio!.options.headers={
      'Content-Type' : 'application/json' , 'lang':'en',
      'Authorization' : token ?? "",
    };
    return await dio!.get (url,queryParameters:query,
    );}

  static Future <Response?> postData ({ required String url, String ? token, Map <String,dynamic> ? query,
    required Map <String,dynamic> data,
  })async{
    dio!.options.headers={
      'Content-Type' : 'application/json' , 'lang':'en',
      'Authorization' : token ?? "",
    };
    return await dio?.post(
        url ,
        data: data ,
        queryParameters: query
    ) ;

  }

  static Future <Response?> putData ({ required String url, String ? token, Map <String,dynamic> ? query,
    required Map <String,dynamic> data,
  })async{
    dio!.options.headers={
      'Content-Type' : '' , 'lang':'en',
      'Authorization' : token ?? "",
    };
    return await dio?.put(
        url ,
        data: data ,
        queryParameters: query
    ) ;

  }
}
