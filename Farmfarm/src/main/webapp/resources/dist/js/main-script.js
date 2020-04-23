// Javascript

$(document).ready(function () {	
     
   // 디지털 시계
   setInterval(function () {
      var now = new Date();
      var y = now.getFullYear();
      var m = now.getMonth() + 1;
      var d = now.getDate();
      var w = now.getDay();
      var hh = now.getHours();
      var mm = now.getMinutes();
      var ss = now.getSeconds();

      // 조건 연산자(? :)
      (mm >= 10) ? mm = mm : mm = '0' + mm;
      (ss >= 10) ? ss = ss : ss = '0' + ss;   

      $('#mobile p span').eq(0).text(hh);
      $('#mobile p span').eq(1).text(mm);
      $('#mobile p span').eq(2).text(ss);
   }, 1000);
   
	
	   
});