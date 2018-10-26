package com.adobe.fiber.valueobjects
{
   public class AvailablePropertyIterator implements IPropertyIterator
   {
       
      
      private var valueObject:AbstractEntityMetadata;
      
      private var currentIndex:int;
      
      private var intoGuardedArray:Boolean = false;
      
      public function AvailablePropertyIterator(valueObject:AbstractEntityMetadata)
      {
         super();
         this.valueObject = valueObject;
         this.currentIndex = -1;
      }
      
      private function advanceCurrentIndex() : void
      {
         this.currentIndex++;
         if(!this.intoGuardedArray && this.currentIndex == this.valueObject.getUnguardedProperties().length)
         {
            this.intoGuardedArray = true;
            this.currentIndex = 0;
         }
      }
      
      public function hasNext() : Boolean
      {
         if(!this.intoGuardedArray)
         {
            if(this.currentIndex + 1 == this.valueObject.getUnguardedProperties().length)
            {
               return this.valueObject.getGuardedProperties().length > 0;
            }
            return this.currentIndex + 1 < this.valueObject.getUnguardedProperties().length;
         }
         while(this.currentIndex + 1 < this.valueObject.getGuardedProperties().length && !this.valueObject.isAvailable(this.valueObject.getGuardedProperties()[this.currentIndex + 1]))
         {
            this.currentIndex++;
         }
         return this.currentIndex + 1 < this.valueObject.getGuardedProperties().length;
      }
      
      public function next() : String
      {
         this.advanceCurrentIndex();
         if(!this.intoGuardedArray)
         {
            return this.valueObject.getUnguardedProperties()[this.currentIndex];
         }
         while(this.currentIndex < this.valueObject.getGuardedProperties().length && !this.valueObject.isAvailable(this.valueObject.getGuardedProperties()[this.currentIndex]))
         {
            this.currentIndex++;
         }
         if(this.currentIndex < this.valueObject.getGuardedProperties().length)
         {
            return this.valueObject.getGuardedProperties()[this.currentIndex];
         }
         return null;
      }
   }
}
