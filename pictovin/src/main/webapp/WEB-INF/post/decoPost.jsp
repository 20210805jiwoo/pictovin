<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다이어리 꾸미기 페이지</title>
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/decoPost.css' />">
<style>
.draggable {
   position: absolute;
   cursor: move;
   user-select: none;
}

#diaryBox {
   position: relative;
}

#decoContainer {
   display: flex;
   flex-wrap: wrap;
}

.decoItem {
   margin: 5px;
   cursor: pointer;
}
</style>
<script>
   function allowDrop(event) {
      event.preventDefault();
   }

   function drop(event) {
      event.preventDefault();
      var emojiId = event.dataTransfer.getData("text/plain")
            || event.currentTarget.getAttribute('data-id');

      console.log("드래그한 이모지의 ID:", emojiId);
      console.log("event.target:", event.target);

      if (emojiId) {
         var newId = "emoji_" + Date.now();
         var emojiElement = document.getElementById(emojiId);

         if (emojiElement) {
            var emojiClone = emojiElement.cloneNode();
            emojiClone.classList.add("draggable");
            emojiClone.id = newId;

            var diaryBox = document.getElementById("diaryBox");

            console.log("드랍 이벤트 발생");
            console.log("이모지 추가:", newId);

            // 드랍한 위치에서 이모지 추가
            emojiClone.style.left = event.pageX - emojiClone.clientWidth
                  / 2 + "px";
            emojiClone.style.top = event.pageY - emojiClone.clientHeight
                  / 2 + "px";

            // 드래그 이벤트 추가
            emojiClone.onmousedown = function(e) {
               dragElement(e, emojiClone);
            };

            // 이모지를 diaryBox 안에 추가
            diaryBox.appendChild(emojiClone);

            console.log("이모지가 성공적으로 드랍되었습니다. ID:", newId);
         } else {
            console.log("ID가", emojiId, "인 요소를 찾을 수 없습니다.");
         }
      } else {
         console.log("ID를 찾을 수 없습니다.");
      }
   }

   function dragElement(e, el) {
      e = e || window.event;
      e.preventDefault();
      // 마우스 클릭 지점의 초기 좌표 얻기
      var initialX = e.clientX;
      var initialY = e.clientY;

      // 요소의 현재 위치 얻기
      var currentX = e.clientX;
      var currentY = e.clientY;

      // 마우스 움직임에 따라 요소 이동
      function dragMove(e) {
         e = e || window.event;
         e.preventDefault();
         // 계산된 새로운 좌표 얻기
         currentX = initialX - e.clientX;
         currentY = initialY - e.clientY;

         initialX = e.clientX;
         initialY = e.clientY;

         // 새로운 위치 설정
         el.style.left = (el.offsetLeft - currentX) + "px";
         el.style.top = (el.offsetTop - currentY) + "px";
      }

      // 마우스 이동 이벤트 리스너 등록
      document.onmousemove = dragMove;

      // 마우스 놓았을 때 이벤트 리스너 등록
      document.onmouseup = function() {
         // 마우스 이동 이벤트 리스너 해제
         document.onmousemove = null;
         document.onmouseup = null;
      };
   }

   var decoItems = document.querySelectorAll('.decoItem');
   decoItems.forEach(function(item) {
      item.draggable = true;
      item.addEventListener('dragstart', function(event) {
         var emojiId = item.id;
         event.dataTransfer.setData('text/plain', emojiId);
      });
   });
</script>
</head>

<body>
   <div id="diary">
      <div id="diaryBox" ondrop="drop(event)" ondragover="allowDrop(event)">
         <p id="date"><%=java.time.LocalDate.now().toString()%></p>
         <div id="diaryContent">
            <img id="diaryImage"
               src="<c:url value='/images/lifesnapshot.png' />" alt="인생네컷 사진">
            <div id="diaryText">
               <p>오늘 오랜만에 댕댕씨를 만나서 알찬 수다를 떨었다. 오랜만에 맛집도 가고, 분위기 좋은 카페도 갔지만
                  댕댕씨와 함께라서 더욱 특별하게 느껴지는 하루였다. 사진도 아주 만족스럽다. 다음에 또 봤으면 좋겠다~</p>
            </div>
         </div>
      </div>
   </div>

   <div id="decorations">
      <p id="sticker">STICKER</p>

      <div id="decoContainer">
         <div class="decoItem" id="🦊">🦊</div>
         <div class="decoItem" data-id="snowman">☃️</div>
         <div class="decoItem" id="tree">🎄</div>
         <div class="decoItem" id="clover">🍀</div>
         <div class="decoItem" id="computer">🖥️</div>
         <div class="decoItem" id="balloon">🎈</div>
         <div class="decoItem" id="heart">❤️</div>
         <div class="decoItem" id="song">🎶</div>
         <div class="decoItem" id="ghost">👻</div>
         <div class="decoItem" id="koala">🐨</div>
         <div class="decoItem" id="eyes">👀</div>
         <div class="decoItem" id="trophy">🏆</div>
         <div class="decoItem" id="lip">👄</div>
         <div class="decoItem" id="alien">👽</div>
         <div class="decoItem" id="face1">🫡</div>
         <div class="decoItem" id="face2">😡</div>
         <div class="decoItem" id="face3">🤩</div>
         <div class="decoItem" id="monkey">🙉</div>
         <div class="decoItem" id="face4">😎</div>
         <div class="decoItem" id="skull">☠️</div>
         <div class="decoItem" id="pizza">🍕</div>
         <div class="decoItem" id="airplane">✈️</div>
         <div class="decoItem" id="candy">🍬</div>
         <div class="decoItem" id="ribbon">🎀</div>
         <div class="decoItem" id="firework">🎉</div>
         <div class="decoItem" id="leaves">🍂</div>
      </div>
      <a href="<c:url value='/post/tag'/>">
         <button id="completeButton" onclick="completeDiary()">다이어리
            꾸미기 완료</button>
      </a>
   </div>

</body>

</html>