class boxes{
  int x;
  int y;
  int side;
  
  boxes(int nX, int nY, int nSide){
    x = nX;
    y = nY;
    side = nSide;
  }
  
  void display(){
    noStroke();
    fill(255);
    rect(x, y, side, side);
  }
}
