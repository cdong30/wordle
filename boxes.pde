class boxes{
  int x;
  int y;
  int side;
  char c;
  color co;
  
  boxes(int nX, int nY, int nSide){
    x = nX;
    y = nY;
    side = nSide;
  }
  
  boxes(int nX, int nY, int nSide, char nC, color nCo){
    x = nX;
    y = nY;
    side = nSide;
    c = nC;
    co = nCo;
  }
  
  void squares(){
    fill(255);
    rect(x, y, side, side);
  }
  
  void display(){
    noStroke();
    fill(co);
    rect(x, y, side, side);
    fill(0);
    textSize(side);
    textAlign(BASELINE);
    text(c, x, y + side);
  }
}
