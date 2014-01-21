 float x = 0.0;
 float nScale = 0.01;

void setup(){

  size(900,600);
  background(200);
  strokeWeight(1);
  smooth();

  int lineLimit = 200;
  for(int x=0; x<lineLimit; x++){
    noiseLine(x*height/lineLimit-35);
  }

}


void noiseLine(float r){

    stroke(1, random(30,90));

    int step = 10;
    float lastx = 0;
    float lasty = 0;
    float ynoise = random(5);
    float noiseVar = step;

    float y=0;

    for (int x=0; x <=width; x+=step) {


        // y = noise(ynoise+10)*65+10;
        y = noise(noiseVar+10)*65+10;
        noiseVar+=0.1;


         line(x, y+r, lastx, lasty+r);
        // line(x, y, lastx, lasty);

        println("y:" + y + " ,lasty:"+lasty);

        lastx = x;
        lasty = y;
        ynoise += 0.1;

    }
}

