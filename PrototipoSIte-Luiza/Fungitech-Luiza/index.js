// ancora do header //

const menuLinks = document.querySelectorAll("header a");

menuLinks.forEach(link => { link.addEventListener("click", scrollToSection); });

function scrollToSection(event) {
  event.preventDefault();
  const sectionId = event.target.getAttribute("href");
}

window.onscroll = function () {
  var screenSize = window.innerWidth; // Obtém o tamanho total da tela

  // Verifica o tamanho da tela e atualiza o valor conforme necessário
  if (screenSize >= 1024) { // Desktop
    var threshold = 700;
  } else if (screenSize >= 768) { // Tablet
    var threshold = 400;
  } else { // Celular
    var threshold = 200;
  }

  if (document.documentElement.scrollTop > threshold) {
    document.getElementById("head").classList.add("pop");
  } else {
    document.getElementById("head").classList.remove("pop");
  }
};


// efeito de opacidade ao descer a página //

function isAnyPartOfElementInViewport(element) {
  const rect = element.getBoundingClientRect();
  const windowHeight = (window.innerHeight || document.documentElement.clientHeight);
  const windowWidth = (window.innerWidth || document.documentElement.clientWidth);

  const vertInView = (rect.top <= windowHeight) && ((rect.top + rect.height) >= 0);
  const horInView = (rect.left <= windowWidth) && ((rect.left + rect.width) >= 0);

  return (vertInView && horInView);
}

function scrollHandler() {
  document.querySelectorAll('.show-on-scroll:not(.is-visible)').forEach((element) => {
    if (isAnyPartOfElementInViewport(element) && !element.classList.contains('is-visible')) {
      element.classList.add('is-visible');
    }
  })
}

window.addEventListener('scroll', scrollHandler);

scrollHandler();

const texts = [
  "É AUTOMAÇÃO!",
  "É INOVAÇÃO NO MERCADO!",
  "É ECONOMIA!"
];
let currentTextIndex = 0;
let isDeleting = false;
let typingSpeed = 100; // Velocidade da digitação em milissegundos

function type() {
  const text = texts[currentTextIndex];
  const currentSpanText = document.getElementById("typing-effect").textContent;

  if (isDeleting) {
    // Apagando o texto
    document.getElementById("typing-effect").textContent = currentSpanText.substring(0, currentSpanText.length - 1);
  } else {
    // Digitação normal
    document.getElementById("typing-effect").textContent = text.substring(0, currentSpanText.length + 1);
  }

  // Controla a velocidade da digitação
  typingSpeed = isDeleting ? 50 : 100;

  // Verifica se a digitação/apagamento está completo
  if (!isDeleting && currentSpanText === text) {
    isDeleting = true;
    typingSpeed = 1000; // Tempo de pausa após a digitação completa
  } else if (isDeleting && currentSpanText === "") {
    isDeleting = false;
    currentTextIndex = (currentTextIndex + 1) % texts.length; // Avança para o próximo texto no array
  }

  setTimeout(type, typingSpeed);
}

// Inicia a função de digitação
window.onload = function () {
  type();
};

