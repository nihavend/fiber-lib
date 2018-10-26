package com.adobe.fiber.services.wrapper
{
   import com.adobe.fiber.core.model_internal;
   import flash.events.IEventDispatcher;
   import mx.rpc.AbstractService;
   import mx.rpc.soap.mxml.WebService;
   
   public class WebServiceWrapper extends AbstractServiceWrapper
   {
       
      
      protected var _serviceControl:WebService;
      
      protected var _needWSDLLoad:Boolean = false;
      
      public function WebServiceWrapper(target:IEventDispatcher = null)
      {
         super(target);
      }
      
      override public function get serviceControl() : AbstractService
      {
         return this._serviceControl;
      }
      
      public function get wsdl() : String
      {
         return this._serviceControl.wsdl;
      }
      
      public function set wsdl(wsdl:String) : void
      {
         this._serviceControl.wsdl = wsdl;
         this._needWSDLLoad = true;
      }
      
      override public function set destination(name:String) : void
      {
         this.serviceControl.destination = name;
         this._needWSDLLoad = true;
      }
      
      public function get service() : String
      {
         return this._serviceControl.service;
      }
      
      public function set service(service:String) : void
      {
         this._serviceControl.service = service;
      }
      
      public function get port() : String
      {
         return this._serviceControl.port;
      }
      
      public function set port(port:String) : void
      {
         this._serviceControl.port = port;
      }
      
      model_internal function loadWSDLIfNecessary() : void
      {
         if(this._needWSDLLoad)
         {
            this._serviceControl.loadWSDL();
            this._needWSDLLoad = false;
         }
      }
      
      public function get useProxy() : Boolean
      {
         return this._serviceControl.useProxy;
      }
      
      public function set useProxy(useProxy:Boolean) : void
      {
         this._serviceControl.useProxy = useProxy;
      }
   }
}
