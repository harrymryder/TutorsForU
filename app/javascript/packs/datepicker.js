import flatpickr from 'flatpickr'

const dateElement = document.getElementById('date')

flatpickr(dateElement, {enableTime: true,
    dateFormat: "Y-m-d H:i"})
