package com.adobe.fiber.runtime.lib
{
   public class StringFunc
   {
       
      
      public function StringFunc()
      {
         super();
      }
      
      public static function charAt(s:String, pos:int) : String
      {
         return s.charAt(pos);
      }
      
      public static function chr(c:int) : String
      {
         return String.fromCharCode(c);
      }
      
      public static function compare(s1:String, s2:String) : int
      {
         if(s1 == null && s2 == null)
         {
            return 0;
         }
         if(s1 == null)
         {
            return -1;
         }
         if(s2 == null)
         {
            return 1;
         }
         if(s1 == s2)
         {
            return 0;
         }
         if(s1 < s2)
         {
            return -1;
         }
         return 1;
      }
      
      public static function compareNoCase(s1:String, s2:String) : int
      {
         if(s1 == null && s2 == null)
         {
            return 0;
         }
         if(s1 == null)
         {
            return -1;
         }
         if(s2 == null)
         {
            return 1;
         }
         var s1lower:String = s1.toLowerCase();
         var s2lower:String = s2.toLowerCase();
         if(s1lower == s2lower)
         {
            return 0;
         }
         if(s1lower < s2lower)
         {
            return -1;
         }
         return 1;
      }
      
      public static function endsWith(sub:String, str:String) : Boolean
      {
         if(sub == null || str == null)
         {
            return false;
         }
         return sub == str.substring(str.length - sub.length);
      }
      
      public static function find(sub:String, str:String) : int
      {
         if(str == null || sub == null || sub.length == 0)
         {
            return -1;
         }
         return str.indexOf(sub);
      }
      
      public static function findNoCase(sub:String, str:String) : int
      {
         var i:int = 0;
         if(str == null || sub == null || sub.length == 0)
         {
            return -1;
         }
         if(sub.length == 0)
         {
            return -1;
         }
         var lowerStr:String = str.toLowerCase();
         var lowerSub:String = sub.toLowerCase();
         var subLen:int = sub.length;
         var strLen:int = str.length;
         if(lowerStr.length == strLen && lowerSub.length == subLen)
         {
            return lowerStr.indexOf(lowerSub);
         }
         for(i = 0; i + subLen <= strLen; i++)
         {
            if(str.substring(i,i + subLen).toLowerCase() == lowerSub)
            {
               return i;
            }
         }
         return -1;
      }
      
      public static function findLast(sub:String, str:String) : int
      {
         if(str == null || sub == null || sub.length == 0)
         {
            return -1;
         }
         return str.lastIndexOf(sub);
      }
      
      public static function findLastNoCase(sub:String, str:String) : int
      {
         var i:int = 0;
         if(str == null || sub == null || sub.length == 0)
         {
            return -1;
         }
         if(sub.length == 0)
         {
            return -1;
         }
         var lowerStr:String = str.toLowerCase();
         var lowerSub:String = sub.toLowerCase();
         var subLen:int = sub.length;
         var strLen:int = str.length;
         if(lowerStr.length == strLen && lowerSub.length == subLen)
         {
            return lowerStr.lastIndexOf(lowerSub);
         }
         for(i = strLen - subLen; i >= 0; i--)
         {
            if(str.substring(i,i + subLen).toLowerCase() == lowerSub)
            {
               return i;
            }
         }
         return -1;
      }
      
      public static function findOneOf(cset:String, str:String) : int
      {
         var ch:String = null;
         var idx:int = 0;
         if(str == null || cset == null)
         {
            return -1;
         }
         var length:int = cset.length;
         if(length == 0)
         {
            return -1;
         }
         var min:int = str.length;
         for(var i:int = 0; i < length; i++)
         {
            ch = cset.charAt(i);
            idx = str.indexOf(ch);
            if(idx < min && idx != -1)
            {
               min = idx;
               if(min == 0)
               {
                  break;
               }
            }
         }
         return min < str.length?int(min):int(-1);
      }
      
      public static function insert(sub:String, str:String, pos:int) : String
      {
         if(str == null)
         {
            return sub;
         }
         if(pos < 0)
         {
            return sub + str;
         }
         if(pos >= str.length)
         {
            return str + sub;
         }
         return str.substring(0,pos + 1) + sub + str.substring(pos + 1);
      }
      
      public static function leftTrim(input:String) : String
      {
         if(input == null)
         {
            return null;
         }
         var size:Number = input.length;
         for(var i:Number = 0; i < size; i++)
         {
            if(input.charCodeAt(i) > 32)
            {
               return input.substring(i);
            }
         }
         return "";
      }
      
      public static function left(str:String, count:int) : String
      {
         if(str == null)
         {
            return null;
         }
         if(count <= 0)
         {
            return "";
         }
         var len:int = str.length;
         return str.substring(0,count < len?Number(count):Number(len));
      }
      
      public static function len(s:String) : int
      {
         if(s == null)
         {
            return 0;
         }
         return s.length;
      }
      
      public static function lower(str:String) : String
      {
         if(str == null)
         {
            return null;
         }
         return str.toLowerCase();
      }
      
      public static function substring(str:String, s:int, c:int) : String
      {
         if(str == null || str.length == 0)
         {
            return str;
         }
         var len:int = str.length;
         if(s > len || s < 0 || c < 0)
         {
            return "";
         }
         if(s + c > len)
         {
            return str.substring(s);
         }
         return str.substring(s,s + c);
      }
      
      public static function rightTrim(input:String) : String
      {
         if(input == null)
         {
            return null;
         }
         var size:Number = input.length;
         for(var i:Number = size; i > 0; i--)
         {
            if(input.charCodeAt(i - 1) > 32)
            {
               return input.substring(0,i);
            }
         }
         return "";
      }
      
      public static function removeChars(str:String, start:int, count:int) : String
      {
         var retstr:String = null;
         if(str == null)
         {
            return null;
         }
         if(start < 0 || start >= str.length || count <= 0)
         {
            retstr = str;
         }
         else if(start + count >= str.length)
         {
            retstr = str.substring(0,start);
         }
         else
         {
            retstr = str.substring(0,start) + str.substring(start + count);
         }
         return retstr;
      }
      
      public static function repeatString(str:String, count:int) : String
      {
         if(str == null)
         {
            return null;
         }
         if(count <= 0)
         {
            return "";
         }
         var finalstr:String = "";
         for(var i:int = 0; i < count; i++)
         {
            finalstr = finalstr + str;
         }
         return finalstr;
      }
      
      private static function replace_internal(input_orig:String, search_orig:String, replace:String, scope:String, casesensitive:Boolean) : String
      {
         var input:String = null;
         var search:String = null;
         if(input_orig == null || input_orig.length == 0)
         {
            return input_orig;
         }
         if(search_orig == null || search_orig.length == 0)
         {
            return input_orig;
         }
         if(replace == null)
         {
            replace = "";
         }
         var searchlength:int = search_orig.length;
         if(casesensitive)
         {
            input = input_orig;
            search = search_orig;
         }
         else
         {
            input = input_orig.toLowerCase();
            search = search_orig.toLowerCase();
         }
         var index:int = input.indexOf(search);
         if(index == -1)
         {
            return input_orig;
         }
         var output:String = "";
         var lastindex:int = 0;
         if(scope == "ALL")
         {
            while(index != -1)
            {
               output = output.concat(input_orig.substring(lastindex,index),replace);
               lastindex = index + searchlength;
               index = input.indexOf(search,lastindex);
            }
         }
         else
         {
            output = output.concat(input_orig.substring(0,index),replace);
            lastindex = index + searchlength;
         }
         output = output.concat(input_orig.substring(lastindex));
         return output;
      }
      
      public static function replace(input:String, search:String, replace:String) : String
      {
         return replace_internal(input,search,replace,"ONE",true);
      }
      
      public static function replaceNoCase(input:String, search:String, replace:String) : String
      {
         return replace_internal(input,search,replace,"ONE",false);
      }
      
      public static function replaceAll(input:String, search:String, replace:String) : String
      {
         return replace_internal(input,search,replace,"ALL",true);
      }
      
      public static function replaceAllNoCase(input:String, search:String, replace:String) : String
      {
         return replace_internal(input,search,replace,"ALL",false);
      }
      
      public static function reverse(s:String) : String
      {
         if(s == null || s.length == 0)
         {
            return s;
         }
         var result:String = "";
         for(var i:int = s.length - 1; i >= 0; i--)
         {
            result = result + s.charAt(i);
         }
         return result;
      }
      
      public static function right(str:String, count:int) : String
      {
         if(str == null)
         {
            return null;
         }
         if(count <= 0)
         {
            return "";
         }
         var len:int = str.length;
         return str.substring(len > count?Number(len - count):Number(0));
      }
      
      public static function spanExcluding(str:String, cset:String) : String
      {
         var i:int = 0;
         if(str == null || str.length == 0 || cset == null)
         {
            return str;
         }
         var len:int = str.length;
         for(i = 0; i < len; i++)
         {
            if(cset.indexOf(str.charAt(i)) != -1)
            {
               break;
            }
         }
         if(i == len)
         {
            return str;
         }
         if(i > 0)
         {
            return str.substring(0,i);
         }
         return "";
      }
      
      public static function spanIncluding(str:String, cset:String) : String
      {
         var i:int = 0;
         if(str == null || str.length == 0 || cset == null)
         {
            return str;
         }
         var len:int = str.length;
         for(i = 0; i < len; i++)
         {
            if(cset.indexOf(str.charAt(i)) == -1)
            {
               break;
            }
         }
         if(i == len)
         {
            return str;
         }
         if(i > 0)
         {
            return str.substring(0,i);
         }
         return "";
      }
      
      public static function startsWith(prefix:String, input:String) : Boolean
      {
         if(input == null || prefix == null)
         {
            return false;
         }
         return prefix == input.substring(0,prefix.length);
      }
      
      public static function trim(s:String) : String
      {
         if(s == null)
         {
            return null;
         }
         return StringFunc.leftTrim(StringFunc.rightTrim(s));
      }
      
      public static function upper(s:String) : String
      {
         if(s == null)
         {
            return null;
         }
         return s.toUpperCase();
      }
   }
}
