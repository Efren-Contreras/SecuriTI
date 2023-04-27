document.getElementById('filName12').addEventListener('input', nome2);
document.getElementById('filName11').addEventListener('input', assigned2);
document.getElementById('filName22').addEventListener('input', manufacturer2);
document.getElementById('filName32').addEventListener('input', so2);


const tabla2 = document.getElementById('tabla2');
const filas0 = tabla2.getElementsByTagName('tr');

function nome2() {
    const filName12 = document.getElementById('filName12');
    const valorFiltro = filName12.value.toLowerCase();
    for (let i = 1; i < filas0.length; i++) {
        const celda = filas0[i].getElementsByTagName('td')[1]; // Buscamos solamente en la primera celda
        const textoCelda = celda.textContent.toLowerCase();
        
        if (textoCelda.includes(valorFiltro)) {
            filas0[i].style.display = '';
        } else {
            filas0[i].style.display = 'none';
        }
    }
}


function assigned2() {
    const filName11 = document.getElementById('filName11');
    const valorFiltro = filName11.value.toLowerCase();

    for (let i = 1; i < filas0.length; i++) {
        const celda = filas0[i].getElementsByTagName('td')[2]; // Buscamos solamente en la primera celda
        const textoCelda = celda.textContent.toLowerCase();
        
        if (textoCelda.includes(valorFiltro)) {
            filas0[i].style.display = '';
        } else {
            filas0[i].style.display = 'none';
        }
    }
}

function manufacturer2() {
    const filName22 = document.getElementById('filName22');
    const valorFiltro = filName22.value.toLowerCase();

    for (let i = 1; i < filas0.length; i++) {
        const celda = filas0[i].getElementsByTagName('td')[3]; // Buscamos solamente en la primera celda
        const textoCelda = celda.textContent.toLowerCase();
        
        if (textoCelda.includes(valorFiltro)) {
            filas0[i].style.display = '';
        } else {
            filas0[i].style.display = 'none';
        }
    }
}

function so2() {
    const filName32 = document.getElementById('filName32');
    const valorFiltro = filName32.value.toLowerCase();

    for (let i = 1; i < filas0.length; i++) {
        const celda = filas0[i].getElementsByTagName('td')[4]; // Buscamos solamente en la primera celda
        const textoCelda = celda.textContent.toLowerCase();
        
        if (textoCelda.includes(valorFiltro)) {
            filas0[i].style.display = '';
        } else {
            filas0[i].style.display = 'none';
        }
    }
}


