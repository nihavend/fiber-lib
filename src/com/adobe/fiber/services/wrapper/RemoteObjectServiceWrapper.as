package com.adobe.fiber.services.wrapper
{
   import flash.events.IEventDispatcher;
   import mx.rpc.AbstractService;
   import mx.rpc.remoting.RemoteObject;
   
   public class RemoteObjectServiceWrapper extends AbstractServiceWrapper
   {
       
      
      protected var _serviceControl:RemoteObject;
      
      public function RemoteObjectServiceWrapper(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      override public function get serviceControl() : AbstractService
      {
         return this._serviceControl;
      }
      
      public function get source() : String
      {
         return this.serviceControl.source;
      }
      
      public function set source(source:String) : void
      {
         this.serviceControl.source = source;
      }
      
      public function get endpoint() : String
      {
         return this.serviceControl.endpoint;
      }
      
      public function set endpoint(endpoint:String) : void
      {
         this.serviceControl.endpoint = endpoint;
      }
   }
}
