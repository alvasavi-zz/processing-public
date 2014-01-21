 float x = 0.0;
 float nScale = 0.01;

void setup(){

  size(1000,700);
  background(200);
  strokeWeight(1);
  smooth();

  int lineLimit = 33;
  int lineSpace = 15;

  for(int x=0; x<lineLimit; x++){
    noiseLine(lineSpace*x);
  }

}


void noiseLine(float lineSpace){

    stroke(random(1,5), random(30,90));

    int step = 10;
    float lastx = 0;
    float lasty = 0;
    float noiseVar = step;
    float y = 0;

    for (int x=0; x <=width; x+=step) {

        noiseDetail(8,0.5);

        y = (noise(noiseVar)*100)+noise(noiseVar+0.1, noiseVar)*lineSpace;
        noiseVar+=0.2;

         line(x, y, lastx, lasty);

         // fill(#990000);
         // ellipse(x, y,3,3);


        //println("y:" + y + " ,lasty:"+lasty);

        lastx = x;
        lasty = y;

    }
}

