//------------- using controlP5------------------//
import controlP5.*;
ControlP5 cp5;
Accordion accordion;

//-------------- import for pdf export -----------------//
import processing.pdf.*;
import java.util.Calendar;

//------------------------------ value for gui return values----------------//

String colorHexValue = "";
int lineWeight = 0;
boolean lineColorSelectStatus = false;
boolean saveOneFrame = false;
boolean doEraser =false;
int eraserWeight =0;

//int widthOfToolPanel;
//int HeightOfToolPanel;


//-------------------- global variable--------------------//
int n=0;
int max = 1;
Point[][] points;
Line[] lines;


void setup() {
  size(1200, 1200);
  background(255);
  setupGUI();
}

void draw() {
  if(saveOneFrame)
  {
    saveFrame(timestamp()+".png");
    saveOneFrame = false;
  }
     drawGUI();
     points = new Point[max+n][2];
     lines = new Line[max+n];
  
  //stroke(0);
  if (mousePressed == true) {
     points[n][0] = new Point(mouseX,mouseY);
     points[n][1] = new Point(pmouseX,pmouseY);
     lines[n] = new Line(points[n][0],points[n][1]);
     lines[n].setLineColor(hexToRgb(colorHexValue));
     if(doEraser) lines[n].setLineColor(color(255));
     lines[n].setLineThickness(lineWeight);
     lines[n++].draw();
  }
  //if(doEraser)
  //{
  //   points = new Point[max+n][2];
  //   lines = new Line[max+n];
  //   points[n][0] = new Point(mouseX,mouseY);
  //   points[n][1] = new Point(pmouseX,pmouseY);
  //   lines[n] = new Line(points[n][0],points[n][1]);
  //   lines[n].setLineColor(color(255,255,0));
  //   lines[n].setLineThickness(eraserWeight);
  //   lines[n++].draw();
  //}
  lineColorSelectStatus = false;
  doEraser = false;
}

color hexToRgb(String hexValue)
{
  String subString = hexValue.substring(3,9);
  color rgb = color(
            Integer.valueOf( subString.substring( 0, 2 ),16),
            Integer.valueOf( subString.substring( 2, 4 ),16),
            Integer.valueOf( subString.substring( 4, 6 ),16));
  return rgb;
}

String timestamp()
{
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}