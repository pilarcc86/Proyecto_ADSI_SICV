// alert('hola mundo');

document.getElementById("myForm").addEventListener('submit', validar, false);

function validar(evt) {
	let user = document.getElementById("user").value;
	let pass = document.getElementById("pass").value;

	if (user == 'admin@correo.com' && pass == '12345') {
		window.location = 'index-panel.html';
		evt.preventDefault();
	}
	else if (user == 'cliente@correo.com' && pass == '12345') {
		window.location = 'index-cliente.html';
		evt.preventDefault();
	}
	else {
		swal({
			title: "Contraseña inválida!",
			text: "Contraseña inválida!",
			icon: "warning",
			button: "Aceptar",
			dangerMode: true,
		});
		evt.preventDefault();
	}
}