/* 그림의 가장 기본이 되는 점
*  선을 만들기 위해 필요한 것 
*  딱히 면적이나 두께 색상 같은 것은 없다 
*/

class Point
{
  int x;
  int y;
  
  Point()
  {
    
  }
  Point(int a, int b)
  {
    x = a;
    y = b;
  }
  int getX()
  {
    return x;
  }
  int getY()
  {
    return y;
  }
  void setX(int a)
  {
    x = a;
  }
  void setY(int b)
  {
    y = b;
  }
}