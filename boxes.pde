class boxes{
  int x;
  int y;
  int side;
  char c;
  
  boxes(int nX, int nY, int nSide){
    x = nX;
    y = nY;
    side = nSide;
  }
  
  boxes(int nX, int nY, int nSide, char nC){
    x = nX;
    y = nY;
    side = nSide;
    c = nC;
  }
  
  void squares(){
    fill(255);
    rect(x, y, side, side);
  }
  
  void display(){
    noStroke();
    fill(255);
    rect(x, y, side, side);
    fill(0);
    textSize(side);
    textAlign(BASELINE);
    text(c, x, y + side);
  }
}
