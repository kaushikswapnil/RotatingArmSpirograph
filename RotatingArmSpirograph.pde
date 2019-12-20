ArrayList<Arm> g_Arms;

void setup()
{
  size(800, 800);
  
  g_Arms = new ArrayList<Arm>();
  int numArms = (int)random(3, 5);
  
  g_Arms.add(new Arm(new PVector(width/2, height/2), random(50.0f, 80.0f), random(-PI, 0), random(0, PI), 100));
  for(int iter = 1; iter < numArms; ++iter)
  {
   g_Arms.add(new Arm(g_Arms.get(iter-1).GetEndPoint(), random(20.0f, 120.0f), random(-PI, 0), random(0, PI), 100 + (iter*100))); 
  }
  
  background(0);
}

void draw()
{
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
     //arm.DisplayArm(); 
     //arm.TraceEndPoint();
  }
  
  //g_Arms.get(g_Arms.size() - 1).TraceEndPoint();
  g_Arms.get(g_Arms.size() - 1).DisplayArm();
}
