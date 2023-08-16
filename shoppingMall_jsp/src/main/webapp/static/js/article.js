
$(function(){
    let currentIndex = 0;   //현재 이미지
    $(".sliderWrap").append($("#slider").first().clone(true));  //첫번째 이미지를 복사, 마지막에 추가

    setInterval(function(){     //3초에 한번씩 실행
        currentIndex++;     //현재 이미지를 1씩 증가
        $(".sliderWrap").animate({marginLeft: -currentIndex * 100 + "%"}, 600); //이미지 애니메이션

        if(currentIndex == 3){  //마지막 이미지일때
            setTimeout(function(){  
                $(".sliderWrap").animate({marginLeft: 0}, 0);   //애니메이션을 정지
                currentIndex = 0;   //현재이미지 초기화
            }, 700);
        }
    }, 3000);
});
window.onload = function(){
    let currentIndex = 0;       //현재 이미지
    const sliderWrap = document.querySelector(".sliderWrap"); //전체 이미지
    const slider = document.querySelectorAll("#slider");    //각각의 이미지 
    const sliderClone = sliderWrap.firstElementChild.cloneNode(true);   //첫번째 이미지 저장 
    sliderWrap.appendChild(sliderClone);    //복사한 이미지를 마지막에 추가

    setInterval(() => { 
        currentIndex++;     //현재 이미지를 1씩 증가
        sliderWrap.style.marginLeft = -currentIndex * 100 + "%";    //이미지 이동
        sliderWrap.style.transition = "all 0.6s";   //이미지 애니메이션 설정

        if(currentIndex == 3){  //마지막 이미지
            setTimeout(() => {
                sliderWrap.style.transition = "0s"; //애니메이션 정지
                sliderWrap.style.marginLeft = "0";  //이미지 위치 초기화
                currentIndex = 0;   //현재 이미지 초기화
            }, 700);
        }
    }, 3000);
}

