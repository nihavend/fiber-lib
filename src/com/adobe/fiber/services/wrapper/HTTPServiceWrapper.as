package com.adobe.fiber.services.wrapper
{
	import flash.events.IEventDispatcher;
	import mx.rpc.AbstractService;
	import mx.rpc.http.HTTPMultiService;
	
	public class HTTPServiceWrapper extends AbstractServiceWrapper
	{
		
		
		protected var _serviceControl:HTTPMultiService;
		
		public function HTTPServiceWrapper(target:IEventDispatcher = null)
		{
			super(target);
		}
		
		override public function get serviceControl() : AbstractService
		{
			return this._serviceControl;
		}
		
		public function get baseURL() : String
		{
			return this._serviceControl.baseURL;
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
