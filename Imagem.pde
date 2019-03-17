class Imagem {
  PImage img;

  Imagem(PImage img) {
    this.img=img;
  }
}

class Parte extends Imagem {
  PImage imgp;
  int x, y;
  int posX, posY;
  int n, m;
  int w, h;
  int pox, poy;
  boolean select;

  Parte(PImage img, int x, int y, int n, int m) {
    super(img);
    this.n=n;
    this.m=m;
    w=(img.width)/n;
    h=(img.height)/m;
    this.x=x;
    this.y=y;
    posX=x*w;
    posY=y*h;
    pox=x;
    poy=y;
    imgp=createImage((img.width)/n, (img.height)/m, RGB);
    imgp=img.get(x*w, y*h, (img.width)/n, (img.height)/m);
  }

  int getX() {
    return x;
  }

  int getY() {
    return y;
  }

  int getN() {
    return n;
  }

  int getM() {
    return m;
  }

  int getW() {
    return w;
  }

  int getH() {
    return h;
  }

  void display() {
    imageMode(CORNER);
    tint(255);
    image(imgp, posX, posY);
    noFill();
    if (select) {
      stroke(255);
      strokeWeight(3);
      noFill();
      rect(posX, posY, w, h);
    }
  }

  boolean hit() {
    if (mouseX>(x*w) && mouseX<(x*w)+w && mouseY>(y*h) && mouseY<(y*h)+h) return true;
    else return false;
  }

  void setX(int v) {
    x=v;
  }

  void setY(int v) {
    y=v;
  }

  void setPosX(int v) {
    posX=v;
  }

  void setPosY(int v) {
    posY=v;
  }

  void anim() {

    if (posX>x*w) {
      posX-=img.width/100;
    } else if (posX<x*w) {
      posX+=img.width/100;
    }

    if (posY>y*h) {
      posY-=img.height/100;
    } else if (posY<y*h) {
      posY+=img.height/100;
    }

  }

  boolean posicaoOriginal() {
    if (x==pox && y==poy) return true;
    else return false;
  }
  
}
