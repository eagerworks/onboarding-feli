const heart = document.querySelector(".heart");
const plusButton = document.querySelector(".sum");
const minusButton = document.querySelector(".minus");
const quantityNumber = document.querySelector(".number");
const totalSum = document.getElementById("total");

let heartActive = false;
let quantity = 0;

heart.addEventListener('click', () => {
  heartActive = !heartActive;
  heartActive ? heart.classList.add('bg-red') : heart.classList.remove('bg-red');
});

const aditionalsList = [
  { name: "Pan de Pita relleno - Mini", price: 25, on: false },
  { name: "Pan de Pita relleno - Grande", price: 50, on: false },
  { name: "Agregar logo de tu empresa", price: 0, on: false },
  { name: "Agregar una tarjeta con mensaje", price: 0, on: false }
];

const calculateTotalSum = () => {
  const value = aditionalsList.reduce((accumulator, currentValue) => currentValue.on ? accumulator + currentValue.price : accumulator, 1580);

  totalSum.innerHTML = value * quantity;
};


aditionalsList.forEach((extraItem, index) => {
  const html = `
    <div class="flex gap-3">
      <label class="switch">
        <input type="checkbox" id="extra${index}">
        <span class="slider round"></span>
      </label>
    <div class="flex flex-col gap-0-5">
      <p class="text-base leading-tight tracking-tight font-normal"> ${extraItem.name} </p>
      <p class="text-sm font-light leading-snug tracking-tight">${extraItem.price === 0 ? "Sin Costo" : `$${extraItem.price}`} adicional</p>
    </div>
  </div>`

  const container = document.getElementById("extras");
  container.insertAdjacentHTML('beforeend', html);

  const addedElement = document.getElementById(`extra${index}`);
  addedElement.addEventListener('change', () => {
    extraItem.on = !extraItem.on;
    calculateTotalSum();
  })
});


plusButton.addEventListener('click', () => {
  quantity++;
  quantityNumber.innerHTML = quantity;
  calculateTotalSum();
});

minusButton.addEventListener('click', () => {
  if (quantity > 0) {
    quantity--;
    quantityNumber.innerHTML = quantity;
  }
  calculateTotalSum();
});
