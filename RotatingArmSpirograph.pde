ArrayList<Arm> g_Arms;

void setup()
{
  size(1000, 1000);
  
  CreateArms();
  
  background(0);
}

void draw()
{
  //background(0);
  rectMode(CENTER);
  fill(0, 0, 0, 1);
  rect(width/2, height/2, width+10, height+10);
  
  stroke(255, 255, 255);
  
  for (Arm arm : g_Arms)
  {
     arm.Update(); 
  }
  
  if (g_Arms.size() > 0)
  {
    for (int iter = 0; iter < g_Arms.size() - 1; ++iter)
    {
       g_Arms.get(iter+1).m_Position = g_Arms.get(iter).GetEndPoint(); 
    } 
  }
  
  for (Arm arm : g_Arms)
  {
     arm.DisplayArm(); 
     //arm.TraceEndPoint();
  }
  
  //g_Arms.get(g_Arms.size() - 1).TraceEndPoint();
  //g_Arms.get(g_Arms.size() - 1).DisplayArm();
}

void keyPressed()
{
 if(key == 'r' || key == 'R')
 {
  CreateArms(); 
 }
}

void CreateArms()
{
  g_Arms = new ArrayList<Arm>();
  int numArms = (int)random(3, 6);
  
  g_Arms.add(new Arm(new PVector(width/2, height/2), random(50.0f, 90.0f), random(-PI, 0), random(0, PI), 500));
  for(int iter = 1; iter < numArms; ++iter)
  {
   float sign = random(1.0) < 0.5f ? -1.0f : 1.0f;
   g_Arms.add(new Arm(g_Arms.get(iter-1).GetEndPoint(), random(40.0f, 140.0f), random(-PI, 0), random(0, PI), abs(500 + (int)(iter*100*sign))));
   //g_Arms.add(new Arm(g_Arms.get(iter-1).GetEndPoint(), random(20.0f, 120.0f), random(-PI, 0), random(0, PI), 100 + (iter * 100)));
  }
  
  background(0);
}
