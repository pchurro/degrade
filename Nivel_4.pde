void nivel4setup() {


  ganhou=false;
  perdeu=false;
  estado=false;

  parametros=loadStrings("parametros4.txt");
  n=int(parametros[0]);
  m=int(parametros[1]);
  imagem=loadImage(parametros[2]);
  mov=int(parametros[3]);
  max=int(parametros[4]);
  ganhoubg=loadImage("ganhou4.jpg");
  ellipse=loadImage("ellipse4.png");


  t=n*m;
  pai=t-1;
  x=0;
  y=0;
  jog=0;

  p=new Parte[t];
  pa=new Parte(imagem, n-1, m-1, n, m);

  posOriginalX=new int[t-1];
  posOriginalY=new int[t-1];
  paig=new ArrayList();
  tempxg=new ArrayList();
  tempyg=new ArrayList();
  paxg=new ArrayList();
  payg=new ArrayList();

  tempig=new ArrayList();
  movxg=new ArrayList();
  movyg=new ArrayList();

  for (int i=0; i<t-1; i++) {
    p[i]=new Parte(imagem, x, y, n, m);
    if (x<n-1) x++;
    else {
      x=0;
      y++;
    }
  }

  //Baralhar as peças
  for (int i=0; i<mov; i++) {
    float rand=random(4);
    if (rand<1) {
      pai--;
    } else if (rand>=1 && rand<2) {
      pai++;
    } else if (rand>=2 && rand<3) {
      pai+=n;
    } else if (rand>=3) {
      pai-=n;
    }
    pai=constrain(pai, 0, t-2);
    if ((p[pai].getX()==pa.getX()-1 && p[pai].getY()==pa.getY()) || (p[pai].getX()==pa.getX()+1 && p[pai].getY()==pa.getY()) || 
      (p[pai].getX()==pa.getX() && p[pai].getY()==pa.getY()-1) || (p[pai].getX()==pa.getX() && p[pai].getY()==pa.getY()+1)) {
      paig.add(pai);
      tempx=p[pai].getX();
      tempy=p[pai].getY();
      tempxg.add(tempx);
      tempyg.add(tempy);  
      p[pai].setX(pa.getX());
      p[pai].setY(pa.getY());
      pa.setX(tempx);
      pa.setY(tempy);
      paxg.add(pa.getX());
      payg.add(pa.getY());
    } else mov++;
  }

  //Guardar as posições originais
  for (int i=0; i<t-1; i++) {
    posOriginalX[i]=p[i].getX();
    posOriginalY[i]=p[i].getY();
  }

  posOriginalpax=pa.getX();
  posOriginalpay=pa.getY();
}
