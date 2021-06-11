// alert('hola mundo')


// Boton menú
// 
document.getElementById('btn-menu-lateral').addEventListener("click", function() {
	document.getElementById("panel-lateral").classList.toggle('activar-panel')
})

// 
// 
// 
//  Opciones del Panel Lateral
document.getElementById("panel-lateral").addEventListener("click", opcPanel);
function opcPanel(e) {
	// alert(e)
	// Captura del id y número para el acardeon
	ident = e.target.id;
	numMod = ident.charAt(4);
	console.log(ident);
	// console.log(numMod);
	for (var i = 0; i < 4; i++) {
		if (ident == "mod-" + i) {
			document.getElementById('mod-cuerpo-' + i).classList.toggle('activar-mod-cuerpo-' + i);
		}
	}
	// ancho = screen.width;
	// numAcor = ident.charAt(13);
	// btnAcor = 'btn-acordeon-' + numAcor;
	// btn-mod = 'mod'
}