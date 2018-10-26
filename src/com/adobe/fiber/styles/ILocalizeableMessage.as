package com.adobe.fiber.styles
{
   import mx.collections.ArrayCollection;
   
   public interface ILocalizeableMessage
   {
       
      
      function get message() : String;
      
      function get bundle() : String;
      
      function get key() : String;
      
      function get text() : String;
      
      function get tokens() : ArrayCollection;
   }
}
