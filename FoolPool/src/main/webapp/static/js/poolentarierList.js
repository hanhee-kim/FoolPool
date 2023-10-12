/* onclick="callBtn"인 a태그를 가지는 페이징에 대해, id가 searchform인 form을 호출하지만, return은 onclick이 포함된 곳에서 처리 */
function callBtn(num) {
	var keyword = $("#keyword").val();
	if(keyword!=null && keyword.trim()!='') {
		$('#page').val(num);
		$('#searchform').submit();
	}	
}