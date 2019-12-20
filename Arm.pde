class Arm
{
 PVector m_Position;
 float m_Length;
 float m_InitialAngle;
 float m_FinalAngle;
 int m_CycleLength;
 int m_CycleStart;
 float m_Angle;
 
 Arm(PVector pos, float armLength, float initialAngle, float finalAngle, int cycleLength)
 {
  m_Position = pos.copy();
  m_Length = armLength;
  m_InitialAngle = initialAngle;
  m_FinalAngle = finalAngle;
  m_CycleLength = cycleLength;
  m_CycleStart = 0;
  m_Angle = m_InitialAngle;
 }
 
 void Update()
 {
   if (m_CycleStart == 0)
   {
     m_CycleStart = frameCount;
   }
   
   int halfCycle = (m_CycleLength/2);
   int cycleEnd = m_CycleStart + m_CycleLength;
   int cycleMid = m_CycleStart + halfCycle;
   
   if (frameCount >= cycleEnd)
   {
     m_CycleStart = frameCount; 
   }
   
   if (frameCount > cycleMid)
   {
     m_Angle = lerp(m_FinalAngle, m_InitialAngle, ((float)(frameCount - cycleMid))/halfCycle);  
   }
   else
   {
     m_Angle = lerp(m_InitialAngle, m_FinalAngle, ((float)(frameCount - m_CycleStart))/halfCycle);
   }   
 }
 
 void DisplayArm()
 {
   pushMatrix();
   translate(m_Position.x, m_Position.y);
   rotate(m_Angle);
   line(0, 0, m_Length, 0);
   popMatrix();
 }
 
 void TraceEndPoint()
 {
   PVector endPoint = GetEndPoint();
   point(endPoint.x, endPoint.y); 
 }
 
 PVector GetEndPoint()
 {
   PVector armDir = GetArmDir();
   PVector endPoint = PVector.add(m_Position, PVector.mult(armDir, m_Length));
   return endPoint;
 }
 
 PVector GetArmDir()
 {
   return PVector.fromAngle(m_Angle);
 }
}
