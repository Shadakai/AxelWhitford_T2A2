// Javascript needed for navbar 

    const burgerIcon = document.querySelector('#burger');
    const navbarMenu = document.querySelector('#nav-link');

    burgerIcon.addEventListener('click', () => {
      navbarMenu.classList.toggle('is-active');
    });
