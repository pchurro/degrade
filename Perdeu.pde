void perdeudraw() {
  background(0);
  imageMode(CORNER);
  image(ganhoubg, 0, 0);
  imageMode(CENTER);
  inc_ang=PI/75;
  image(ellipse, width/2+25*cos(ang), height/2+25*sin(ang));
  selecaoniveis.desenha();
  voltar.desenha();

  fill(255);
  textSize(32);
  text("movimentos possíveis:", 60, width/2 - paig.size()*5);

  for (int i=0; i<paig.size(); i++) {
    textSize(12);
    if (width/2 - paig.size()*5 + (i+1)*20 < 600) {
      text("peça "+((int) paig.get(i)+1)+" vai para:("+(int) paxg.get(i)+","+(int) payg.get(i)+")", 60, width/2 - paig.size()*5 + (i+1)*20);
    } else {
      text("peça "+((int) paig.get(i)+1)+" vai para:("+(int) paxg.get(i)+","+(int) payg.get(i)+")", 210, width/2 - paig.size()*5 + ((paig.size()-i))*20);
    }
  }

  if (ang>=TWO_PI) ang=0;
  else ang+=inc_ang;

  fill(255);
  textSize(32);
  text(jog+"/"+max, 20, 685);
}

void perdeump() {
  if (selecaoniveis.hit(mouseX, mouseY)) screen=220;
  if (voltar.hit(mouseX, mouseY)) screen=210;
}
