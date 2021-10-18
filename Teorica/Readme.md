# EEA

Canal de youtube: https://www.youtube.com/channel/UC5Rup8Tq90zOekekkNlSdRQ/playlists

* Andres Farall - Titular
	* Intro: https://www.youtube.com/watch?v=buVwERUX-oY&list=PLN2e9R_DoC0RvauNrK8X5-MbV21jEiaSN
* Juan Manuel Barriola (Economista, en Despegar)
* Sofia Clara Perini (Economista, Comercio internacional, Stata analytics)


Herramientas estadísticas
Modelo Lineal
Redes neuronales

Que queremos captar de los datos con cada uno de los métodos?


# Utils

* Formulas math - latex: https://www.hostmath.com/
* Latex - to html - to git: https://jsfiddle.net/8ndx694g/

HTML:

	<label for="input">Latex equation: </label>
	<!-- <input type="text" name="input"> -->
	<br><textarea rows="10" cols="50" name="input"></textarea>
	<br><br>

	<button onClick="toGithubRenderURL()">Encode to github render URL</button>
	<br><br>

	<label for="output">The URL is: </label>
	<input type="url" name="output">
	<br><br>

	<label for="result">The result is: </label>
	<p id="result"></p>

JS:

	function toGithubRenderURL() {
		var input = document.getElementsByName('input')[0].value;
		var output = '<img src="https://render.githubusercontent.com/render/math?math=' + encodeURIComponent(input) + '">';
		document.getElementsByName('output')[0].value = output;
		document.getElementById('result').innerHTML = output;
	}
