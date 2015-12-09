SpaceShip a = new SpaceShip();


Stars [] space = new Stars[300];

ArrayList<Asteroids> theList = new ArrayList<Asteroids>();


public void setup() 
{
  //your code here
  size(500,500);
 

  for(int i = 0; i < space.length; i++)
  {
    space[i] = new Stars();
  }
  
  for(int q=0; q < 5; q++)
  {
    theList.add(new Asteroids());
  }

}

public void draw() 
{
  background(0,0,0); 
  
  for(int i=0; i < space.length; i++)
  {
    space[i].show();
  }


  for(Asteroids rock : theList)
  { 
   rock.show();
   rock.move();
   rock.rotate((int)Math.random()*4);
  }


 // b.setDirectionX((int)(Math.random()*4-2));
 //  b.setDirectionY((int)(Math.random()*4-2));
  a.show();
  a.move();
 
 

}


class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      myCenterX = 250;
      myCenterY = 250;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      corners = 3;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
    }


    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)(myCenterX);}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)(myCenterY);}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX() {return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}

}

public void keyPressed()
    {
      if(key == 'w')
      {
        a.accelerate(2);
      }
      if(key == 'q')
      {
        a.rotate(-4);
      }
      if(key == 'e')
      {
        a.rotate(4);
      }
      if(key == 'h')
      {
       a.setX((int)(Math.random()*500));
       a.setY((int)(Math.random()*500));
       a.setDirectionX(0);
       a.setDirectionY(0);
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
    double dRadians = myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   

  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }  

  public void move ()   //move the floater in the current direction of travel
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

  public void show ()  //Draws the floater at the current position  
  {             
    fill(255,255,255); 
    strokeWeight(3);  
    stroke(255,0,0);    
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


class Stars
{
  private int myX,myY;
  
  public Stars()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  
  public void show()
  {
    fill(255,255,255);
    stroke(255,255,255);
    ellipse(myX,myY,0.5,0.5);
  }

}


class Asteroids extends Floater
{
  public void setX(int x){myCenterX = x;}//your code here
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
  private double ranS = (Math.random()*5-2);
  private int ranD = (int)(Math.random()*4); 
  Asteroids()
  { 
    myDirectionX = (Math.random()*5-2);
    myDirectionY = (Math.random()*5-2);
    myColor = 139;
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
    if(ranD==0)
    {
      myCenterX = 1;
      myCenterY = (int)(Math.random()*699+1);
    }
    else if(ranD==1)
    {
      myCenterX = (int)(Math.random()*699+1);
      myCenterY = 1;
    }
    else if(ranD==2)
    {
      myCenterX = 699;
      myCenterY = (int)(Math.random()*699+1);
    }
    else if(ranD==3)
    {
      myCenterX = (int)(Math.random()*699+1);
      myCenterY = 699;
    }
  }
  public void move ()
  {
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY; 
    myPointDirection+=ranS;  
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
