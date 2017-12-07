/* 그림의 기본이 되는 선
*  두개의 점을 이으면 선이 된다 
*
*/

class Line
{
  int x1,y1;
  int x2,y2;
  
  int lineThickness =0;
  
  color lineColor = 0;
  
  Point start;
  Point end;
  
  Line()
  {
    
  }
  Line(int a, int b, int c, int d)
  {
    x1 = a;
    y1 = b;
    x2 = c;
    y2 = d;
    start = new Point(a,b);
    end = new Point(c,d);
  }
  Line(Point a, Point b)
  {
    x1 = a.x;
    y1 = a.y;
    x2 = b.x;
    y2 = b.y;
  }
  void draw()
  { 
    stroke(lineColor);
    strokeWeight(lineThickness);
    line(x1,y1,x2,y2);
  }
  
  void setLineColor(color value)
  {
    lineColor = value;
  }
  void setLineThickness(int value)
  {
    lineThickness = value;
  }
  
}