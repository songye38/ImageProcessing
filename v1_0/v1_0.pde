//------------- using controlP5------------------//
import controlP5.*;
ControlP5 cp5;
Accordion accordion;

//-------------- import for pdf export -----------------//
import processing.pdf.*;
import java.util.Calendar;

//--------------------- value for gui return values----------------//

String colorHexValue;
int lineWeight;
boolean lineColorSelectStatus = false;
boolean savePDF = false;
boolean doEraser =false;
int eraserWeight;

int widthOfToolPanel;
int HeightOfToolPanel;

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
  if(savePDF)
  {
    exportToPdf();
    println("begin");
  }
  drawGUI();
   points = new Point[max+n][2];
   lines = new Line[max+n];
  
  stroke(0);
  if (mousePressed == true&& doEraser==false) {
     points[n][0] = new Point(mouseX,mouseY);
     points[n][1] = new Point(pmouseX,pmouseY);
     lines[n] = new Line(points[n][0],points[n][1]);
     lines[n].setLineColor(hexToRgb(colorHexValue));
     lines[n].setLineThickness(lineWeight);
     lines[n++].draw();
  }
  if(doEraser)
  {
     points = new Point[max+n][2];
     lines = new Line[max+n];
     points[n][0] = new Point(mouseX,mouseY);
     points[n][1] = new Point(pmouseX,pmouseY);
     lines[n] = new Line(points[n][0],points[n][1]);
     lines[n].setLineColor(color(255,255,0));
     lines[n].setLineThickness(eraserWeight);
     lines[n++].draw();
  }
  if(savePDF)
  {
    savePDF = false;
    endRecord();
    println("end of pdf file");
  }
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

void exportToPdf()
{
   beginRecord(PDF,timestamp()+".pdf");
}
//여러개의 선 객체를 만들기 어떻게?
String timestamp()
{
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}