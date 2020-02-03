float mainR = 200;
float innerR = mainR-100;
float outerR = mainR+100;
float mouseAngle, mouseDistance, centerX, centerY;
float[] widths = new float[]{1,2,3,4,5,6};
ArrayList<Float> segAngleWidths = new ArrayList<Float>();
float totalWidth = 0;
ArrayList<Segment> segments = new ArrayList<Segment>();

void setup()
{
  size(800, 600);
  centerX = width/2;
  centerY = height/2;
  for (int i = 0; i < widths.length; i++)
  {
    totalWidth += widths[i];
  }
  for (int i = 0; i < widths.length; i++)
  {
    segAngleWidths.add((widths[i]/totalWidth) * TWO_PI);
  }
  
  float angle = 0;
  
  for (int i = 0; i < segAngleWidths.size(); i++)
  {
    float sa = angle;    
    float ea = sa + segAngleWidths.get(i);
    segments.add(new Segment(sa, ea, mainR));
    angle += segAngleWidths.get(i);
  }
  
}

void draw()
{
  background(0);
  mouseAngle = atan((mouseY - centerY) / (mouseX - centerX));
  if (mouseX < centerX)
    mouseAngle += PI;
  else if (mouseY < centerY)
    mouseAngle += TWO_PI;

  mouseDistance = dist(mouseX, mouseY, centerX, centerY);

  for (Segment segment : segments)
  {
    if (mouseAngle > segment.sa && mouseAngle < segment.ea && mouseDistance < segment.r && mouseDistance > innerR)
    {
      segment.r = lerp(segment.r, outerR, 0.15);
    } else
    {
      segment.r = lerp(segment.r, mainR, 0.1);
    }
    segment.show();
  }

  fill(0);
  ellipse(centerX, centerY, innerR*2, innerR*2);
  fill(255);
}
