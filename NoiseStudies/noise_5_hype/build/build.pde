//Noise V.5

import processing.pdf.*;

void setup(){

  size(1000,700);

  // HYPE init
  H.init(this).background(#333333);
  smooth();

  int lineLimit = 14;
  int lineSpace = 45;

  for(int x=0; x<lineLimit; x++){
    noiseLine(lineSpace*x);
  }

  noLoop();
  //H.drawStage();

}

void draw(){
    H.drawStage();
}

void noiseLine(float lineSpace){

    int step = 10;
    float lastx = 0;
    float lasty = 0;
    float noiseVar=random(10);
    float y = 0;
    float x = 0;

    //noiseDetail(int(random(2,6)),0.35);

    HPath line = new HPath();

    for (int k=10; k <=width-10; k+=step) {

        x=k;
        // noiseVar = step;
        y = noise(noiseVar)*50 + lineSpace;
        
        if(x>0){
           line.vertex(x, y);
           // line.vertex(lastx, lasty);
           line.stroke(#FFFFFF).strokeWeight(0.5).noFill();
        }

        // lastx = x;
        // lasty = y;
        noiseVar+=0.1;

    }

    H.add(line);

}


void keyPressed() {
    if (keyCode == ENTER) {
        saveVector();
    }
}

void saveVector(){
    PGraphics temp = null;
    long timestamp = new Date().getTime();
    temp = beginRecord(PDF, "render_"+timestamp+".pdf");
    // temp = beginRecord(PDF, "render_####.pdf");

    if(temp == null){
        H.drawStage();

    }else{
        H.stage().paintAll(temp, false, 1); //PGraphics, uses3D, alpha
    }

    endRecord();
}