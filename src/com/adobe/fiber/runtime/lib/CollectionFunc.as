package com.adobe.fiber.runtime.lib
{
   import mx.collections.ArrayCollection;
   
   public class CollectionFunc
   {
       
      
      public function CollectionFunc()
      {
         super();
      }
      
      public static function part(value:Object, list:ArrayCollection) : int
      {
         var i:int = 0;
         while(i < list.length && value > list.getItemAt(i))
         {
            i++;
         }
         return i;
      }
      
      public static function sizeof(collection:ArrayCollection) : int
      {
         return collection != null?int(collection.length):int(0);
      }
      
      public static function count(collection:ArrayCollection) : int
      {
         return sizeof(collection);
      }
      
      public static function isEmpty(collection:ArrayCollection) : Boolean
      {
         return sizeof(collection) == 0;
      }
      
      public static function collectionAvg(c:ArrayCollection) : Number
      {
         if(sizeof(c) == 0)
         {
            return 0;
         }
         var total:Number = 0;
         for(var i:int = 0; i < c.length; i++)
         {
            total = total + (c.getItemAt(i) as Number);
         }
         return total / sizeof(c);
      }
      
      public static function collectionMax(c:ArrayCollection) : Number
      {
         var next:Number = NaN;
         if(sizeof(c) == 0)
         {
            return 0;
         }
         var candidate:Number = c.getItemAt(0) as Number;
         for(var i:int = 1; i < c.length; i++)
         {
            next = c.getItemAt(i) as Number;
            if(next > candidate)
            {
               candidate = next;
            }
         }
         return candidate;
      }
      
      public static function collectionMin(c:ArrayCollection) : Number
      {
         var next:Number = NaN;
         if(sizeof(c) == 0)
         {
            return 0;
         }
         var candidate:Number = c.getItemAt(0) as Number;
         for(var i:int = 1; i < c.length; i++)
         {
            next = c.getItemAt(i) as Number;
            if(next < candidate)
            {
               candidate = next;
            }
         }
         return candidate;
      }
      
      public static function collectionSum(c:ArrayCollection) : Number
      {
         if(sizeof(c) == 0)
         {
            return 0;
         }
         var total:Number = 0;
         for(var i:int = 0; i < c.length; i++)
         {
            total = total + (c.getItemAt(i) as Number);
         }
         return total;
      }
      
      public static function contains(c:ArrayCollection, item:Object) : Boolean
      {
         return c != null?Boolean(c.contains(item)):Boolean(false);
      }
   }
}
