package com.adobe.fiber.runtime.lib
{
   import mx.collections.ArrayCollection;
   
   public class ConversionFunc
   {
       
      
      public function ConversionFunc()
      {
         super();
      }
      
      public static function toInteger(s:Object) : int
      {
         return int(s);
      }
      
      public static function toLong(s:Object) : int
      {
         return Number(s);
      }
      
      public static function toFloat(s:Object) : Number
      {
         return Number(s);
      }
      
      public static function toDouble(s:Object) : Number
      {
         return Number(s);
      }
      
      public static function toString(value:Object) : String
      {
         return value.toString();
      }
      
      public static function ConvertCharCollectionToString(charCollection:ArrayCollection) : String
      {
         var s:String = "";
         for(var i:int = 0; i < charCollection.length; i++)
         {
            s = s + charCollection.getItemAt(i);
         }
         return s;
      }
   }
}
