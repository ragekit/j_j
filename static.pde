class Static extends Content
{
  PImage img;
  Static(String path)
  {
    super(null,path);
    type = "image";
    img = loadImage(path);
    this.origWidth = img.width;
    this.origHeight = img.height;
  }
  
  @Override
  void draw()
  {
    image(img,this.x,this.y,this.width,this.height);
  }
}
