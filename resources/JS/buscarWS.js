document.getElementById('filName').addEventListener('input', nome);
document.getElementById('filName1').addEventListener('input', assigned);
document.getElementById('filName2').addEventListener('input', manufacturer);
document.getElementById('filName3').addEventListener('input', so);

const filas = document.getElementById('tabla').getElementsByTagName('tr');

function nome() {
    const filName = document.getElementById('filName');
    const valorFiltro = filName.value.toLowerCase();
    for (let i = 1; i < filas.length; i++) {
        const celda = filas[i].getElementsByTagName('td')[1];
        const textoCelda = celda.textContent.toLowerCase();
    
        if (textoCelda.includes(valorFiltro)) {
            filas[i].style.display = '';
        } else {
            filas[i].style.display = 'none';
        }
    }
}

function assigned() {
    const filName1 = document.getElementById('filName1');
    const valorFiltro = filName1.value.toLowerCase();

    for (let i = 1; i < filas.length; i++) {
        const celda = filas[i].getElementsByTagName('td')[2];
        const textoCelda = celda.textContent.toLowerCase();
        
        if (textoCelda.includes(valorFiltro)) {
            filas[i].style.display = '';
        } else {
            filas[i].style.display = 'none';
        }
    }
}

function manufacturer() {
    const filName2 = document.getElementById('filName2');
    const valorFiltro = filName2.value.toLowerCase();

    for (let i = 1; i < filas.length; i++) {
        const celda = filas[i].getElementsByTagName('td')[3];
        const textoCelda = celda.textContent.toLowerCase();
        
        if (textoCelda.includes(valorFiltro)) {
            filas[i].style.display = '';
        } else {
            filas[i].style.display = 'none';
        }
    }
}

function so() {
    const filName3 = document.getElementById('filName3');
    const valorFiltro = filName3.value.toLowerCase();

    for (let i = 1; i < filas.length; i++) {
        const celda = filas[i].getElementsByTagName('td')[4];
        const textoCelda = celda.textContent.toLowerCase();
        
        if (textoCelda.includes(valorFiltro)) {
            filas[i].style.display = '';
        } else {
            filas[i].style.display = 'none';
        }
    }
}

