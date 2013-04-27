import processing.video.*;
import proxml.*;

ArrayList<Scene> scenes;
Scene currentScene;

XMLInOut xml;
XMLElement xmlScenes;



void setup()
{
  size(1280, 800, P3D);
  background(0);
  scenes = new ArrayList<Scene>();
  currentScene = new Scene(-1);
  xml = new XMLInOut(this);
  xml.loadElement("data/prez.xml");
}


void draw()
{
  background(0);
  currentScene.drawScene();
 
}


void xmlEvent(XMLElement element) {
  xmlScenes = element;
  loadScenes();
}

void export()
{
  XMLElement root = new XMLElement("scenes");
  for (int i=0; i<scenes.size(); i++)
  { 
    XMLElement exportScene = new XMLElement("scene"); 

    for (int j=0;j<scenes.get(i).contents.size();j++)
    {
      Content c = scenes.get(i).contents.get(j);
      XMLElement exportContent = new XMLElement("content");
      exportContent.addAttribute("type", c.type);
      exportContent.addAttribute("scale", c.ratio);
      exportContent.addAttribute("xPos", c.x);
      exportContent.addAttribute("yPos", c.y);
      exportContent.addAttribute("oWidth", c.origWidth);
      exportContent.addAttribute("oHeight", c.origHeight);
      exportContent.addAttribute("path", c.path);

      exportScene.addChild(exportContent);
    }

    root.addChild(exportScene);
  }

  xml.saveElement(root, "prez.xml");
}

void loadScenes()
{
  for (int i=0; i< xmlScenes.countChildren();i++)
  {
    Scene scn = new Scene(i);
    for (int j=0; j< xmlScenes.getChild(i).countChildren();j++)
    {
      XMLElement el = xmlScenes.getChild(i).getChild(j);
      if ("image".equals(el.getAttribute("type")))
      {
        Static st = new Static(el.getAttribute("path"));
        scn.addContent(st);
        st.x = el.getFloatAttribute("xPos");
        st.y = el.getFloatAttribute("yPos");
        st.setScale(el.getFloatAttribute("scale"));
      }

      if ("video".equals(el.getAttribute("type")))
      {
        Anim an = new Anim(this, el.getAttribute("path"));
        scn.addContent(an);
        an.x = el.getFloatAttribute("xPos");
        an.y = el.getFloatAttribute("yPos");
        an.origWidth = el.getFloatAttribute("oWidth");
        an.origHeight = el.getFloatAttribute("oHeight");
        an.setScale(el.getFloatAttribute("scale"));
      }
    }
    scenes.add(scn);
  }
  currentScene = (Scene)scenes.get(0);
}

void saveScenes()
{
  //TODO;
}

void mousePressed()
{
  currentScene.mousePressed();
}

void mouseDragged()
{
  currentScene.mouseDragged();
}

void keyPressed(){
   if (key == 'a') 
  {
    export();
  }

  if (key == ' ')
  {
    if(currentScene.id + 1 < scenes.size())
    {
      currentScene = scenes.get(currentScene.id +1);
    }else
    {
      currentScene = scenes.get(0);
    }
   
  }
  if (key ==  ESC)
  {
    exit();
  }
 
}

void movieEvent(Movie m)
{
  m.read();
}

boolean sketchFullScreen() {
  return true;
}

