class Scene
{ 
  int id;
  ArrayList<Content> contents;
  Content contentClicked;
  PVector clicked;
  Scene(int id)
  {
    clicked = new PVector();
    this.id = id;
    contents = new ArrayList<Content>();
  }
  
  void drawScene()
  {
    for(Content c : contents)
    {
      c.draw();
    }
  }
  
  void addContent(Content c)
  {
    contents.add(c);
  }
  
  void mousePressed()
  {
    for(Content c : contents)
    {
      if(mouseX > c.x && mouseX < c.x + c.width)
      {
        if(mouseY > c.y && mouseY < c.y + c.height)
        {
          contentClicked = c;
          break;
        }
      }
    }
  }

  void mouseDragged()
  {
    if(contentClicked != null)
    {
      if (keyPressed && key == 'r') 
      {
         contentClicked.ratio += (mouseX - pmouseX)/100f;
         contentClicked.width = contentClicked.origWidth * contentClicked.ratio;
         contentClicked.height = contentClicked.origHeight * contentClicked.ratio;
      }else
      {
         contentClicked.x += (mouseX - pmouseX);
         contentClicked.y += (mouseY - pmouseY);
      }
      
      
    }
    
  }
  
}
