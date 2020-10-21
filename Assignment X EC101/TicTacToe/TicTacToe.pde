int boxsize = 100;
int cols = 3, rows = 3;
int[][] state;
int[][] clicker;
int gamestate = 0;
int current_player = 1;
int win = 0;
int move = 0;
PImage x,o; 
PFont f;
PImage back;
void setup() {
  size(300, 500);
  cols = 3;
  rows = 3;
  int current_player = 1; 
  state = new int[cols][rows]; 
  for (int i=0; i<cols; i++) 
  {
    for (int j=0; j<rows; j++) 
    {
      state[i][j] = 0;
    }
  }
  clicker = new int[cols][rows]; 
  for (int i=0; i<cols; i++) 
  {
    for (int j=0; j<rows; j++) 
    {
      clicker[i][j] = 0;
    }
  }
  x = loadImage("x.jpg");
  o = loadImage("0.jpg");
  f = createFont("Comic Sans MS",48,true);
  textFont(f);
  textAlign(CENTER);
  textSize(40);
  back = loadImage("ticback.jpg");
}

 
void draw() 
{
  background(255);
  image(back,0,300,300,200);
  fill(0);
  checkGame();
  if (win != 0)
  {
    text("END",150,400);
    if (win == 1)
    {
      text("Player 1 Wins",150,460);
    }
    else if (win == 2)
    {
      text("Player 2 Wins",150,450);
    }
    else if (win == 3)
    {
      text("Draw",150,450);
    }
  }
  
  
  if (current_player == 1 && win == 0)
    {
     
     text("Player 1 turn",150,400);
    }
   else if (current_player == 2 && win == 0)
    {
       text("Player 2 turn",150,400);
    }
  for (int i=0; i<cols; i++) 
  {
    for (int j=0; j<rows; j++) 
    {
      if(state[i][j]==1 && clicker[i][j]==1)
      {
        //fill(123);
        rect(i*boxsize, j*boxsize, boxsize, boxsize);
        image(x,i*boxsize, j*boxsize);
      }
      else if(state[i][j]==1 && clicker[i][j]==2)
      {
        //fill(0);
        rect(i*boxsize, j*boxsize, boxsize, boxsize);
        image(o,i*boxsize, j*boxsize);
      }
      else if(state[i][j]==0)
      {
        fill(255);
        rect(i*boxsize, j*boxsize, boxsize, boxsize);
      }
    }
    
  }
  
  }
  
  
  

 
void mousePressed() 
{
      if (win == 0){
       for (int i=0; i<cols; i++) 
       {
         for (int j=0; j<rows; j++) 
         {
          int x = i*boxsize;
          int y = j*boxsize;
          if (mouseX > x && mouseX < (x + boxsize) && mouseY > y && mouseY < (y + boxsize) && state[i][j]==0)
          {
            state[i][j]=1; 
            clicker[i][j] = current_player;
            if (current_player == 1)
            {
              current_player = 2;
            }
            else 
            {
              current_player = 1;
            }
          }
         }
       }
      }
      if (move<9)
      {
        move = move + 1;
      }
      
} //<>//

void checkGame()
{
  int row = 0;
  //check vertical & horizontal
  for (int col = 0; col< cols; col++) {
    if (clicker[col][row] == 1 && clicker[col][row+1] == 1 && clicker[col][row+2] == 1) 
    {
      win = 1;
    } 
    else if (clicker[row][col] == 1 && clicker[row+1][col] == 1 && clicker[row+2][col]== 1) 
    {
      win = 1;
    } 
    else if (clicker[row][col] == 2 && clicker[row+1][col] == 2 && clicker[row+2][col]== 2) 
    {     
      win = 2;
    }
    else if (clicker[col][row] == 2 && clicker[col][row+1] == 2 && clicker[col][row+2] == 2) 
    {      
      win = 2;
    }
  }


 //check diagonals
  if (clicker[row][row] == 1 && clicker[row+1][row+1] == 1 && clicker[row+2][row+2] == 1) {
    win = 1;
  } 
  else if (clicker[row][row] == 2 && clicker[row+1][row+1] == 2 && clicker[row+2][row+2] == 2) {
    win = 2;
  } 
  else if (clicker[0][row+2] == 1 && clicker[1][row+1] == 1 && clicker[2][row] == 1) {
    win = 1;
  } 
  else if (clicker[0][row+2]== 2 && clicker[1][row+1] == 2 && clicker[2][row] == 2) {
    win = 2;
  }
  //draw condition
  if (move == 9)
  {
    win =3;
  }
  
}
