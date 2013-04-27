class Content{
 String path;
 float startLoop;
 float x,y,width,height,origWidth,origHeight;
 float ratio;
 PApplet stage;
 String type;
  
  Content(PApplet stage, String path)
  {
    this.ratio = 1;
    this.stage = stage;
    this.path = path;
  }
  void draw()
  {
    
  }
  
  void setScale(float value)
  {
    ratio = value;
    this.width = origWidth*ratio;
    this.height = origHeight*ratio;
  }
}
