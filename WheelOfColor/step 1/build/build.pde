import processing.pdf.*;

HDrawablePool pool;
HColorPool colors;

boolean paused = false;
boolean record = false;

void setup() {
 size(1200, 800);
 H.init(this).background(#202020);
 smooth();

// MailChimp colors 2 levels
 colors = new HColorPool()
    .add(#2C9AB7)
    .add(#52BAD5)
    .add(#449A88)
    .add(#72C1B0)
    .add(#FEBE12)
    .add(#FED156)
    .add(#DB3A1B)
    .add(#E85C41);

    pool = new HDrawablePool(48);
    pool.autoAddToStage()
    .add(new HShape("circle1.svg"))
    .add(new HShape("circle2.svg"))
    .add(new HShape("circle3.svg"))
    .add(new HShape("circle4.svg"))

    .onCreate(
        new HCallback(){
            public void run(Object obj){
                float ranScale = 1 + ( (int)random(32)*0.3 );

                HShape d = (HShape) obj;
                d
                    .enableStyle(false)
                    .anchorAt(H.CENTER)
                    .loc( width/2, height/2 )
                    .scale( ranScale )
                    .noFill()
                    .strokeWeight(5 * (1/ranScale) )
                    .strokeJoin(SQUARE)
                    .strokeCap(SQUARE)
                ;
                d.randomColors(colors.strokeOnly());

                // rotation

                float ranSpeed = random(-6,6);
                if (ranSpeed == 0) ranSpeed = 1;
                new HRotate(d, ranSpeed );

            }
        }
    ).requestAll();
}

void draw(){
    H.drawStage();
}

// pause, restart, advance 1 / with key presses

// spacebar = pause and restart animation
// +        = redraw() advances 1 iteration in the animation
// r        = render to PDF

void keyPressed() {
    if (key == ' ') {
        if (paused) {
            loop();
            paused = false;
        } else {
            noLoop();
            paused = true;
        }
    }

    if (key == '+') {
        redraw();
    }

    if (key == 'r') {
        record = true;
        saveVector();
    }
}

void saveVector() {
    PGraphics tmp = null;
    tmp = beginRecord(PDF, "render_#####.pdf");

    if (tmp == null) {
        H.drawStage();
    } else {
        H.stage().paintAll(tmp, false, 1); // PGraphics, uses3D, alpha
    }

    endRecord();
}

