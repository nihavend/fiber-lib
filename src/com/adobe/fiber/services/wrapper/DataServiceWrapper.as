package com.adobe.fiber.services.wrapper
{
   import com.adobe.fiber.core.model_internal;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import mx.core.IMXMLObject;
   import mx.core.mx_internal;
   import mx.data.DataService;
   import mx.data.events.DataServiceFaultEvent;
   import mx.messaging.ChannelSet;
   import mx.rpc.events.ResultEvent;
   
   [Event(name="fault",type="mx.data.events.DataServiceFaultEvent")]
   [Event(name="result",type="mx.rpc.events.ResultEvent")]
   public class DataServiceWrapper extends EventDispatcher implements IMXMLObject
   {
       
      
      var document:Object;
      
      var id:String;
      
      protected var _serviceControl:DataService;
      
      public function DataServiceWrapper(destination:String)
      {
         super(null);
         this._serviceControl = new DataService(destination);
      }
      
      public function initialized(document:Object, id:String) : void
      {
         this.mx_internal::document = document;
         this.mx_internal::id = id;
      }
      
      model_internal function initialize() : void
      {
         this.serviceControl.addEventListener(ResultEvent.RESULT,model_internal::propagateEvents);
         this.serviceControl.addEventListener(DataServiceFaultEvent.FAULT,model_internal::propagateEvents);
      }
      
      public function get serviceControl() : DataService
      {
         return this._serviceControl;
      }
      
      public function get destination() : String
      {
         return this.serviceControl.destination;
      }
      
      public function get channelSet() : ChannelSet
      {
         return this.serviceControl.channelSet;
      }
      
      public function set channelSet(cs:ChannelSet) : void
      {
         this.serviceControl.channelSet = cs;
      }
      
      model_internal function propagateEvents(event:Event) : void
      {
         dispatchEvent(event);
      }
   }
}
