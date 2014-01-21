 float x = 0.0;
 float nScale = 0.01;

void setup(){

  size(1000,700);
  background(180);
  strokeWeight(1);
  smooth();

  int lineLimit = 53;
  int lineSpace = 15;

  for(int x=0; x<lineLimit; x++){

    noiseLine(lineSpace*x);
  }

  noLoop();

}

void draw(){
    // Nothing to see here!
}

void noiseLine(float lineSpace){

    // stroke(random(150, 204), random(50, 102), random(0, 50), random(30,180));
    stroke(random(50, 180),random(30,180));


    int step = 20;
    float lastx = 0;
    float lasty = 0;
    float noiseVar = step;
    float y = 0;

    noiseDetail(int(random(2,6)),0.35);

    for (int x=0; x <=width; x+=step) {

        y = (noise(noiseVar)*100)+noise(noiseVar+random(1,3)/100, noiseVar+random(1,2)/100)*random(lineSpace-30/3, lineSpace+30/3);
        noiseVar+=0.1;

         line(x, y, lastx, lasty);

          // fill(#990000);
          // ellipse(x, y,1,1);

        lastx = x;
        lasty = y;

    }
}

void keyPressed() {
    if (keyCode == ENTER) {
        saveFrame("noise-####.png");
    }
}

