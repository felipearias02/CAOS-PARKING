document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("formulario");
    const input = document.getElementById("apartamento");
    const resultados = document.getElementById("resultados");

    form.addEventListener("submit", function (e) {
        e.preventDefault();

        const numeroApartamento = input.value.trim();
        if (!numeroApartamento) {
            resultados.innerHTML = "<p>Por favor, ingresa un número de apartamento.</p>";
            return;
        }

        fetch(`http://127.0.0.1:5000/buscar?apartamento=${numeroApartamento}`)
            .then(response => response.json())
            .then(data => {
                resultados.innerHTML = "";

                if (data.error) {
                    resultados.innerHTML = `<p>${data.error}</p>`;
                } else if (Array.isArray(data) && data.length > 0) {
                    data.forEach(parqueadero => {
                        const item = document.createElement("p");
                        item.textContent = `Tipo: ${parqueadero.tipo}, Número: ${parqueadero.numero}`;
                        resultados.appendChild(item);
                    });
                } else {
                    resultados.innerHTML = "<p>No se encontraron parqueaderos asignados.</p>";
                }
            })
            .catch(error => {
                console.error("Error al consultar:", error);
                resultados.innerHTML = "<p>Error al consultar el servidor.</p>";
            });
    });
});