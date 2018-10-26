package com.adobe.fiber.services.wrapper
{
   import com.adobe.fiber.core.model_internal;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.core.IMXMLObject;
   import mx.core.mx_internal;
   import mx.messaging.ChannelSet;
   import mx.rpc.AbstractService;
   import mx.rpc.events.FaultEvent;
   import mx.rpc.events.ResultEvent;
   
   [Event(name="fault",type="mx.rpc.events.FaultEvent")]
   [Event(name="result",type="mx.rpc.events.ResultEvent")]
   public class AbstractServiceWrapper extends EventDispatcher implements IMXMLObject
   {
       
      
      var document:Object;
      
      var id:String;
      
      public function AbstractServiceWrapper(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      public function initialized(document:Object, id:String) : void
      {
         this.mx_internal::document = document;
         this.mx_internal::id = id;
      }
      
      model_internal function initialize() : void
      {
         this.serviceControl.addEventListener(ResultEvent.RESULT,model_internal::propagateEvents);
         this.serviceControl.addEventListener(FaultEvent.FAULT,model_internal::propagateEvents);
      }
      
      public function get serviceControl() : AbstractService
      {
         return null;
      }
      
      public function get destination() : String
      {
         return this.serviceControl.destination;
      }
      
      public function set destination(name:String) : void
      {
         this.serviceControl.destination = name;
      }
      
      public function get channelSet() : ChannelSet
      {
         return this.serviceControl.channelSet;
      }
      
      public function set channelSet(cs:ChannelSet) : void
      {
         this.serviceControl.channelSet = cs;
      }
      
      public function get operations() : Object
      {
         return this.serviceControl.operations;
      }
      
      public function set operations(operations:Object) : void
      {
         this.serviceControl.operations = operations;
      }
      
      model_internal function propagateEvents(event:Event) : void
      {
         dispatchEvent(event);
      }
      
      public function get showBusyCursor() : Boolean
      {
         return this.serviceControl.showBusyCursor;
      }
      
      public function set showBusyCursor(sbc:Boolean) : void
      {
         this.serviceControl.showBusyCursor = sbc;
      }
   }
}
