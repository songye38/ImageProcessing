
ColorWheel cw;
Slider s;
Toggle t;
Button pdfBtn;
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
  //t = cp5.addToggle("save")
  //       .setPosition(15,10)
  //       .setSize(50,20)
  //       .setValue(false)
  //       .moveTo(g3)
  //       ;
  pdfBtn = cp5.addButton("exportPdf")
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
  

  //// group number 3, contains a bang and a slider
  //Group g3 = cp5.addGroup("myGroup3")
  //              .setBackgroundColor(color(0, 64))
  //              .setBackgroundHeight(150)
  //              ;
  
  //cp5.addBang("shuffle")
  //   .setPosition(10,20)
  //   .setSize(40,50)
  //   .moveTo(g3)
  //   ;
     
  //cp5.addSlider("hello")
  //   .setPosition(60,20)
  //   .setSize(100,20)
  //   .setRange(100,500)
  //   .setValue(100)
  //   .moveTo(g3)
  //   ;
     
  //cp5.addSlider("world")
  //   .setPosition(60,50)
  //   .setSize(100,20)
  //   .setRange(100,500)
  //   .setValue(200)
  //   .moveTo(g3)
  //   ;

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
  //  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2);}}, 'o');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2);}}, 'c');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setWidth(300);}}, '1');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setPosition(0,0);accordion.setItemHeight(190);}}, '2'); 
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.ALL);}}, '3');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.SINGLE);}}, '4');
  //cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.remove("myGroup1");}}, '0');
  
  accordion.open(0,1,2,3);
  
  accordion.setCollapseMode(Accordion.MULTI);

                 //.addItem(g3)
                 ;
    cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.open(0,1,2);}}, 'o');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.close(0,1,2);}}, 'c');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setWidth(300);}}, '1');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setPosition(0,0);accordion.setItemHeight(190);}}, '2'); 
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.ALL);}}, '3');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {accordion.setCollapseMode(ControlP5.SINGLE);}}, '4');
  cp5.mapKeyFor(new ControlKey() {public void keyEvent() {cp5.remove("myGroup1");}}, '0');
  
  accordion.open(0,1,2);
  
  // use Accordion.MULTI to allow multiple group 
  // to be open at a time.
  accordion.setCollapseMode(Accordion.MULTI);
  
  // when in SINGLE mode, only 1 accordion  
  // group can be open at a time.  
  // accordion.setCollapseMode(Accordion.SINGLE);
                
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

    print("line status :");
    println(lineColorSelectStatus);
    //int rgbInt = cp5.get(ColorWheel.class,"c").getRGB();
    //String hexValue = String.format("#%06x",rgbInt);
    //colorHexValue = hexValue;
    ////print("font color value : ");
    ////println(colorHexValue);
  }
  if(theControlEvent.isFrom("weight")){
    int a =(int)theControlEvent.getController().getValue();
    lineWeight = a;
  }
  if(theControlEvent.isFrom("exportPdf")){
    savePDF = true;
    print("save pdf status");
    println(savePDF);
  }
  if(theControlEvent.isFrom("eraser")){
    doEraser = true;
  }
  if(theControlEvent.isFrom("eraserSize")){
    int a =(int)theControlEvent.getController().getValue();
    eraserWeight = a;
  }
  
}