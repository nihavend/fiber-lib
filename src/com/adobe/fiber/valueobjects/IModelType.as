package com.adobe.fiber.valueobjects
{
   public interface IModelType
   {
       
      
      function getProperties() : Array;
      
      function getDataProperties() : Array;
      
      function getGuardedProperties() : Array;
      
      function getUnguardedProperties() : Array;
      
      function getDependants(param1:String) : Array;
      
      function getCollectionProperties() : Array;
      
      function getCollectionBase(param1:String) : String;
      
      function getDependedOnServices() : Array;
      
      function getEntityName() : String;
      
      function getAssociationProperties() : Array;
      
      function getMappedByProperty(param1:String) : String;
      
      function getRequiredProperties() : Array;
      
      function getPropertyLength(param1:String) : int;
   }
}
