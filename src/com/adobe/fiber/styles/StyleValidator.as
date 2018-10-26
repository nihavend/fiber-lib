package com.adobe.fiber.styles
{
   import mx.validators.Validator;
   
   public class StyleValidator extends Validator
   {
       
      
      private var validationFunction:Function;
      
      public function StyleValidator(validationFunction:Function)
      {
         super();
         this.validationFunction = validationFunction;
         this.required = false;
      }
      
      override protected function doValidation(value:Object) : Array
      {
         return this.validationFunction.call(value,value);
      }
   }
}
