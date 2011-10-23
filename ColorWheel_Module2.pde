/**
 * Subtractive Color Wheel 
 * by Ira Greenberg. 
 * 
 * The primaries are red, yellow, and blue. The secondaries are green, 
 * purple, and orange. The tertiaries are  yellow-orange, red-orange, 
 * red-purple, blue-purple, blue-green, and yellow-green.
 * 
 * Create a shade or tint of the subtractive color wheel using
 * SHADE or TINT parameters.
 *
 * Updated 26 February 2010.
 */

import processing.net.*;


int segs = 18;
int steps = 2;
float rotAdjust = TWO_PI / segs / 2;
float radius;
float segWidth;
float interval = TWO_PI / segs;


Client c;
 String data;
 String host = "www.pachube.com";
 String URL = "/feeds/35134/datastreams/0/archive.csv";
 String key = "_ftH7qy0PMIVDS1Up_PUD59b8hcR6zQ3cSS-OtZGplI";

void setup() {
  size(600, 600);
  background(127);
  smooth();
  ellipseMode(RADIUS);
  noStroke();
  text("0", 255, 245);
  // make the diameter 90% of the sketch area
  radius = min(width, height) * 0.45;
  segWidth = radius / steps;
  
  // swap which line is commented out to draw the other version
  //drawTintWheel();
 size(600, 600);
 int pageNum = 1;
 String lastDate = "2011-10-09T00:01:46Z";
 String date = "2011-10-09T06:01:46Z";
 String getURL = String.format( "GET %s?key=%s&start=%s&end=%s&interval=0s&page=%d HTTP/1.1\n", URL,key,lastDate,date,pageNum ) ; //?start=2011-08-14T00:00:00&end=2011-08-29T00:00:00&interval=0s&page=100";
 println( getURL );
 

 
 

 c = new Client(this, host, 80); // Connect to server on port 80
 c.write(getURL); // Use the HTTP "GET" command to ask for a Web page
 c.write("Host: pachube.com\n\n");
  
  drawShadeWheel();
    fill(0);
    textSize(15);
  text("6", 295, 10, 500, 250);
  text("7", 395, 24, 500, 250);
  text("8", 480, 70, 500, 250);
  text("9", 540, 145, 500, 250);
  text("10", 575, 239, 500, 250);
  text("11", 575, 340, 500, 250);
  text("12", 540, 435, 500, 250);
  text("13", 475, 513, 500, 250);
  text("14", 386, 560, 500, 250);
  text("15", 292, 575, 500, 250);
  text("16", 195, 560, 500, 250);
  text("17", 110, 513, 500, 250);
  text("18", 40, 435, 500, 250);
  text("19", 9, 340, 500, 250);
  text("20", 9, 239, 500, 250);
  text("21", 40, 145, 500, 250);
  text("22", 110, 70, 500, 250);
  text("23", 195, 24, 500, 250);
  textSize(9);
  text("4:18:48", 170, 550, 500, 250);
  text("4:25:13", 150, 543, 500, 250);
  text("4:37:12", 120, 529, 500, 250);
  fill(999);
}


void drawShadeWheel() {
  if (c.available() > 0) { // If there's incoming data from the client...
 data = c.readString(); // ...then grab it and print it
  println(data);
  }
  for (int j = 0; j < steps; j++) {
    color[] cols = { 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225),
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
      color(255-(255/steps)*j, 255-(255/steps)*j, 225),
      color(255-(255/steps)*j, 255-(255/steps)*j, 225), 
    };
    for (int i = 0; i < segs; i++) {
      fill(cols[i]);
      arc(width/2, height/2, radius, radius, 
          interval*i+rotAdjust, interval*(i+1)+rotAdjust);
    }
    radius -= segWidth;
  }
  
}


void drawTintWheel() {
  for (int j = 0; j < steps; j++) {
    color[] cols = { 
      color((255/steps)*j, (255/steps)*j, 0), 
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0), 
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
      color((255/steps)*j, (255/steps)*j, 0),
    };
  
    for (int i = 0; i < segs; i++) {
      fill(cols[i]);
      arc(width/2, height/2, radius, radius, 
          interval*i+rotAdjust, interval*(i+1)+rotAdjust);
    }
    radius -= segWidth;
  }
  

}
