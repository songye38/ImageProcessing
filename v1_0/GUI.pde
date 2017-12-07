
ColorWheel cw;
Slider s;
Toggle t;
Button pngBtn;
Slider e;
Toggle et;



void setupGUI()
{
    cp5 = new ControlP5(this);
  
  // group number 1, contains 2 bangs
  Group g1 = cp5.addGroup("myGroup1")

                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(180)
                ;
                
  cw = cp5.addColorWheel("c",15,10,150).setRGB(color(0,0,0))
          .moveTo(g1);
  
     
  // group number 2, contains a radiobutton


  Group g2 = cp5.addGroup("myGroup2")

                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
   s = cp5.addSlider("weight")
          .setPosition(15,10)
          .setRange(1,100)
          .setValue(20)
          .moveTo(g2);
  

  // group number 3, contains a bang and a slider
  Group g3 = cp5.addGroup("save")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;

  pngBtn = cp5.addButton("exportPng")
              .setPosition(10,10)
              .setSize(40,40)
              .moveTo(g3)
              //.setBackgroundColor(color(255,255,255))
              ;
   Group g4 = cp5.addGroup("eraser")
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(150)
                ;
   et = cp5.addToggle("eraser")
           .setPosition(10,10)
           .setSize(40,40)
           .setValue(false)
           .moveTo(g4)
           ;
    e = cp5.addSlider("eraserSize")
           .setPosition(10,70)
           .setRange(10,100)
           .setValue(10)
           .moveTo(g4)
           ;

  // create a new accordion
  // add g1, g2, and g3 to the accordion.
  accordion = cp5.addAccordion("acc")
                 .setPosition(5,5)
                 .setWidth(180)
                 .addItem(g1)
                 .addItem(g2)
                 .addItem(g3)
                 .addItem(g4)
                 ;
  
  accordion.open(0,1,2,3);
  
  accordion.setCollapseMode(Accordion.MULTI);
}


void drawGUI()
{
  
}

void controlEvent(ControlEvent theControlEvent) {
  if(theControlEvent.isFrom("c")){
    lineColorSelectStatus = true;

    int rgbInt = cp5.get(ColorWheel.class,"c").getRGB();
    String hexValue = String.format("#%06x",rgbInt);
    colorHexValue = hexValue;
  }
  if(theControlEvent.isFrom("weight")){
    int a =(int)theControlEvent.getController().getValue();
    lineWeight = a;
  }
  if(theControlEvent.isFrom("exportPng")){
    saveOneFrame = true;
  }
  if(theControlEvent.isFrom("eraser")){
    doEraser = true;
  }
  if(theControlEvent.isFrom("eraserSize")){
    int a =(int)theControlEvent.getController().getValue();
    eraserWeight = a;
  }
  
}