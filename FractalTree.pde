private double fractionLength = 0.8;  
private int smallestBranch = 5;  
private double branchAngle = 0.3;  

public void setup() {
  size(1000, 600);  
  noLoop();  
}

public void draw() {
  background(0);  
  stroke(255);
  strokeWeight(2);
 

  int startX = width / 2;
  int startY = height - 20;  
 
  line(startX, startY, startX, startY - 100);
 
  drawBranches(startX, startY - 100, 100, 3 * Math.PI / 2);
}

// Recursive function to draw branches
public void drawBranches(int x, int y, double branchLength, double angle) {
  if (branchLength < smallestBranch) {
    return;
  }
 
  double angle1 = angle + branchAngle;  
  double angle2 = angle - branchAngle;
 
  int endX1 = (int)(branchLength * Math.cos(angle1) + x);
  int endY1 = (int)(branchLength * Math.sin(angle1) + y);
 
  int endX2 = (int)(branchLength * Math.cos(angle2) + x);
  int endY2 = (int)(branchLength * Math.sin(angle2) + y);
 
  // Draw the two branches
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
 
  drawBranches(endX1, endY1, branchLength * fractionLength, angle1);
  drawBranches(endX2, endY2, branchLength * fractionLength, angle2);
}
