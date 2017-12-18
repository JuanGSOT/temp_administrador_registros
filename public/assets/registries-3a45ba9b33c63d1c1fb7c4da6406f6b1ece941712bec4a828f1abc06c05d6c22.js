

new Chart(document.getElementById("chart_teacher"), {
    type: 'pie',
    data: {
      labels: ["Sistemas y Computación", "Ciencias Basicas", "Metal Mecánica"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd", "#8e5ea2", "#3cba9f"],
        data: [3, 2, 4]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});
