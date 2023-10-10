 /* noticeDetail  */
 
 $(function () {
   $('#delOk').click(function () {
      if(!confirm('삭제하시면 복구 할 수 없습니다. \n 정말로 삭제 하시겠습니까??')){
         return false;
      }
   });
   
});


