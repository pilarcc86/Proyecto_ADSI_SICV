document.getElementById('myForm').addEventListener("submit" validar, false);

function validar(evt) {
	let user = document.getElementById("user").value;
	let pass = document.getElementById("pass").value;

	if (user == 'ricardo@gmail.com' && pass == '1602') {
		window.location = '...app/1_usuario/usuario.html';
		evt.preventDefault();
	} else {
		alert("usuario incorrecto");
		evt.preventDefault();
	}
}