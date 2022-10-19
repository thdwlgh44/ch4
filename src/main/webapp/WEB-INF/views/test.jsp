<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<c:url value='/css/commentDesign.css'/>">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<h2>CommentTest</h2>
comment: <input type="text" name="comment"><br>
<button id="sendBtn" type="button">SEND</button>
<button id="modBtn" type="button">수정</button>

<h2>Data From Server :</h2>

<div id="commentList">
    <ul>
        <li class="comment-item" data-cno="1" data-bno="1070">
                <span class="comment-img">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                </span>
            <div class="comment-area">
                <div class="commenter">asdf</div>
                <div class="comment-content">asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf
                </div>
                <div class="comment-bottom">
                    <span class="up_date">2022.01.01 23:59:59</span>
                    <a href="#" class="btn-write"  data-cno="1" data-bno="1070" data-pcno="">답글쓰기</a>
                    <a href="#" class="btn-modify" data-cno="1" data-bno="1070" data-pcno="">수정</a>
                    <a href="#" class="btn-delete" data-cno="1" data-bno="1070" data-pcno="">삭제</a>
                </div>
            </div>
        </li>
        <li class="comment-item" data-cno="2" data-bno="1070">
                <span class="comment-img">
                    <i class="fa fa-user-circle" aria-hidden="true"></i>
                </span>
            <div class="comment-area">
                <div class="commenter">qwer</div>
                <div class="comment-content">qwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwerqwer
                </div>
                <div class="comment-bottom">
                    <span class="up_date">2022.01.01 23:59:59</span>
                    <a href="#" class="btn-write"  data-cno="2" data-bno="1070" data-pcno="">답글쓰기</a>
                    <a href="#" class="btn-modify" data-cno="2" data-bno="1070" data-pcno="">수정</a>
                    <a href="#" class="btn-delete" data-cno="2" data-bno="1070" data-pcno="">삭제</a>
                </div>
            </div>
        </li>
    </ul>
    <div class="paging-container">
        <div class="paging">
            <a class="page" href="#">&lt;</a>
            <a class="page" href="#">1</a>
            <a class="page" href="#">2</a>
            <a class="page" href="#">3</a>
            <a class="page" href="#">4</a>
            <a class="page paging-active" href="#">5</a>
            <a class="page" href="#">6</a>
            <a class="page" href="#">7</a>
            <a class="page" href="#">8</a>
            <a class="page" href="#">9</a>
            <a class="page" href="#">10</a>
            <a class="page" href="#">&gt;</a>
        </div>
    </div>
    <div id="comment-writebox">
        <div class="commenter commenter-writebox">${id}</div>
        <div class="comment-writebox-content">
            <textarea name="" id="" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
        </div>
        <div id="comment-writebox-bottom">
            <div class="register-box">
                <a href="#" class="btn" id="btn-write-comment">등록</a>
            </div>
        </div>
    </div>
</div>
<div id="reply-writebox">
    <div class="commenter commenter-writebox">${id}</div>
    <div class="reply-writebox-content">
        <textarea name="" id="" cols="30" rows="3" placeholder="댓글을 남겨보세요"></textarea>
    </div>
    <div id="reply-writebox-bottom">
        <div class="register-box">
            <a href="#" class="btn" id="btn-write-reply">등록</a>
            <a href="#" class="btn" id="btn-cancel-reply">취소</a>
        </div>
    </div>
</div>
<div id="modalWin" class="modal">
    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <p>
        <h2> | 댓글 수정</h2>
        <div id="modify-writebox">
            <div class="commenter commenter-writebox"></div>
            <div class="modify-writebox-content">
                <textarea name="" id="" cols="30" rows="5" placeholder="댓글을 남겨보세요"></textarea>
            </div>
            <div id="modify-writebox-bottom">
                <div class="register-box">
                    <a href="#" class="btn" id="btn-write-modify">등록</a>
                </div>
            </div>
        </div>
        </p>
    </div>
</div>
<script>
    let id = 'asdf';

    let addZero = function(value=1){
        return value > 9 ? value : "0"+value;
    }

    let dateToString = function(ms=0) {
        let date = new Date(ms);

        let yyyy = date.getFullYear();
        let mm = addZero(date.getMonth() + 1);
        let dd = addZero(date.getDate());

        let HH = addZero(date.getHours());
        let MM = addZero(date.getMinutes());
        let ss = addZero(date.getSeconds());

        return yyyy+"."+mm+"."+dd+ " " + HH + ":" + MM + ":" + ss;
    }

    $(document).ready(function(){
        $("a.btn-write").click(function(e){
            let target = e.target;
            let cno = target.getAttribute("data-cno")
            let bno = target.getAttribute("data-bno")

            let repForm = $("#reply-writebox");
            repForm.appendTo($("li[data-cno="+cno+"]"));
            repForm.css("display", "block");
            repForm.attr("data-pcno", pcno);
            repForm.attr("data-bno",  bno);
        });

        $("#btn-cancel-reply").click(function(e){
            $("#reply-writebox").css("display", "none");
        });

        $("a.btn-modify").click(function(e){
            let target = e.target;
            let cno = target.getAttribute("data-cno");
            let bno = target.getAttribute("data-bno");
            let pcno = target.getAttribute("data-pcno");
            let li = $("li[data-cno="+cno+"]");
            let commenter = $(".commenter", li).first().text();
            let comment = $(".comment-content", li).first().text();

            $("#modalWin .commenter").text(commenter);
            $("#modalWin textarea").text(comment);
            $("#btn-write-modify").attr("data-cno", cno);
            $("#btn-write-modify").attr("data-pcno", pcno);
            $("#btn-write-modify").attr("data-bno", bno);

            // 팝업창을 열고 내용을 보여준다.
            $("#modalWin").css("display","block");
        });

        $("a.btn-delete").click(function(e){
            alert("delete");
        });

        $("#btn-write-modify").click(function(){
            // 1. 변경된 내용을 서버로 전송
            // 2. 모달 창을 닫는다.
            $(".close").trigger("click");
        });

        $(".close").click(function(){
            $("#modalWin").css("display","none");
        });
    });
</script>

<div id="replyForm" style="display:none">
    <input type="text" name="replyComment">
    <button id="wrtRepBtn" type="button">등록</button>
</div>
<script>
    let bno = 454;

    let showList = function (bno) {
        $.ajax({
            type:'GET',       // 요청 메서드
            url: '/ch4/comments?bno='+bno,  // 요청 URI: /ch4/comments?bno=454 POST
            success : function(result){
                $("#commentList").html(toHtml(result));    // 서버로부터 응답이 도착하면 호출될 함수

            },
            error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    $(document).ready(function(){
        showList(bno);

        $("#modBtn").click(function(){
            let cno = $(this).attr("data-cno");
            let comment = $("input[name=comment]").val();

            if (comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment]").focus()
                return;
            }

            $.ajax({
                type:'PATCH',       // 요청 메서드
                url: '/ch4/comments/'+cno,  // 요청 URI: /ch4/comments?bno=454 POST
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({cno:cno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#wrtRepBtn").click(function(){
            let comment = $("input[name=replyComment]").val();
            let pcno = $("#replyForm").parent().attr("data-pcno");

            if (comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=replyComment]").focus()
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/ch4/comments?bno='+bno,  // 요청 URI: /ch4/comments?bno=454 POST
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()

            $("#replyForm").css("display", "none")
            $("input[name=replyComment]").val('')
            $("#replyForm").appendTo("body");
        });

        $("#sendBtn").click(function(){
            let comment = $("input[name=comment]").val();

            if (comment.trim()=='') {
                alert("댓글을 입력해주세요.");
                $("input[name=comment]").focus()
                return;
            }

            $.ajax({
                type:'POST',       // 요청 메서드
                url: '/ch4/comments?bno='+bno,  // 요청 URI: /ch4/comments?bno=454 POST
                headers : { "content-type": "application/json"}, // 요청 헤더
                data : JSON.stringify({bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                success : function(result){
                    alert(result);
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });

        $("#commentList").on("click", ".modBtn", function() {
            let cno = $(this).parent().attr("data-cno");
            let bno = $(this).parent().attr("data-bno");
            let comment = $("span.comment", $(this).parent()).text();

            // 1. comment의 내용을 input에 뿌려주기
            $("input[name=comment]").val(comment);
            // 2. cno 전달하기
            $("#modBtn").attr("data-cno", cno);
        });

        $("#commentList").on("click", ".replyBtn", function() {
            // 1. replyForm을 옮기고
            $("#replyForm").appendTo($(this).parent());

            // 2. 답글을 입력할 폼을 보여주고,
            $("#replyForm").css("display", "block");
        });

        // $(".delBtn").click(function(){
        $("#commentList").on("click", ".delBtn", function(){
            let cno = $(this).parent().attr("data-cno");
            let bno = $(this).parent().attr("data-bno");

            $.ajax({
                type:'DELETE',       // 요청 메서드
                url: '/ch4/comments/'+cno+'?bno='+bno,  // 요청 URI
                success : function(result){
                    alert(result)
                    showList(bno);
                },
                error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
            }); // $.ajax()
        });


    });

    let toHtml = function (comments) {
        let tmp = "<ul>";

        comments.forEach(function(comment) {
            tmp += '<li data-cno=' + comment.cno
            tmp += ' data-pcno=' + comment.pcno
            tmp += ' data-bno=' + comment.bno + '>'
            if (comment.cno!=comment.pcno)
                tmp += 'ㄴ';
            tmp += ' commenter=<span class="commenter">' + comment.commenter + '</span>'
            tmp += ' comment=<span class="comment">' + comment.comment + '</span>'
            tmp += ' up_date=' + comment.up_date
            tmp += '<button class="delBtn">삭제</button>'
            tmp += '<button class="modBtn">수정</button>'
            tmp += '<button class="replyBtn">답글</button>'
            tmp += '</li>'
        })

        return tmp + "</ul>";
    }
</script>
</body>
</html>