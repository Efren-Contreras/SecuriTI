<%@ page contentType="text/html; charset=UTF-8" %>
document.getElementById('inputSinEspacios').addEventListener('input', validarEspacios);
document.getElementById('inputContrasenaold').addEventListener('input', validarOldPass);


function validarEspacios() {
    const input = document.getElementById('inputSinEspacios');
    const mensajeError = document.getElementById('mensajeError');
    if (input.value.includes(' ')) {
        input.value = input.value.replace(/\s+/g, '');
        mensajeError.textContent = 'El Campo Nombre del Usuario No permite espacios';
    } else {
        mensajeError.textContent = '';
    }
}

function validarOldPass() {
    const input = document.getElementById('inputContrasenaold');
    const mensajeError = document.getElementById('mensajeErrorPass');
    const passw = '<%=session.getAttribute("password")%>'; // Obtén la contraseña de la sesión
    const btnEditar = document.getElementById('editpassword');
    if (input.value !== passw) {
        mensajeError.textContent = 'La contraseña anterior no coincide';
        btnEditar.disabled = true;
    } else {
        mensajeError.textContent = '';
        btnEditar.disabled = false;
    }
}