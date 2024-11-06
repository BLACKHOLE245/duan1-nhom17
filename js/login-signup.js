const container = document.getElementById('container');
const registerBtn = document.getElementById('register');
const loginBtn = document.getElementById('login');
const registerForm = document.querySelector('.form-container.sign-up form');
const loginForm = document.querySelector('.form-container.sign-in form');

registerBtn.addEventListener('click', () => {
    container.classList.add("active");
    loginForm.querySelectorAll('[name]').forEach(input => {
        input.name = '';
    });
});

loginBtn.addEventListener('click', () => {
    container.classList.remove("active");
    registerForm.querySelectorAll('[name]').forEach(input => {
        input.name = '';
    });
});
