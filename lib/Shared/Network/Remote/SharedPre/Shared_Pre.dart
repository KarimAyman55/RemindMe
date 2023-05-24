import 'package:shared_preferences/shared_preferences.dart';
class CacheHelper {

static late SharedPreferences  sharedPre;

static initShared ()async{

  sharedPre = await SharedPreferences.getInstance();
}

static Future <bool> putData ( key , value ){

  return sharedPre.setBool( key,  value);

}
static dynamic getData (String key){
  return sharedPre.get(key);
}
static Future <bool?> saveData (String key , dynamic value)
async{
  if (value is bool) return await sharedPre.setBool(key, value);
  if (value is String) return await sharedPre.setString(key, value);
  if (value is double) return await sharedPre.setDouble(key, value);
  if (value is int) return await sharedPre.setInt(key, value);
  return null;
}
static Future <bool> removeData (String key) async{
  return await sharedPre.remove(key);
}
}
