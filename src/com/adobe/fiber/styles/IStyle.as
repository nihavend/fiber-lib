package com.adobe.fiber.styles
{
   import mx.validators.Validator;
   
   public interface IStyle
   {
       
      
      function get caption() : LocalizeableMessage;
      
      function get description() : LocalizeableMessage;
      
      function get error() : LocalizeableMessage;
      
      function get editMask() : String;
      
      function get displayMask() : String;
      
      function get validator() : Validator;
   }
}
