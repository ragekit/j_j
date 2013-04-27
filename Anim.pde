class Anim extends Content
{
  Movie anim;
  Boolean looping;
  Anim(PApplet stage, String path)
  {
    super(stage,path);
    type = "video";
    anim = new Movie(stage,this.path);
    anim.loop();
  }
  
  @Override
  void draw()
  {
    image(anim,this.x,this.y,this.width,this.height);
  }
}
