


$(document).ready(function(){
$('#books tr').click(function()
{
   var href= $(this).find("a").attr("href");
   if(href)
   {
       
       window.location= href;
   }
  
});        
});