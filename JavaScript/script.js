// slider script
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n){
  showSlides(slideIndex += n);
}

function currentSlides(n){
  showSlides(slideIndex = n);
}

    function showSlides(n){
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      if(n > slides.length){
        slideIndex = 1
      }
      if(n < 1){
        slideIndex = slides.length;
      }
      for(i = 0; i < slides.length; i++){
        slides[i].style.display = "none";
      }
      for(i = 0; i < dots.length; i++){
        dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex - 1].style.display = "block";
      dots[slideIndex - 1].className += " active";
    }

    // auto slide 
    // Error to di ko alam pano ifix

    // var slideIndex = 0;
    // showSlides();

    // function showSlides(){
    //   var i;
    //   var slides = document.getElementsByClassName("mySlides");
    //   for(i = 0; i < slides.length; i++){
    //     slides[i].style.display = "none";
    //   }
    //   slideIndex++;
    //   if (slideIndex > slides.length){
    //     slideIndex = 1
    //   }
    //   slides[slideIndex - 1].style.display = "block";
    //   setTimeout(showSlides, 5000);
    // }

/* how it works section js */
const buy = document.querySelector(".switch-buy");
    const sell = document.querySelector(".switch-sell");
    const overflow = document.querySelector(".overflow");
    const switchs =  document.querySelectorAll(".switch");

    let current = 1;

    function tab1(){
      overflow.style.marginLeft = "0";
      sell.style.background = "none";
      buy.style.background = "red";
      switchs[current - 1].classList.remove("active");
    }

    function tab2(){
      overflow.style.marginLeft = "-100%";
      buy.style.background = "none";
      sell.style.background = "cyan";
      switchs[current - 1].classList.add("active");
    }

/* Swiper section in browse car */
    const swiper = new Swiper('.swiper', {
      speed: 400,
      spaceBetween: 20,
      slidesPerView:3,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      }
    });

    /* Pop up Login (DONT EVEN TRY TO MOVE THIS SO FRAGILE) */
document.getElementById("login").addEventListener("click", function( ){
  document.querySelector(".popup").style.display ="flex";
  this.scroll = "disable";
})
document.querySelector(".close").addEventListener("click", function(){
  document.querySelector(".popup").style.display = "none";
})


