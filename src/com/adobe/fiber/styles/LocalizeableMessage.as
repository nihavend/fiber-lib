package com.adobe.fiber.styles
{
   import com.adobe.fiber.core.model_internal;
   import flash.events.EventDispatcher;
   import mx.collections.ArrayCollection;
   import mx.events.PropertyChangeEvent;
   import mx.resources.ResourceManager;
   import mx.utils.StringUtil;
   
   public class LocalizeableMessage extends EventDispatcher implements ILocalizeableMessage
   {
       
      
      private var _bundle:String;
      
      private var _key:String;
      
      private var _tokens:ArrayCollection;
      
      private var _text:String;
      
      private var _internal_message:String = null;
      
      public function LocalizeableMessage()
      {
         super();
      }
      
      [Bindable(event="propertyChange")]
      public function get message() : String
      {
         if(this._internal_message == null)
         {
            model_internal::calculateMessage();
         }
         return this._internal_message;
      }
      
      model_internal function calculateMessage() : void
      {
         var oldMessage:String = this._internal_message;
         var newMessage:String = null;
         if(this.tokens == null)
         {
            newMessage = ResourceManager.getInstance().getString(this.bundle,this.key);
         }
         else
         {
            newMessage = ResourceManager.getInstance().getString(this.bundle,this.key,this.tokens.source);
         }
         if(newMessage == null)
         {
            if(this.tokens == null)
            {
               newMessage = this.text;
            }
            else
            {
               newMessage = StringUtil.substitute(this.text,this.tokens.source);
            }
         }
         if(oldMessage !== newMessage)
         {
            this._internal_message = newMessage;
            this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"message",oldMessage,newMessage));
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bundle() : String
      {
         return this._bundle;
      }
      
      private function set _1377881982bundle(v:String) : void
      {
         this._bundle = v;
      }
      
      [Bindable(event="propertyChange")]
      public function get key() : String
      {
         return this._key;
      }
      
      private function set _106079key(v:String) : void
      {
         this._key = v;
      }
      
      [Bindable(event="propertyChange")]
      public function get tokens() : ArrayCollection
      {
         return this._tokens;
      }
      
      private function set _868186726tokens(v:ArrayCollection) : void
      {
         this._tokens = v;
      }
      
      [Bindable(event="propertyChange")]
      public function get text() : String
      {
         return this._text;
      }
      
      private function set _3556653text(v:String) : void
      {
         this._text = v;
      }
      
      public function set key(param1:String) : void
      {
         var _loc2_:Object = this.key;
         if(_loc2_ !== param1)
         {
            this._106079key = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"key",_loc2_,param1));
            }
         }
      }
      
      public function set text(param1:String) : void
      {
         var _loc2_:Object = this.text;
         if(_loc2_ !== param1)
         {
            this._3556653text = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"text",_loc2_,param1));
            }
         }
      }
      
      public function set tokens(param1:ArrayCollection) : void
      {
         var _loc2_:Object = this.tokens;
         if(_loc2_ !== param1)
         {
            this._868186726tokens = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tokens",_loc2_,param1));
            }
         }
      }
      
      public function set bundle(param1:String) : void
      {
         var _loc2_:Object = this.bundle;
         if(_loc2_ !== param1)
         {
            this._1377881982bundle = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bundle",_loc2_,param1));
            }
         }
      }
   }
}
