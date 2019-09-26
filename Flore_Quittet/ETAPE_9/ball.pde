class ball
{
  // position de départ x,y
  float xoff=0.0; 
  float yoff=10.0;

  // position des balles x,y
  float xpos; 
  float ypos;

  float r = 45;


  ball(float xpos, float ypos)
  {
    this.xpos=xpos; //data de notre classe / montre qqch
    this.ypos=ypos;
    this.xoff = random(9999);
    this.yoff = random(9999);
  }

  void update (int SpeedBall)
  {
    xoff = xoff + .01;
    yoff= yoff+.01;

    xpos = xpos + map(noise(xoff), 0, 1, -5-SpeedBall, 5+SpeedBall);
    ypos = ypos + map(noise(yoff), 0, 1, -5-SpeedBall, 5+SpeedBall);
  }

  void display (int SizeBall)
  {
    image(Aubergine,xpos, ypos,  r + SizeBall, r + SizeBall);
  }

  void wrap ()
  {
    if (xpos > width+r*0.5)
    {
      xpos=0-r*0.5;
    }

    if (xpos<0-r*0.5) 
    {
      xpos=width+r*0.5;
    }

    if (ypos > height+r*0.5)
    {
      ypos=0-r*0.5;
    }

    if (ypos < 0-r*0.5)
    {
      ypos=height+r*0.5;
    }
  }
}
