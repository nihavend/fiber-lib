package com.adobe.fiber.util
{
   public class FiberUtils
   {
       
      
      public function FiberUtils()
      {
         super();
      }
      
      public static function arrayAdd(parent:Array, child:Array) : void
      {
         var func:Function = function(element:*, index:int, arr:Array):void
         {
            parent.push(element);
         };
         child.forEach(func);
      }
      
      public static function arrayCompare(array1:Array, array2:Array) : Boolean
      {
         if(array1 == null || array2 == null)
         {
            return false;
         }
         if(array1 == array2)
         {
            return true;
         }
         if(array1.length != array2.length)
         {
            return false;
         }
         for(var a:int = 0; a < array1.length; a++)
         {
            if(array1[a] !== array2[a])
            {
               return false;
            }
         }
         return true;
      }
   }
}
