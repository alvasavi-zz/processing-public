//Noise V.6

import processing.pdf.*;

// HColorPool colors;
// HPixelColorist colors;
HColorField colors;

void setup(){

  size(1200,700);

  // HYPE init
  H.init(this).background(#202020);
  smooth();

  // colors = new HColorPool(#FFFFFF, #F7F7F7, #ECECEC, #333333, #0095a8, #00616f, #FF3300, #FF6600);
   // colors = new HPixelColorist("color-sample.jpg").strokeOnly();
  colors = new HColorField(width, height).addPoint(0, height/2, #FF0066, 0.5f).addPoint(width, height/2, #3300FF, 0.5f).fillAndStroke();

  int lineLimit = 60;
  int lineSpace = (int)random(15, 30);
  int step = (int)random(2,5);
  float noiseVar=random(10);

  for(int x=0; x<lineLimit; x++){
    noiseLine((int)random(10, 30)*x, step, noiseVar);
    noiseLine(lineSpace*x, step, noiseVar);
   
    //noiseLine((int)random(20, 30)*x, (int)random(2,5), random(5));
  }

  for(int x=0; x<lineLimit; x++){
    //noiseLine((int)random(10, 30)*x, step, noiseVar);
    noiseLine(lineSpace*x, step, noiseVar);
   
    //noiseLine((int)random(20, 30)*x, (int)random(2,5), random(5));
  }

  noLoop();
  //H.drawStage();

}

void draw(){
    H.drawStage();
}

void noiseLine(float lineSpace, int step, float noiseVar){

    float y = 50; //init position for Y
    float x = 0;

   //noiseDetail(int(random(2,6)),0.35);

    HPath line = new HPath();

    float angle = 0;

    // for (int k=10; k <=width-10; k+=step) {
    for (int k=0; k <=width; k+=step) {

        x=k;
        float rad = radians(angle);
        // y = noise(noiseVar)*60 + lineSpace;
        y = pow(sin(rad) ,2 )*noise(rad*2)*60 + noise(angle/90) * lineSpace;
    
        if(x>0){
           line.vertex(x, y);
           // line.stroke( colors.getColor(), (int)random(50,180) ).strokeWeight(1).noFill();
           line.strokeWeight(1).noFill();
           line.stroke(color((int)random(180,255), (int)random(0,50), (int)random(30,110)), (int)random(50,100));
         }
        
        noiseVar+=0.08;
        angle++;

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