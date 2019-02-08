private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
private double angle = 3*Math.PI/2;
private int startLength = 100;

public void setup(){   
	size(640,720);    
	noLoop(); 
} 

public void draw() 
{   
	background(0);   
	stroke(0,255,0);   
	line(320,720,320,620);   
	drawBranches(320,620,startLength,angle);  //will add later 
} 

public void drawBranches(int x,int y, double branchLength, double angle){   
	double angle1 = angle + branchAngle;
	double angle2 = angle - branchAngle;
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	branchLength = branchLength * fractionLength;
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if(branchLength>smallestBranch){
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 

public void keyPressed(){
	if(key=='w'){
		startLength++;
		redraw();
	}else if(key=='s'){
		startLength--;
		redraw();
	}else if(key=='d'){
		branchAngle += 0.0174533;
		redraw();
	}else if(key=='a'){
		branchAngle -= 0.0174533;
		redraw();
	}
	redraw();
}