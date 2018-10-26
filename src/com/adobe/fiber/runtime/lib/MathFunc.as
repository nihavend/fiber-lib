package com.adobe.fiber.runtime.lib
{
   public class MathFunc
   {
       
      
      public function MathFunc()
      {
         super();
      }
      
      public static function abs(n:Number) : Number
      {
         return Math.abs(n);
      }
      
      public static function ceiling(n:Number) : Number
      {
         return Math.ceil(n);
      }
      
      public static function fix(n:Number) : Number
      {
         switch(sgn(n))
         {
            case 0:
               return n;
            case -1:
               return Math.ceil(n);
            case 1:
               return Math.floor(n);
            default:
               return 0;
         }
      }
      
      public static function floor(n:Number) : Number
      {
         return Math.floor(n);
      }
      
      public static function max(n1:Number, n2:Number) : Number
      {
         if(n1 > n2)
         {
            return n1;
         }
         return n2;
      }
      
      public static function min(n1:Number, n2:Number) : Number
      {
         if(n1 < n2)
         {
            return n1;
         }
         return n2;
      }
      
      public static function round(n:Number) : Number
      {
         return Math.round(n);
      }
      
      public static function sgn(n:Number) : int
      {
         return n == 0?int(0):n < 0?int(-1):int(1);
      }
   }
}
