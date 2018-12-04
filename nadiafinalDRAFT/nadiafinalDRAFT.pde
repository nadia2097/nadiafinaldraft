// mode 1 is the start screen
// mode 2 is the about page
// mode 3 is the actual work itself
import processing.video.*;
int mode = 1;
// 0 is false;
boolean buttonClicked = false;
float back;
Star[] starList = new Star[50]; 
PImage img;
float circleX;
Movie video;

void setup() {
  size(1000, 800);
  img = loadImage("p1i.png");
  video = new Movie(this, "titlemp4.mp4");
  //video.play();
  for (int i = 0; i < starList.length; i ++ ) {
    starList[i] = new Star(color(i*30 % width, 255, 255, 255), i*30 + 10, 100, random(1, 2), random(1, 2));
  }
}

void draw() {

  // Title Screen
  if (mode == 1) {
    background(loadImage("final-bg.png"));
    // This is where all the title screen stuff happens
    textSize(20);
    text("Digital Art Gallery", width/2-100, height/2-30);
    text("hit ↓ to read a boring about", width/2-145, height/2-0);
  }
  // About page
  else if (mode == 2) {
    background(loadImage("final-bg.png"));
    fill(255, 255, 255);
    textSize(15);
    text("I like to draw. It’s been a hobby of mine since I was a kid.", width/50, height/2-225);
    text("I remember starting off tracing pictures of Squidward and neopets.", width/50, height/2-200);
    text("In middle school a friend introduced me to anime. Now I’m not", width/50, height/2-175);
    text("into that stuff anymore but it definitely influenced my artstyle a lot.", width/50, height/2-150);
    text("Eventually I moved onto drawing all digitally. I was met with both praise and criticism", width/50, height/2-100);
    text("but I remember the one thing that used to make me most self conscious was the fact that", width/50, height/2-75);
    text("people would often say “oh it’s anime.” Not even western cartoony styles were met with", width/50, height/2-50);
    text("the same snarky tone.", width/50, height/2-25);
    text("So I wanted to show that yes, styles that happen to look like anime can be beautiful too.", width/50, height/2+25);
    text("And that there are benefits to digital art,", width/50, height/2+50);
    text("things that you can do better using digital art as opposed to traditional art.", width/50, height/2+75);
    text("The world is changing and people could stand to have a more open mind.", width/50, height/2+125);
    textSize(20);
    text("hit → to enter", width/50, height/2+175);
    text("hit ← to return to title at any time", width/50, height/2+200);


    // This is where all the about page stuff like the
    // text or even an image of the creator
  }
  // GALLERY VIDEO
  else if (mode == 3) {
    background(29, 35, 47);
    image(video, 0, 0);
    
    //PIECE 1
  } else if (mode == 4) {
  background(loadImage("p1bg.png"));
    
    //PIECE 2
  } else if (mode == 5) {
    background(loadImage("p2Bg.png"));
    
    //PIECE 3
  } else if (mode == 6) {
    background(29, 35, 47);
    image(img, 0, 0);
    circleX = circleX + 1;


    if (circleX >= width) {
      circleX = 0;
    }

    for (int i = 0; i < starList.length-1; i ++ ) {
      starList[i].move(); 
      starList[i].display();
      starList[i].bounce();

      //lights
      fill(251, 248, 212);
      ellipse(10, circleX, 10, 10);
      ellipse(50, circleX+20, 10, 10);
      ellipse(80, circleX, 5, 5);
      ellipse(110, circleX+100, 5, 5);
      ellipse(140, circleX+150, 10, 10);
      ellipse(180, circleX-200, 10, 10);
      ellipse(200, circleX-150, 5, 5);
      ellipse(240, circleX-50, 5, 5);
      ellipse(240, circleX, 10, 10);
      ellipse(300, circleX+20, 5, 5);
      ellipse(440, circleX, 10, 10);
      ellipse(440, circleX, 10, 10);
      ellipse(550, circleX+100, 10, 10);
      ellipse(530, circleX-250, 10, 10);
      ellipse(530, circleX-200, 5, 5);
      ellipse(580, circleX-300, 5, 5);
      ellipse(300, circleX-400, 5, 5);
      ellipse(140, circleX-350, 5, 5);
      ellipse(400, circleX-300, 5, 5);
      ellipse(550, circleX, 5, 5);
    }
  }
}

void movieEvent(Movie video) {
  video.read();
} 



void mousePressed() {
  if (mouseX > 10 && mouseX < width &&
    mouseY > 10 && mouseY < height) {

    buttonClicked = !buttonClicked;
  }
}

void keyPressed() {
  if (keyCode == LEFT) {
    mode = 1;
  } else if (keyCode == DOWN) {
    mode = 2;
  } else if (keyCode == RIGHT || keyCode == ' ') {
    background(29, 35, 47);
    video.play();
    video.jump(0.0);
    mode = 3;
  } else if (key == '1') {
    mode = 4;
  } else if (key == '2') {
    mode = 5;
  } else if (key == '3') {
    mode = 6;
  }
}
