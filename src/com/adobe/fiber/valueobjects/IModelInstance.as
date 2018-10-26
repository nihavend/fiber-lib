package com.adobe.fiber.valueobjects
{
   import com.adobe.fiber.styles.IStyle;
   
   public interface IModelInstance
   {
       
      
      function getAvailableProperties() : IPropertyIterator;
      
      function getValue(param1:String) : *;
      
      function setValue(param1:String, param2:*) : void;
      
      function isAvailable(param1:String) : Boolean;
      
      function getIdentityMap() : Object;
      
      function get validationFailureMessages() : Array;
      
      function get invalidConstraints() : Array;
      
      function getDependantInvalidConstraints(param1:String) : Array;
      
      function getStyle(param1:String) : IStyle;
      
      function getPropertyValidationFailureMessages(param1:String) : Array;
   }
}
