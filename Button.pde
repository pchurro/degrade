class Button {

  int x, y;
  int w, h;
  PImage imagem;
  color tint;

  Button(int x, int y, int w, int h, PImage imagem, color tint) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.imagem=imagem;
    this.tint=tint;
  }

  void desenha() {
    tint(tint);
    imageMode(CENTER);
    image(imagem, x, y, w, h);
  }

  void setImagem(PImage imagem) {
    this.imagem=imagem;
  }

  boolean hit(int xr, int yr) {
    if (xr>x-w/2 && xr<x+w/2 && yr>y-h/2 && yr<y+h/2) return true;
    else return false;
  }
}
