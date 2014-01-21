
import processing.pdf.*;

void setup(){

  size(1000,700);

  // HYPE init
  H.init(this).background(180);
  smooth();

  int lineLimit = 53;
  int lineSpace = 15;

  H.drawStage();

  for(int x=0; x<lineLimit; x++){
    strokeWeight(1);
    noiseLine(lineSpace*x);
  }

  noLoop();

}

void draw(){
    // Nothing to see here!
   // H.drawStage();
}

void noiseLine(float lineSpace){

    stroke(random(50, 180),random(30,180));

    int step = 20;
    float lastx = 0;
    float lasty = 0;
    float noiseVar = step;
    float y = 0;

    noiseDetail(int(random(2,6)),0.35);

    for (int x=0; x <=width; x+=step) {

        y = (noise(noiseVar)*100)+lineSpace;
        noiseVar+=0.05;

         line(x, y, lastx, lasty);

          // fill(#990000);
          // ellipse(x, y,1,1);

        lastx = x;
        lasty = y;

    }
}


void keyPressed() {
    if (keyCode == ENTER) {
        // saveFrame("noise-####.png");
        saveVector();
    }
}

void saveVector(){
    PGraphics temp = null;
    temp = beginRecord(PDF, "render.pdf");

    if(temp == null){
        H.drawStage();

    }else{
        H.stage().paintAll(temp, false, 1); //PGraphics, uses3D, alpha
    }

    endRecord();
}