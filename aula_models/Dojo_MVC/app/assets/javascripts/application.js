// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap
//= require_tree .

var texto = document.getElementById("texto");
texto.addEventListener('click', function() {
  texto.style.color = "white";
});
texto.addEventListener('mouseenter', ()=>{
  texto2 = document.createElement('p');
  texto2.setAttribute('id','ale');
  texto2.innerHTML = "aleatório";
  texto.appendChild(texto2);
});
texto.addEventListener('mouseout', ()=>{
  document.getElementById('ale').remove();
});

var linha = prompt("Digite a quantidade de linhas");
var coluna = prompt("Digite a quantidade de colunas");
var i, j;

var table = document.createElement('table');
texto.appendChild(table);
for(i = 1; i <= linha; i++) {
  var tr = document.createElement('tr');
  table.appendChild(tr);
  for(j = 1; j <= coluna; j++) {
    var td  = document.createElement('td');
    tr.appendChild(td);
    var valor = i*j;
    td.innerHTML = valor;
  }
}

