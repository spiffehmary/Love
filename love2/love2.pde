/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/8297*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
 
 
//serial
 import processing.serial.*;
  // The serial port
 Serial port;       
 // To store data from serial port, used to color background
 int val = 0; 
 
 //Images
String[] filenames = {
"love1.jpg",
"love2.jpg",
"love3.jpg",
"love4.jpg",
"love5.jpg", 
"love6.jpg", 
"love7.jpg", 
"love8.jpg", 
"love9.jpg", 
"love10.jpg", 
"love11.jpg", 
"love12.jpg", 
"love13.jpg", 
"love14.jpg", 
"love15.jpg", 
"love16.jpg", 
"love17.jpg", 
"love18.jpg", 
"love19.jpg", 
"love20.jpg", 
"love21.jpg",
"love22.jpg", 
"love23.jpg", 
"love24.jpg", 
"love25.jpg",  
"love27.jpg",  
"love29.jpg", 
"love30.jpg", 
"love31.jpg", 
"love32.jpg", 
"love33.jpg", 
"love34.jpg", 
"love35.jpg", 
"love36.jpg", 
"love37.jpg", 
"love38.jpg", 
"love39.jpg", 
"love40.jpg", 
"love41.jpg", 
"love42.jpg", 
"love43.jpg", 
"love44.jpg", 
"love45.jpg", 
"love46.jpg", 
"love47.jpg", 
"love48.jpg"}; // fotos im data ordner
PImage[] images = new PImage[filenames.length];
int imageIndex = 0;
 
//Timer
//cumulative time passed
int savedTimeImage;
int savedTimeLocation;
//duration of timer
int totalTimeImage;
int totalTimeLocation;

//image size/location randomizer
int xAxis;
  int yAxis;
  int w;
  int h;

//Fullscreen
boolean sketchFullScreen() {
  return true;
}
 
  
void setup() {
   size(2000, 1000);//angegebene größe aus unterricht
  //background (0);
   
   // List all the available serial ports
 println(Serial.list());
 // I know that the first port in the serial list on my mac
 // is always my  Arduino, so I open Serial.list()[0].
 // Open whatever port is the one you're using.
 port = new Serial(this, Serial.list()[1], 9600);
 // don't generate a serialEvent() unless you get a newline character:
 port.bufferUntil('\n');
 // set inital background:
  
   //Timer
  savedTimeImage = millis();
  savedTimeLocation = millis();
    
  for(int i = 0; i<filenames.length; i++) {
    images[i] = loadImage(filenames[i]);    
  } 
 
 
}
 
 
 void draw () {
 background(255);
//  println(val);
 
    
  //timer
  int totalTimeLocation = val * 100;
  int passedTimeLocation = millis() - savedTimeLocation;
  int totalTimeImage = val * 500;
  int passedTimeImage = millis() - savedTimeImage;
  println(val);
  
  image(images[imageIndex],xAxis,yAxis,w,h); // größe passend machen
   
   
  if (passedTimeLocation > totalTimeLocation) {
  xAxis = int(random(750));
  yAxis = int(random(375));
  w = int(random(50,750));
  h = int(random(25,375));
  savedTimeLocation = millis();
  }
  
  if (passedTimeImage > totalTimeImage) {
  imageIndex++;
  savedTimeImage = millis();
  }
   
  if (imageIndex>filenames.length-1)
  imageIndex = 0;
 }
 
void mousePressed() {
   
if(imageIndex<filenames.length-1)
{ xAxis = int(random(750));
  yAxis = int(random(375));
  w = int(random(50,750));
  h = int(random(25,375));
}
else imageIndex = 0; 
     
}
 
 
 // Called whenever there is something available to read
void serialEvent(Serial port) {
  // Data from the Serial port is read in serialEvent() using the read() function and assigned to the global variable: val
  val = port.read();
  // For debugging
  println( "Raw Input:" + val);
}

/*Source: http://www.openprocessing.org/sketch/8297*/

