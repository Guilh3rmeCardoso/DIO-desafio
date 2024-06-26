js
//Variáveis bolinha
let xBolinha = 300;
let yBolinha = 200;
let diametro = 15;
let raio = diametro / 2;

//Variáveis raquete
let xRaquete = 5;
let yRaquete = 150;
let raqueteComprimento = 10;
let raqueteAltura = 90;


//Variáveis velocidade
let velocidadeXBolinha = 6;
let velocidadeYBolinha = 6;



function setup() {
  createCanvas(600, 400);
}

function draw() {
  background(0);
  bolinha()
  movimentoBolinha()
  colisaoBorda()
  mostraRaquete()
  movimentoRaquete()
  
}

function bolinha(){
  circle(xBolinha, yBolinha, diametro);
}

function movimentoBolinha(){
  xBolinha += velocidadeXBolinha;
  yBolinha += velocidadeYBolinha;
}

function colisaoBorda(){
  if (xBolinha + raio > width ||
     xBolinha - raio < 0){
    velocidadeXBolinha *= -1;
  }
  if (yBolinha + raio > height ||
     yBolinha - raio < 0){
    velocidadeYBolinha *= -1;
  }
}

function mostraRaquete(){
  rect(xRaquete, yRaquete, raqueteComprimento, raqueteAltura)
}

function movimentoRaquete(){
  if (keyIsDown(UP_ARROW)){
    yRaquete -= 10;
  }
  if (keyIsDown(DOWN_ARROW)){
    yRaquete += 10;
  }
}