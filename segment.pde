class Segment
{
  PVector a = new PVector(0,0);
  PVector b = new PVector(0,0);
  float sa, ea;
  float r;
  Segment(float startAngle, float endAngle, float radius)
  {
    sa = startAngle;
    ea = endAngle;
    assignAB();
    r = radius;
  }
  void show()
  {
    arc(centerX, centerY, r*2, r*2, sa, ea);
    assignAB();
    line(centerX, centerY, a.x, a.y);
    line(centerX, centerY, b.x, b.y);
  }
  
  void assignAB()
  {
    a.x = centerX + r * cos(sa);
    a.y = centerY + r * sin(sa);
    b.x = centerX + r * cos(ea);
    b.y = centerY + r * sin(ea);
  }
}
