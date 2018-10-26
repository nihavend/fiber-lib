package com.adobe.fiber.valueobjects
{
   import com.adobe.fiber.styles.IStyle;
   import flash.events.EventDispatcher;
   import mx.resources.ResourceManager;
   
   [ResourceBundle("fiber")]
   public class AbstractEntityMetadata extends EventDispatcher implements IModelType, IModelInstance
   {
      
      public static const AdobePatentID_B932:String = "AdobePatentID=\"B932\"";
      
      public static const AdobePatentID_B1056:String = "AdobePatentID=\"B1056\"";
       
      
      public function AbstractEntityMetadata()
      {
         super();
      }
      
      public function getProperties() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getProperties"]);
         throw new Error(msg);
      }
      
      public function getPropertyType(propertyName:String) : String
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getPropertyType"]);
         throw new Error(msg);
      }
      
      public function getDataProperties() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getDataProperties"]);
         throw new Error(msg);
      }
      
      public function getGuardedProperties() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getGuardedProperties"]);
         throw new Error(msg);
      }
      
      public function getUnguardedProperties() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getUnguardedProperties"]);
         throw new Error(msg);
      }
      
      public function getDependants(propertyName:String) : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getDependants"]);
         throw new Error(msg);
      }
      
      public function getCollectionProperties() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getCollectionProperties"]);
         throw new Error(msg);
      }
      
      public function getCollectionBase(propertyName:String) : String
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getCollectionBase"]);
         throw new Error(msg);
      }
      
      public function getDependedOnServices() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getDependedOnServices"]);
         throw new Error(msg);
      }
      
      public function getAvailableProperties() : IPropertyIterator
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getAvailableProperties"]);
         throw new Error(msg);
      }
      
      public function getValue(propertyName:String) : *
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getValue"]);
         throw new Error(msg);
      }
      
      public function setValue(propertyName:String, value:*) : void
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["setValue"]);
         throw new Error(msg);
      }
      
      public function isAvailable(propertyName:String) : Boolean
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["isAvailable"]);
         throw new Error(msg);
      }
      
      public function getIdentityMap() : Object
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getIdentityMap"]);
         throw new Error(msg);
      }
      
      public function get invalidConstraints() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["invalidConstraints"]);
         throw new Error(msg);
      }
      
      public function get validationFailureMessages() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["validationFailureMessages"]);
         throw new Error(msg);
      }
      
      public function getDependantInvalidConstraints(propertyName:String) : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getDependantInvalidConstraints"]);
         throw new Error(msg);
      }
      
      public function getEntityName() : String
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getEntityName"]);
         throw new Error(msg);
      }
      
      public function getStyle(propertyName:String) : IStyle
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getStyle"]);
         throw new Error(msg);
      }
      
      public function getPropertyValidationFailureMessages(propertyName:String) : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getPropertyValidationFailureMessages"]);
         throw new Error(msg);
      }
      
      public function getAssociationProperties() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getAssociationProperties"]);
         throw new Error(msg);
      }
      
      public function getMappedByProperty(associationProperty:String) : String
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getMappedByProperty"]);
         throw new Error(msg);
      }
      
      public function getRequiredProperties() : Array
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getRequiredProperties"]);
         throw new Error(msg);
      }
      
      public function getPropertyLength(propertyName:String) : int
      {
         var msg:String = ResourceManager.getInstance().getString("fiber","notImplemented",["getPropertyLength"]);
         throw new Error(msg);
      }
   }
}
