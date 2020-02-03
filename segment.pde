class Segment
{
  PVector a = new PVector(0,0);
  PVector b = new PVector(0,0);
  float start, end;
  float r;
  Segment(float startAngle, float endAngle, float radius)
  {
    start = startAngle;
    end = endAngle;
    assignAB();
    r = radius;
  }
  void show()
  {
    arc(centerX, centerY, r*2, r*2, start, end);
    assignAB();
    line(centerX, centerY, a.x, a.y);
    line(centerX, centerY, b.x, b.y);
  }
  
  void assignAB()
  {
    a.x = centerX + r * cos(start);
    a.y = centerY + r * sin(start);
    b.x = centerX + r * cos(end);
    b.y = centerY + r * sin(end);
  }
}
