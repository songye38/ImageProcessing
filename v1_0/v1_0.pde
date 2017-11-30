//------------- using controlP5------------------//
import controlP5.*;
ControlP5 cp5;
Accordion accordion;


//--------------------- value for gui return values----------------//

String colorHexValue;
int lineWeight;
boolean lineColorSelectStatus = false;




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
  drawGUI();
   points = new Point[max+n][2];
   lines = new Line[max+n];
  
  stroke(0);
  if (mousePressed == true) {
     points[n][0] = new Point(mouseX,mouseY);
     points[n][1] = new Point(pmouseX,pmouseY);
     lines[n] = new Line(points[n][0],points[n][1]);
     lines[n].setLineColor(hexToRgb(colorHexValue));
     lines[n].setLineThickness(lineWeight);
     lines[n++].draw();
  }
  lineColorSelectStatus = false;
}

color hexToRgb(String hexValue)
{
  String subString = hexValue.substring(3,9);
  println(subString);
  color rgb = color(
            Integer.valueOf( subString.substring( 0, 2 ),16),
            Integer.valueOf( subString.substring( 2, 4 ),16),
            Integer.valueOf( subString.substring( 4, 6 ),16) );
  println(rgb);
  return rgb;
}

//여러개의 선 객체를 만들기 어떻게?