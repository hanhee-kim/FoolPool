/* 풀풀박사 작성, 수정 - 취소 버튼 */
function drFPback() {
	// history.go(-1);
    history.back();
}

/* 풀풀박사 상세 - 목록 버튼 */
function drFPbackToList(no) {
	console.log("drFPbackToList 호출...");
	window.location.href = "goDrFoolPool";
}

/* 풀풀박사 상세 - 삭제 버튼 */
function drFPdelete(no) {
	console.log("drFPdelete 호출...");
	if (confirm("게시글을 삭제하시겠습니까?") == true){ 
		window.location.href = "drFoolPoolDelete?no=" + no;
	 }
}
/* 풀풀박사 상세 - 수정 버튼 */
function drFPedit(no) {
	console.log("drFPedit 호출...");
	window.location.href = "editDrFoolPool?no=" + no;
}

/* 풀풀박사 댓글 삭제 버튼 */
function drFPCommDelete(commentNo, postNo) {
	console.log("dfFPCommdelete 호출...");
	if (confirm("댓글을 삭제하시겠습니까?") == true){ 
		window.location.href = "deldrfoolpoolcomment?commentNo=" + commentNo + "&postNo=" + postNo;
	 }
}
/* 풀풀박사 댓글 채택 버튼 */
function drFPCommPick(commentNo, postNo) {
	console.log("drFPCommPick 호출...");
	if (confirm("이 댓글을 채택하시겠습니까?") == true){ 
		window.location.href = "pickdrfoolpoolcomment?commentNo=" + commentNo + "&postNo=" + postNo;
	 }
}

/* 풀풀박사 목록 - 검색바 유효성 검사 */
$(document).ready(function() {
    $('#drFP-searchForm').submit(function(event) {
		console.log("검색바 유효성 검사 함수 호출...");
        let sOption = $("#sOption").val();
        let sValue = $("#sValue").val().trim();
        if (sOption === "unselected" || sValue === "") {
            console.log("검색옵션 혹은 검색어가 없으므로 기본제출이 막아짐");
            event.preventDefault();
        }
    });
});



/* 게시글 목록의 검색form의 hidden input에 필터값 저장하여 제출하기 위함 */
/*
$(document).ready(function() {
	const url = new URL(window.location.href);
	const filterValueFromUrl = (url.match(/filter=([^&]*)/)[1]==null)?'all':url.match(/filter=([^&]*)/)[1]; // 현재url에서 추출한 필터값(filter=뒤의 값[1]을 추출하여 변수에 저장)
	console.log("filterValueFromUrl: " + filterValueFromUrl + ",자료형" + typeof filterValueFromUrl);
    $('#dfFP-filter').val(filterValueFromUrl);
});
*/



