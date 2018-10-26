package
{
   import flash.display.Sprite;
   import flash.system.Security;
   
   [ExcludeClass]
   public class _b0e25480bc3fad0f0feadbfd21396e42df1048d62619c58d173250e390698c14_flash_display_Sprite extends Sprite
   {
       
      
      public function _b0e25480bc3fad0f0feadbfd21396e42df1048d62619c58d173250e390698c14_flash_display_Sprite()
      {
         super();
      }
      
      public function allowDomainInRSL(... rest) : void
      {
         Security.allowDomain(rest);
      }
      
      public function allowInsecureDomainInRSL(... rest) : void
      {
         Security.allowInsecureDomain(rest);
      }
   }
}
