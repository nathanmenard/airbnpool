import flatpickr from "flatpickr"
// import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import "flatpickr/dist/themes/airbnb.css"

const getTotalPrice = () => {
  const dailyPrice = document.getElementById("modal-daily-price").innerText;
  // console.log(dailyPrice);
  const dailyPriceParsed = parseInt(dailyPrice, 10);
  console.log(dailyPriceParsed);

  let startingDate = document.getElementById("starting-date").value;
  // console.log(startingDate);
  let startingDateProcessed = new Date(startingDate) / 1000 / 60 / 60 / 24;
  console.log(startingDateProcessed);
  let endingDate = document.getElementById("ending-date").value;
  // console.log(endingDate);
  let endingDateProcessed = new Date(endingDate) / 1000 / 60 / 60 / 24;
  console.log(endingDateProcessed);

  let duration = (endingDateProcessed + 1) - startingDateProcessed;
  console.log(duration);

  let totalPrice = duration * dailyPriceParsed;
  console.log(totalPrice);

  document.getElementById('total-price').innerHTML = totalPrice;
}

// flatpickr(".datepicker", {})

flatpickr(".datepicker", {
  altInput: true,
  minDate: "today",
  onChange: getTotalPrice,
})

// useless comment
