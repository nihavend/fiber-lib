package com.adobe.fiber.styles
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import mx.events.PropertyChangeEvent;
   import mx.validators.Validator;
   
   [Bindable("propertyChange")]
   public dynamic class Style implements IStyle, IEventDispatcher
   {
       
      
      private var _caption:LocalizeableMessage;
      
      private var _description:LocalizeableMessage;
      
      private var _error:LocalizeableMessage;
      
      private var _editMask:String;
      
      private var _displayMask:String;
      
      private var _validator:Validator;
      
      private var _bindingEventDispatcher:EventDispatcher;
      
      public function Style()
      {
         this._bindingEventDispatcher = new EventDispatcher(IEventDispatcher(this));
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get caption() : LocalizeableMessage
      {
         return this._caption;
      }
      
      private function set _552573414caption(v:LocalizeableMessage) : void
      {
         this._caption = v;
      }
      
      [Bindable(event="propertyChange")]
      public function get description() : LocalizeableMessage
      {
         return this._description;
      }
      
      private function set _1724546052description(v:LocalizeableMessage) : void
      {
         this._description = v;
      }
      
      [Bindable(event="propertyChange")]
      public function get error() : LocalizeableMessage
      {
         return this._error;
      }
      
      private function set _96784904error(v:LocalizeableMessage) : void
      {
         this._error = v;
      }
      
      [Bindable(event="propertyChange")]
      public function get editMask() : String
      {
         return this._editMask;
      }
      
      private function set _1601819670editMask(v:String) : void
      {
         this._editMask = v;
      }
      
      [Bindable(event="propertyChange")]
      public function get displayMask() : String
      {
         return this._displayMask;
      }
      
      private function set _1714119374displayMask(v:String) : void
      {
         this._displayMask = v;
      }
      
      [Bindable(event="propertyChange")]
      public function get validator() : Validator
      {
         return this._validator;
      }
      
      private function set _1109783726validator(v:Validator) : void
      {
         this._validator = v;
      }
      
      public function set validator(param1:Validator) : void
      {
         var _loc2_:Object = this.validator;
         if(_loc2_ !== param1)
         {
            this._1109783726validator = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"validator",_loc2_,param1));
            }
         }
      }
      
      public function set editMask(param1:String) : void
      {
         var _loc2_:Object = this.editMask;
         if(_loc2_ !== param1)
         {
            this._1601819670editMask = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"editMask",_loc2_,param1));
            }
         }
      }
      
      public function set description(param1:LocalizeableMessage) : void
      {
         var _loc2_:Object = this.description;
         if(_loc2_ !== param1)
         {
            this._1724546052description = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"description",_loc2_,param1));
            }
         }
      }
      
      public function set displayMask(param1:String) : void
      {
         var _loc2_:Object = this.displayMask;
         if(_loc2_ !== param1)
         {
            this._1714119374displayMask = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayMask",_loc2_,param1));
            }
         }
      }
      
      public function set caption(param1:LocalizeableMessage) : void
      {
         var _loc2_:Object = this.caption;
         if(_loc2_ !== param1)
         {
            this._552573414caption = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"caption",_loc2_,param1));
            }
         }
      }
      
      public function set error(param1:LocalizeableMessage) : void
      {
         var _loc2_:Object = this.error;
         if(_loc2_ !== param1)
         {
            this._96784904error = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"error",_loc2_,param1));
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         this._bindingEventDispatcher.addEventListener(param1,param2,param3,param4,param5);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         return this._bindingEventDispatcher.dispatchEvent(param1);
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.hasEventListener(param1);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         this._bindingEventDispatcher.removeEventListener(param1,param2,param3);
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return this._bindingEventDispatcher.willTrigger(param1);
      }
   }
}
