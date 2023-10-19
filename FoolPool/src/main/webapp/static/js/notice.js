 /* noticeDetail  */
 function callBtn(num) {
		var keyword=$("#keyword").val();
		if(keyword!=null && keyword.trim()!=''){
			$('#page').val(num);
			$('#searchform').submit();
			return false;
		}
		return true;
	}
