import processing.video.*;
import processing.sound.*;

int screen=110;
int proxnivel;

PFont font;

SoundFile errado, vitoria, derrota, musica;

String[] parametros;
int n, m;
PImage imagem;
int mov;
int max;


int x, y;
int t;
int tempx, tempy;
int tempi;
int pai;
int v;
int jog;

//Arrays para guardar as posições originais e o baralhamento inicial
int[] posOriginalX;
int[] posOriginalY;
int posOriginalpax;
int posOriginalpay;
ArrayList paig;
ArrayList tempxg;
ArrayList tempyg;
ArrayList paxg;
ArrayList payg;

//Arrays para guardar os movimentos do jogador;
ArrayList tempig;
ArrayList movxg;
ArrayList movyg;

boolean ganhou;
boolean perdeu;
boolean estado;

Parte p[];
Parte pa;

void setup() {
  size(650, 700);
  font=createFont("circular.otf", 200);
  textFont(font);
  intsetup();
  menusetup();
  ganhousetup();
  sobresetup();
  selecaosetup();
  //ATENÇÃO:MUDAR DIRETÓRIAS DOS FICHEIROS DE SOM
  errado=new SoundFile(this, "C:\\Users\\pedro\\Google Drive\\Projeto pm\\Projeto_final\\errado.wav");
  vitoria=new SoundFile(this, "C:\\Users\\pedro\\Google Drive\\Projeto pm\\Projeto_final\\vitoria.wav");
  derrota=new SoundFile(this, "C:\\Users\\pedro\\Google Drive\\Projeto pm\\Projeto_final\\derrota.wav");
  musica=new SoundFile(this, "C:\\Users\\pedro\\Google Drive\\Projeto pm\\Projeto_final\\musica.mp3");
  errado.amp(0.3);
  vitoria.amp(0.5);
  musica.amp(0.5);
  voltar3=new Button(width-75, 675, 200, 100, voltarimg, 255);
}

void draw() {
  if (screen==110) {
    intdraw();
  } else if (screen==210) {
    menudraw();
  } else if (screen==220) {
    selecaodraw();
  } else if (screen==230) {
    sobredraw();
  } else if (screen>=310 && screen<=340) {
    niveldraw();
  } else if (screen==350) {
    ganhoudraw();
  } else if (screen==360) {
    perdeudraw();
  }
}

void mousePressed() {
  if (screen==360) {
    perdeump();
  } else if (screen==350) {
    ganhoump();
  } else if (screen>=310 && screen<=340) {
    nivelmp();
  } else if (screen==230) {
    sobremp();
  } else if (screen==220) {
    selecaomp();
  } else if (screen==210) {
    menump();
  }
}
