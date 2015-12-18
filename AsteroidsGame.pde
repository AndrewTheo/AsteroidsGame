public int nAsteroids = 20;
ArrayList <asteroid> AsteroidNum = new ArrayList <asteroid>();
SpaceShip Ship1 = new SpaceShip();
star [] nStar = new star[1000];
ArrayList <bullet> bullets = new ArrayList <bullet> ();
//PFont f;
boolean gameOver = false;


public void setup() 
{
  size(800, 800);
  background(0);
  
  for (int a = 0; a < nStar.length; a++)
  {
    nStar[a] = new star();
  }
  
  for(int i = 0; i < nAsteroids; i++)
  {
    AsteroidNum.add(new asteroid());
  }

}


public void draw() 
{
  fill(0, 0, 0);
  rect(0, 0, 800,800);
  noFill();
  stroke(255,255,255);
  strokeWeight(5);
  rect(1,1,799,799);
  
   for (int i = 0; i < nStar.length; i++)
  {
    nStar[i].show();
  }
  
  
  
  Ship1.show();
  Ship1.move();
  if(gameOver==false)
  {
     if(AsteroidNum.size()==0)
     {
        gameOver = true; 
     }
     
  }
  
 
  
  for(int a = 0; a < AsteroidNum.size(); a++) 
  {
    if(dist(AsteroidNum.get(a).getX(), AsteroidNum.get(a).getY(), Ship1.getX(), Ship1.getY()) < 30) 
    {
      fill(200,200,200);
      Ship1.setX(400);
      Ship1.setY(400);
      Ship1.setDirectionX(0);
      Ship1.setDirectionY(0);
    }
    for(int b = 0; b < bullets.size(); b++) 
    {
      if(dist(AsteroidNum.get(a).getX(), AsteroidNum.get(a).getY(), bullets.get(b).getX(), bullets.get(b).getY()) < 20) 
      {
        AsteroidNum.remove(a);
        bullets.remove(b);
        break;
      }
    }
  }
  for(int a = 0; a < AsteroidNum.size(); a++) 
  {
    AsteroidNum.get(a).show();
    AsteroidNum.get(a).move();
  }
  for(int b = 0; b < bullets.size(); b++) 
  {
    bullets.get(b).show();
    bullets.get(b).move();
  }
}
  
  
public void keyPressed()
  {
    if(keyCode == UP)
    {
      Ship1.accelerate(0.25);
    }
    if(keyCode == DOWN)
    {
      Ship1.accelerate(-0.25);
    }
    if(keyCode == RIGHT)
    {
      Ship1.rotate(10);
    }
    if(keyCode == LEFT)
    {
      Ship1.rotate(-10);
    }
    if(key == 'h')
    {
      Ship1.setX((int)(Math.random()*800));
      Ship1.setY((int)(Math.random()*800));
      Ship1.setDirectionX(0.0);
      Ship1.setDirectionY(0.0);
      Ship1.setPointDirection((int)(Math.random()*360));
    }
    else if(keyCode == 32) 
    {
    bullets.add(new bullet(Ship1));
    }
  }
class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      corners = 3;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners [0] = 20;
      yCorners [0] = 0;
      xCorners [1] = -10;
      yCorners [1] = 10;
      xCorners [2] = -10;
      yCorners [2] = -10;
      myColor = color(0, 0, 255);
      myCenterX = 400;
      myCenterY = 400;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
    }
      public void setX(int x){myCenterX = x;}  
      public int getX(){return (int)myCenterX;}   
      public void setY(int y){myCenterY = y;} 
      public int getY() {return((int)myCenterY);}  
      public void setDirectionX(double x) {myDirectionX = 0;}  
      public double getDirectionX() {return ((int)myDirectionX);}  
      public void setDirectionY(double y) {myDirectionY = 0;} 
      public double getDirectionY() {return (int)myDirectionY;}
      public void setPointDirection(int degrees) {myPointDirection = degrees;}  
      public double getPointDirection() {return (int)myPointDirection;}
      
      void move () 
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;
        
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;
            
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;  
        
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height; 
        
    }   
  }   
}

class asteroid extends Floater 
{
  private int rotSpeed;
  public asteroid() 
  {   
    rotSpeed = (int)(Math.random()*5)-5;
    //corners = 8;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -12;
    yCorners[0] = 24;
    xCorners[1] = 12;
    yCorners[1] = 24;
    xCorners[2] = 24;
    yCorners[2] = 0;
    xCorners[3] = 12;
    yCorners[3] = -24;
    xCorners[4] = -12;
    yCorners[4] = -24;
    xCorners[5] = -24;
    yCorners[5] = 0;

    myColor = color(255, 0, 0);   
    myCenterX = (int)(Math.random()*1000);
    myCenterY = (int)(Math.random()*600);
    myDirectionX = (int)(Math.random()*3)-1;
    myDirectionY = (int)(Math.random()*3)-1;
  }
    public void move()
    {
      fill(255,0,0);
      rotate(rotSpeed);
      super.move();
      
      if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width; 
    }
    if(myCenterY >height)
    {    
      myCenterY = 0;  
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height; 
    }
    }
    public void setX(int x){myCenterX = x;}    
    public void setY(int y){myCenterY = y;}
    public void setDirectionX(double x) {myDirectionX = x;}
    public void setDirectionY(double y){myDirectionY = y;} 
    public void setPointDirection(int degrees) {myPointDirection = degrees;}    

    public int getX() {return (int)myCenterX;}
    public int getY() {return (int)myCenterY;}
    public double getDirectionX() {return myDirectionX;}   
    public double getDirectionY() {return myDirectionY;}   
    public double getPointDirection() {return myPointDirection;} 
}

class bullet extends Floater
 {
    public bullet(SpaceShip nShip)
    {
      myCenterX = nShip.getX();
      myCenterY = nShip.getY();
      myPointDirection = nShip.getPointDirection();
      double dRadians = myPointDirection*(Math.PI/180);
      myDirectionX = 5*Math.cos(dRadians) + nShip.getDirectionX();
      myDirectionY = 5*Math.sin(dRadians) + nShip.getDirectionY();
    }
 
  public void setX(int x){myCenterX = x;}    
  public void setY(int y){myCenterY = y;}
  public void setDirectionX(double x) {myDirectionX = x;}
  public void setDirectionY(double y){myDirectionY = y;} 
  public void setPointDirection(int degrees) {myPointDirection = degrees;}    

  public int getX() {return (int)myCenterX;}
  public int getY() {return (int)myCenterY;}
  public double getDirectionX() {return myDirectionX;}   
  public double getDirectionY() {return myDirectionY;}   
  public double getPointDirection() {return myPointDirection;} 

  public void show()
  {
    fill(255,255,0);
    noStroke();
    ellipse((float)myCenterX,(float)myCenterY,5,5);
  }

  public void move()
  {
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
  }
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  
  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move () 
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;
    }    
         
  }   
  public void show ()   
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }  
} 

class star
{
  private int myX,myY;
  
  public star()
  {
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000);
  }
  
  public void show()
  {
    fill(255,255,255);
    stroke(255,255,255);
    ellipse(myX,myY,3,3);
  }

}

