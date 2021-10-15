Table t1, t2, t3; 
int numRows_1, numRows_2, numRows_3; 
int collumn_width;
PFont font;
PGraphics g1, g2, g3, g4;
PShape s, g;
PImage e, e2; 
float angle; 

//character line count start from 0
int dum = 0; 
int har = 0; 
int her = 0; 
int ron = 0; 
int hag = 0; 
int mcg = 0; 
int dra = 0; 
int sna = 0; 
int vol = 0; 
int dob = 0; 
int lup = 0; 


//character name in csv column
String dumbledore = "Albus Dumbledore";
String harry = "Harry Potter"; 
String hermione = "Hermione Granger"; 
String weasley = "Ron Weasley"; 
String hagrid = "Rubeus Hagrid"; 
String mcgonagall = "Minerva McGonagall"; 
String draco = "Draco Malfoy";
String snape = "Severus Snape"; 
String voldemort = "Voldemort";  
String lupin = "LUPIN"; 
String dobby = "DOBBY"; 

int char_num =9; 

//create arrays to store line count and names
int [] char_list = new int[char_num];
String[] char_name = new String[char_num]; 

boolean just_circle = true; 
boolean name = false; 
boolean count = false; 
boolean both = false; 

boolean line_1 = true; 
boolean line_2 = false; 
boolean line_3 = false; 

void setup()
{
  size(900, 800, P3D);
  g1 = createGraphics(600, 600);
  g2 = createGraphics(300, 300, P3D);
  g3 = createGraphics(300, 300, P3D);
  g4 = createGraphics(900, 200);
  s = createShape(SPHERE, 10 );
  g = createShape(SPHERE, 10 );
  e = loadImage("slytherin.jpeg");
  e2 = loadImage("gryffindor.jpeg");
  s.setTexture(e);
  g.setTexture(e2); 

  //load tables 
  t1 = loadTable("script_1.csv", "header"); 
  t2 = loadTable("script_2.csv", "header");
  t3 = loadTable("script_3.csv", "header");

  //get row count of each table 
  numRows_1 = t1.getRowCount(); 
  numRows_2 = t2.getRowCount(); 
  numRows_3 = t3.getRowCount(); 
  println("There are" + " respectively" + " " + numRows_1 + ", " + numRows_2 + ", " + numRows_3 
    + " " + "rows in script 1-3");

  lineCount_1();
}
void draw()
{
  background(0);
  drawG1();
  image(g1, 0, 0);
  drawG2();
  image(g2, 600, 0);
  drawG3(); 
  image(g3, 600, 300);
  drawG4(); 
  image(g4, 0, 600);
}
void drawG1()
{
  g1.beginDraw();
  g1.background(250); 
  g1.textAlign(CENTER, CENTER); 

  font = loadFont("Luminari-Regular-15.vlw");
  g1.textFont(font);

  //draw buttons 
  g1.stroke(2);
  g1.fill(0);
  g1.text("FILM 1", (50 + 90/2), (g1.height/40 + 30/2));
  g1.fill(169, 169, 169, 60); 
  g1.noStroke();
  g1.rect(50, g1.height/40, 90, 30); 

  g1.pushMatrix(); 
  g1.translate(90, 0);
  g1.stroke(0);
  g1.fill(0);
  g1.text("FILM 2", (50 + 90/2), (g1.height/40 + 30/2));
  g1.fill(169, 169, 169, 60); 
  g1.noStroke();
  g1.rect(50, g1.height/40, 90, 30); 
  g1.popMatrix(); 

  g1.pushMatrix(); 
  g1.translate(90+90, 0);
  g1.stroke(0);
  g1.fill(0);
  g1.text("FILM 3", (50 + 90/2), (g1.height/40 + 30/2));
  g1.fill(169, 169, 169, 60); 
  g1.noStroke();
  g1.rect(50, g1.height/40, 90, 30); 
  g1.popMatrix(); 

  g1.pushMatrix(); 
  g1.translate(0, 30);
  g1.stroke(2);
  g1.fill(0);
  g1.text("Name", (50 + 90/2), (g1.height/40 + 30/2));
  g1.fill(250, 250, 0, 40); 
  g1.noStroke();
  g1.rect(50, g1.height/40, 90, 30); 

  g1.pushMatrix(); 
  g1.translate(90, 0);
  g1.stroke(0);
  g1.fill(0);
  g1.text("Count", (50 + 90/2), (g1.height/40 + 30/2));
  g1.fill(250, 250, 0, 40); 
  g1.noStroke();
  g1.rect(50, g1.height/40, 90, 30); 
  g1.popMatrix(); 

  g1.pushMatrix(); 
  g1.translate(90+90, 0);
  g1.stroke(0);
  g1.fill(0);
  g1.text("Show both", (50 + 90/2), (g1.height/40 + 30/2));
  g1.fill(250, 250, 0, 40); 
  g1.noStroke();
  g1.rect(50, g1.height/40, 90, 30); 
  g1.popMatrix();

  g1.pushMatrix(); 
  g1.translate(90+90+90, 0);
  g1.stroke(0);
  g1.fill(0);
  g1.text("Don't show", (50 + 90/2), (g1.height/40 + 30/2));
  g1.fill(250, 250, 0, 40); 
  g1.noStroke();
  g1.rect(50, g1.height/40, 90, 30); 
  g1.popMatrix();

  g1.popMatrix(); 


  //information that the user looks for
  if (just_circle) {
    drawCount();
    draw_legends();
    g1.stroke(2);
    g1.fill(250, 250, 0, 40);
    g1.rect((50+90*3), (g1.height/40+30), 90, 30);
  } 
  if (name) {
    drawCount_name();
    draw_legends();
    g1.stroke(2);
    g1.fill(250, 250, 0, 40);
    g1.rect((50), (g1.height/40+30), 90, 30);
  } 
  if (count) {
    drawCount_count();
    draw_legends_count();
    g1.stroke(2);
    g1.fill(250, 250, 0, 40);
    g1.rect((50+90), (g1.height/40+30), 90, 30);
  }
  if (both) {
    drawCount_both();
    draw_legends_count();
    g1.stroke(2);
    g1.fill(250, 250, 0, 40);
    g1.rect((50+90*2), (g1.height/40+30), 90, 30);
  }

  if (line_1) {
    g1.stroke(2);
    g1.fill(0, 0, 0, 40);
    g1.rect((50), (g1.height/40), 90, 30);
  } 
  if (line_2) {
    g1.stroke(2);
    g1.fill(0, 0, 0, 40);
    g1.rect((50+90), (g1.height/40), 90, 30);
  }
  if (line_3) 
  {
    g1.stroke(2);
    g1.fill(0, 0, 0, 40);
    g1.rect((50+90*2), (g1.height/40), 90, 30);
  }

  g1.endDraw();
}

//draw the Slytherin Ball
void drawG2()
{
  font = loadFont("Luminari-Regular-15.vlw");
  g2.textFont(font);
  if (just_circle) {
    slyBall();
  } 
  if (name) {
    slyBall();
  } 
  if (count) {
    slyBall_count();
  }
  if (both) {
    slyBall_count();
  }
}

//draw the Gryffindor ball
void drawG3()
{
  font = loadFont("Luminari-Regular-15.vlw");
  g3.textFont(font);
  if (just_circle) {
    gryBall();
  } 
  if (name) {
    gryBall();
  } 
  if (count) {
    gryBall_count();
  }
  if (both) {
    gryBall_count();
  }
}

//draw instruction panel
void drawG4() 
{
  g4.beginDraw();
  g4.background(250); 
  g4.textAlign(CENTER, CENTER); 
  font = loadFont("AvenirNext-Regular-26.vlw");
  g4.textFont(font, 18);


  g4.stroke(1); 
  g4.fill(0);
  g4.text("Click on the button above to select which film and what information you want to see", (g4.width-60)/2, 50);
  g4.text("The right side is a live 3D comparison of the total line count of characters from \n the two main houses in the first three films - Slytherin and Gryffindor House", 
    (g4.width-60)/2, 100);
  g4.text("Press 'S' key to save the above chart as an image", 
    (g4.width-60)/2, 150);

  g4.line(0, 0, g4.width, 0);
  g4.endDraw();
}

//take user input by mouse press
void mousePressed() {
  if (mouseX < (50+90) && mouseX > 50 
    && mouseY <(g1.height/40 + 30*2) && mouseY> (g1.height/40 +30) ) 
  {
    println("show name is pressed");
    name = true; 
    count = false; 
    just_circle = false;
    both = false; 
    g1.stroke(2);
  }

  if (mouseX < (50+90*2) && mouseX > (50+90) 
    && mouseY <(g1.height/40 + 30*2) && mouseY> (g1.height/40 +30) ) 
  {
    println("show count is pressed");
    name = false; 
    count = true; 
    just_circle = false;
    both = false;
  }

  if (mouseX < (50+90*3) && mouseX > (50+90*2) 
    && mouseY <(g1.height/40 + 30*2) && mouseY> (g1.height/40 +30) ) 
  {
    println("show both is pressed");
    name = false; 
    count = false; 
    just_circle = false;
    both = true;
  }

  if (mouseX < (50+90*4) && mouseX > (50+90*3) 
    && mouseY <(g1.height/40 + 30*2) && mouseY> (g1.height/40 +30) ) 
  {
    println("show none is pressed");
    name = false; 
    count = false; 
    just_circle = true;
    both = false;
  }

  if (mouseX < (50+90) && mouseX > 50 
    && mouseY <(g1.height/40 + 30) && mouseY> (g1.height/40) ) 
  {
    println("film 1 is pressed");
    line_1 = true; 
    line_2=false; 
    line_3=false; 
    lineCount_1();
  }

  if (mouseX < (50+90+90) && mouseX > (50+90) 
    && mouseY <(g1.height/40 + 30) && mouseY> (g1.height/40) ) 
  {
    println("film 2 is pressed");
    line_1 = false; 
    line_2=true; 
    line_3=false; 
    lineCount_2();
  }

  if (mouseX < (50+90+90+90) && mouseX > (50+90+90) 
    && mouseY <(g1.height/40 +30 ) && mouseY> (g1.height/40) ) 
  {
    println("film 3 is pressed");
    line_1 = false; 
    line_2=false; 
    line_3=true; 
    lineCount_3();
  }
}


//count the lines of chosen characters 
void lineCount_1() {
  int dum = 0; 
  int har = 0; 
  int her = 0; 
  int ron = 0; 
  int hag = 0; 
  int mcg = 0; 
  int dra = 0; 
  int sna = 0; 
  int vol = 0; 

  // count how many times a character's name appear in the dialogue table of HP1 -> line count of HP1 
  for (int i=0; i<numRows_1; i++) 
  {
    TableRow row_1 = t1.getRow(i); 
    String name = row_1.getString("character_name"); 

    if (name.equals(dumbledore)) {
      dum ++;
    } else if (name.equals(harry)) {
      har ++;
    } else if (name.equals(hermione)) {
      her ++;
    } else if (name.equals(weasley)) {
      ron ++;
    } else if (name.equals(hagrid)) {
      hag ++;
    } else if (name.equals(mcgonagall)) {
      mcg ++;
    } else if (name.equals(draco)) {
      dra ++;
    } else if (name.equals(snape)) {
      sna ++;
    } else if (name.equals(voldemort)) {
      vol ++;
    }
  }
  println("Table1"+ " " +dum + " " + har + " " + her + " " 
    + ron + " " + hag + " " + mcg + " " + dra + " " + sna + " " + vol);

  //populate the array with the line count and names 
  char_list[0]=dum; 
  char_list[1]=har; 
  char_list[2]=her; 
  char_list[3]=ron; 
  char_list[4]=hag; 
  char_list[5]=mcg; 
  char_list[6]=dra;
  char_list[7]=sna; 
  char_list[8]=vol;

  char_name[0]= dumbledore; 
  char_name[1]= harry; 
  char_name[2]= hermione;
  char_name[3]= weasley; 
  char_name[4]= hagrid; 
  char_name[5]= mcgonagall; 
  char_name[6]= draco; 
  char_name[7]= snape; 
  char_name[8]= voldemort;
}

void lineCount_2() {
  int dum = 0; 
  int har = 0; 
  int her = 0; 
  int ron = 0; 
  int hag = 0; 
  int mcg = 0; 
  int dra = 0; 
  int sna = 0; 
  int vol = 0; 
  int dob = 0; 

  for (int i=0; i<numRows_1; i++) 
  {
    TableRow row_2 = t2.getRow(i); 
    String name = row_2.getString("character_name"); 

    if (name.equals(dumbledore)) {
      dum ++;
    } else if (name.equals(harry)) {
      har ++;
    } else if (name.equals(hermione)) {
      her ++;
    } else if (name.equals(weasley)) {
      ron ++;
    } else if (name.equals(hagrid)) {
      hag ++;
    } else if (name.equals(mcgonagall)) {
      mcg ++;
    } else if (name.equals(draco)) {
      dra ++;
    } else if (name.equals(snape)) {
      sna ++;
    } else if (name.equals(dobby)) {
      dob ++;
    }
  }
  println("Table2"+ " " + dum + " " + har + " " + her + " " 
    + ron + " " + hag + " " + mcg + " " + dra + " " + sna + " " + vol );

  //populate the array with the line count and names
  char_list[0]=dum; 
  char_list[1]=har; 
  char_list[2]=her; 
  char_list[3]=ron; 
  char_list[4]=hag; 
  char_list[5]=mcg; 
  char_list[6]=dra;
  char_list[7]=sna; 
  char_list[8]=dob;

  char_name[0]= dumbledore; 
  char_name[1]= harry; 
  char_name[2]= hermione;
  char_name[3]= weasley; 
  char_name[4]= hagrid; 
  char_name[5]= mcgonagall; 
  char_name[6]= draco; 
  char_name[7]= snape; 
  char_name[8]= dobby;
}

void lineCount_3() {

  int dum = 0; 
  int har = 0; 
  int her = 0; 
  int ron = 0; 
  int hag = 0; 
  int mcg = 0; 
  int dra = 0; 
  int sna = 0; 
  int vol = 0; 
  int lup = 0; 

  for (int i=0; i<numRows_1; i++) 
  {
    TableRow row_3 = t3.getRow(i); 
    String name = row_3.getString("character_name"); 

    if (name.equals(dumbledore)) {
      dum ++;
    } else if (name.equals(harry)) {
      har ++;
    } else if (name.equals(hermione)) {
      her ++;
    } else if (name.equals(weasley)) {
      ron ++;
    } else if (name.equals(hagrid)) {
      hag ++;
    } else if (name.equals(mcgonagall)) {
      mcg ++;
    } else if (name.equals(draco)) {
      dra ++;
    } else if (name.equals(snape)) {
      sna ++;
    } else if (name.equals(lupin)) {
      lup ++;
    }
  }
  println("Table3"+ " " + dum + " " + har + " " + her + " " 
    + ron + " " + hag + " " + mcg + " " + dra + " " + sna + " " + vol );

  //populate the array with the line count and names
  char_list[0]=dum; 
  char_list[1]=har; 
  char_list[2]=her; 
  char_list[3]=ron; 
  char_list[4]=hag; 
  char_list[5]=mcg; 
  char_list[6]=dra;
  char_list[7]=sna; 
  char_list[8]=lup;

  char_name[0]= dumbledore; 
  char_name[1]= harry; 
  char_name[2]= hermione;
  char_name[3]= weasley; 
  char_name[4]= hagrid; 
  char_name[5]= mcgonagall; 
  char_name[6]= draco; 
  char_name[7]= snape; 
  char_name[8]= lupin;
}

void drawCount() {
  randomSeed(21); 
  for (int i=0; i<char_num; i++) 
  {
    //random value with the section 
    float random_x = random(100, g1.width-150);
    float random_y = random(100, g1.height-150);
    g1.noStroke(); 
    if ((char_name[i] == draco) || (char_name[i] == snape) || (char_name[i] == voldemort)) {
      color c = color(0, 128, 0, 60);
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    } else if (char_name[i] == dobby) {
      color c = color(238, 130, 238, 60); 
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    } else {
      color c = color(255, 0, 0, 60); 
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    }
  }
}


void drawCount_name() {
  randomSeed(21); 
  for (int i=0; i<char_num; i++) 
  {
    //random value with the section 
    float random_x = random(100, g1.width-150);
    float random_y = random(100, g1.height-150);
    g1.noStroke(); 
    if ((char_name[i] == draco) || (char_name[i] == snape) || (char_name[i] == voldemort)) {
      color c = color(0, 128, 0, 60);
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    } else if (char_name[i] == dobby) {
      color c = color(238, 130, 238, 60); 
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    } else {
      color c = color(255, 0, 0, 60); 
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    }
    g1.fill(0); 
    g1.text(char_name[i], random_x, random_y);
  }
}

void drawCount_count() {
  randomSeed(21); 
  for (int i=0; i<char_num; i++) 
  {
    float random_x = random(100, g1.width-150);
    float random_y = random(100, g1.height-150);
    g1.noStroke(); 
    if ((char_name[i] == draco) || (char_name[i] == snape) || (char_name[i] == voldemort)) {
      color c = color(0, 128, 0, 60);
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    } else if (char_name[i] == dobby) {
      color c = color(238, 130, 238, 60); 
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    } else {
      color c = color(255, 0, 0, 60); 
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    }
    g1.fill(0); 
    g1.text(char_list[i], random_x, random_y);
  }
}

void drawCount_both() {
  randomSeed(21); 
  for (int i=0; i<char_num; i++) 
  {
    float random_x = random(100, g1.width-150);
    float random_y = random(100, g1.height-150);
    g1.noStroke(); 
    if ((char_name[i] == draco) || (char_name[i] == snape) || (char_name[i] == voldemort)) {
      color c = color(0, 128, 0, 60);
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    } else if (char_name[i] == dobby) {
      color c = color(238, 130, 238, 60); 
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    } else {
      color c = color(255, 0, 0, 60); 
      g1.fill(c); 
      g1.ellipse(random_x, random_y, sqrt((char_list[i]))*9, sqrt((char_list[i]))*9);
    }
    g1.fill(0); 
    g1.text(char_list[i], random_x, random_y+10);
    g1.text(char_name[i], random_x, random_y-10);
  }
}

void keyPressed() {
  switch (key) {
  case 's':
    PImage temp = get(0, 0, 900, 600);
    temp.save("HarryPotter_lineCount.png");
  }
}

void draw_legends() {

  if (line_1) {
    int s_num = char_list[6] + char_list[7] + char_list[8];
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5];
    int o_num = 0;


    g1.stroke(0);
    g1.fill(0);
    g1.text("Top nine frequent characters line count in the first three Harry Potter films", 
      g1.width/2, ((g1.height-g1.height/40-20) - 30*2));
    g1.text("Gryffindor", (50 + g_num/4/2), ((g1.height-g1.height/40-20) + 30/2 -30));
    g1.fill(255, 0, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), g_num/4, 30); 

    g1.pushMatrix(); 
    g1.translate(200, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Slytherin", (50 + s_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.fill(0, 128, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), s_num/4, 30); 
    g1.popMatrix(); 

    g1.pushMatrix(); 
    g1.translate(200*2, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Other", (50 + o_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.fill(238, 130, 238, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), o_num/4, 30); 

    g1.popMatrix();
  } else if (line_2) {
    int s_num = char_list[6] + char_list[7];
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5] ;
    int o_num = char_list[8];

    g1.stroke(0);
    g1.fill(0);
    g1.text("Gryffindor", (50 + g_num/4/2), ((g1.height-g1.height/40-20) + 30/2 -30));
    g1.text("Top nine frequent characters line count in the first three Harry Potter films", 
      g1.width/2, ((g1.height-g1.height/40-20) - 30*2));
    g1.fill(255, 0, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), g_num/4, 30); 

    g1.pushMatrix(); 
    g1.translate(200, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Slytherin", (50 + s_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.fill(0, 128, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), s_num/4, 30); 
    g1.popMatrix(); 

    g1.pushMatrix(); 
    g1.translate(200*2, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Other", (50 + o_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.fill(238, 130, 238, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), o_num/4, 30); 

    g1.popMatrix();
  } else {
    int s_num = char_list[6] + char_list[7];
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5] + char_list[8] ;
    int o_num = 0;

    g1.stroke(0);
    g1.fill(0);
    g1.text("Gryffindor", (50 + g_num/4/2), ((g1.height-g1.height/40-20) + 30/2 -30));
    g1.text("Top nine frequent characters line count in the first three Harry Potter films", 
      g1.width/2, ((g1.height-g1.height/40-20) - 30*2));
    g1.fill(255, 0, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), g_num/4, 30); 

    g1.pushMatrix(); 
    g1.translate(200, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Slytherin", (50 + s_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.fill(0, 128, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), s_num/4, 30); 
    g1.popMatrix(); 

    g1.pushMatrix(); 
    g1.translate(200*2, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Other", (50 + o_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.fill(238, 130, 238, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), o_num/4, 30); 

    g1.popMatrix();
  }
}

void draw_legends_count() {

  if (line_1) {
    int s_num = char_list[6] + char_list[7] + char_list[8];
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5];
    int o_num = 0;



    g1.stroke(0);
    g1.fill(0);
    g1.text("Gryffindor", (50 + g_num/4/2), ((g1.height-g1.height/40-20) + 30/2 -30));
    g1.text("Top nine frequent characters line count in the first three Harry Potter films", 
      g1.width/2, ((g1.height-g1.height/40-20) - 30*2));
    g1.text(g_num, (50+g_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(255, 0, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), g_num/4, 30); 

    g1.pushMatrix(); 
    g1.translate(200, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Slytherin", (50 + s_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.text(s_num, (50+s_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(0, 128, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), s_num/4, 30); 
    g1.popMatrix(); 

    g1.pushMatrix(); 
    g1.translate(200*2, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Other", (50 + o_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.text(o_num, (50+o_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(238, 130, 238, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), o_num/4, 30); 

    g1.popMatrix();
  } else if (line_2) {
    int s_num = char_list[6] + char_list[7];
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5] ;
    int o_num = char_list[8];

    g1.stroke(0);
    g1.fill(0);
    g1.text("Gryffindor", (50 + g_num/4/2), ((g1.height-g1.height/40-20) + 30/2 -30));
    g1.text("Top nine frequent characters line count in the first three Harry Potter films", 
      g1.width/2, ((g1.height-g1.height/40-20) - 30*2));
    g1.text(g_num, (50+g_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(255, 0, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), g_num/4, 30); 

    g1.pushMatrix(); 
    g1.translate(200, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Slytherin", (50 + s_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.text(s_num, (50+s_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(0, 128, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), s_num/4, 30); 
    g1.popMatrix(); 

    g1.pushMatrix(); 
    g1.translate(200*2, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Other", (50 + o_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.text(o_num, (50+o_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(238, 130, 238, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), o_num/4, 30); 

    g1.popMatrix();
  } else {
    int s_num = char_list[6] + char_list[7];
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5] + char_list[8] ;
    int o_num = 0;

    g1.stroke(0);
    g1.fill(0);
    g1.text("Gryffindor", (50 + g_num/4/2), ((g1.height-g1.height/40-20) + 30/2 -30));
    g1.text("Top nine frequent characters line count in the first three Harry Potter films", 
      g1.width/2, ((g1.height-g1.height/40-20) - 30*2));
    g1.text(g_num, (50+g_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(255, 0, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), g_num/4, 30); 

    g1.pushMatrix(); 
    g1.translate(200, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Slytherin", (50 + s_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.text(s_num, (50+s_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(0, 128, 0, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), s_num/4, 30); 
    g1.popMatrix(); 

    g1.pushMatrix(); 
    g1.translate(200*2, 0); 
    g1.stroke(0);
    g1.fill(0);
    g1.text("Other", (50 + o_num/4/2), ((g1.height-g1.height/40-20) + 30/2 - 30));
    g1.text(o_num, (50+o_num/4/2), ((g1.height-g1.height/40-20)+30/2));
    g1.fill(238, 130, 238, 60); 
    g1.noStroke();
    g1.rect(50, (g1.height-g1.height/40-20), o_num/4, 30); 

    g1.popMatrix();
  }
}

void slyBall() {
  if (line_1) {
    int s_num = char_list[6] + char_list[7] + char_list[8];
    angle += 0.01; 
    g2.beginDraw();
    g2.textAlign(CENTER, CENTER);

    g2.background(20);
    g2.pushMatrix(); 
    g2.translate(g2.width/2, g2.height/2, 0);
    g2.scale(sqrt(s_num)/3);
    g2.rotateY(angle);

    g2.ambientLight(255, 255, 255); 
    g2.pointLight(0, 128, 0, g2.width/2, 0, 0); 
    s.setStroke(0); 
    g2.shape(s, 0, 0);
    g2.popMatrix();

    g2.textSize(15);
    g2.fill(255);
    g2.text("Slytherin", g2.width/2, 100, 0);  

    g2.endDraw();
  } else {
    int s_num = char_list[6] + char_list[7];
    angle += 0.01; 
    g2.beginDraw();

    g2.background(20);
    g2.pushMatrix(); 
    g2.translate(g2.width/2, g2.height/2, 0);
    g2.scale(sqrt(s_num)/3);
    g2.rotateY(angle);

    g2.ambientLight(255, 255, 255); 
    g2.pointLight(0, 128, 0, g2.width/2, 0, 0); 
    g2.fill(200); 
    s.setStroke(0); 
    g2.shape(s, 0, 0);
    g2.popMatrix();

    g2.textSize(15);
    g2.fill(255);
    g2.text("Slytherin", g2.width/2, 100, 0);

    g2.endDraw();
  }
}
void slyBall_count() {
  if (line_1) {
    int s_num = char_list[6] + char_list[7] + char_list[8];
    angle += 0.01; 
    g2.beginDraw();
    g2.textAlign(CENTER, CENTER);

    g2.background(20);
    g2.pushMatrix(); 
    g2.translate(g2.width/2, g2.height/2, 0);
    g2.scale(sqrt(s_num)/3);
    g2.rotateY(angle);

    g2.ambientLight(255, 255, 255); 
    g2.pointLight(0, 128, 0, g2.width/2, 0, 0); 
    s.setStroke(0); 
    g2.shape(s, 0, 0);
    g2.popMatrix();

    g2.textSize(15);
    g2.fill(255);
    g2.text("Slytherin", g2.width/2, 100, 0);  
    g2.text(s_num, g2.width/2, 190, 0);  

    g2.endDraw();
  } else {
    int s_num = char_list[6] + char_list[7];
    angle += 0.01; 
    g2.beginDraw();

    g2.background(20);
    g2.pushMatrix(); 
    g2.translate(g2.width/2, g2.height/2, 0);
    g2.scale(sqrt(s_num)/3);
    g2.rotateY(angle);

    g2.ambientLight(255, 255, 255); 
    g2.pointLight(0, 128, 0, g2.width/2, 0, 0); 
    g2.fill(200); 
    s.setStroke(0); 
    g2.shape(s, 0, 0);
    g2.popMatrix();

    g2.textSize(15);
    g2.fill(255);
    g2.text("Slytherin", g2.width/2, 100, 0);
    g2.text(s_num, g2.width/2, 190, 0);  

    g2.endDraw();
  }
}


void gryBall() {
  if (line_1) {
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5];
    angle += 0.01; 
    g3.beginDraw();

    g3.textAlign(CENTER, CENTER); 

    g3.background(20);
    g3.pushMatrix(); 
    g3.translate(g3.width/2, g3.height/2, 0);
    g3.scale(sqrt(g_num)/3);
    g3.rotateY(angle);

    g3.ambientLight(255, 255, 255); 
    g3.pointLight(250, 0, 0, g3.width/2, 0, 0); 
    g3.fill(200); 
    g.setStroke(0); 
    g3.shape(g, 0, 0);
    g3.popMatrix();

    g3.textSize(15);
    g3.fill(255);
    g3.text("Gryffindor", g2.width/2, 20, 0);

    g3.endDraw();
  } else if (line_2) {
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5] ;
    angle += 0.01; 
    g3.beginDraw();

    g3.background(20);
    g3.pushMatrix(); 
    g3.translate(g3.width/2, g3.height/2, 0);
    g3.scale(sqrt(g_num)/3);
    g3.rotateY(angle);

    g3.ambientLight(255, 255, 255); 
    g3.pointLight(250, 0, 0, g3.width/2, 0, 0); 
    g3.fill(200); 
    g.setStroke(0); 
    g3.shape(g, 0, 0);
    g3.popMatrix();

    g3.textSize(15);
    g3.fill(255);
    g3.text("Gryffindor", g2.width/2, 20, 0);

    g3.endDraw();
  } else {
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5] + char_list[8] ;
    angle += 0.01; 
    g3.beginDraw();

    g3.background(20);
    g3.pushMatrix(); 
    g3.translate(g3.width/2, g3.height/2, 0);
    g3.scale(sqrt(g_num)/3);
    g3.rotateY(angle);

    g3.ambientLight(255, 255, 255); 
    g3.pointLight(250, 0, 0, g3.width/2, 0, 0); 
    g3.fill(200); 
    g.setStroke(0); 
    g3.shape(g, 0, 0);
    g3.popMatrix();

    g3.textSize(15);
    g3.fill(255);
    g3.text("Gryffindor", g2.width/2, 20, 0);

    g3.endDraw();
  }
}

void gryBall_count() {
  if (line_1) {
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5];
    angle += 0.01; 
    g3.beginDraw();

    g3.textAlign(CENTER, CENTER); 

    g3.background(20);
    g3.pushMatrix(); 
    g3.translate(g3.width/2, g3.height/2, 0);
    g3.scale(sqrt(g_num)/3);
    g3.rotateY(angle);

    g3.ambientLight(255, 255, 255); 
    g3.pointLight(250, 0, 0, g3.width/2, 0, 0); 
    g3.fill(200); 
    g.setStroke(0); 
    g3.shape(g, 0, 0);
    g3.popMatrix();

    g3.textSize(15);
    g3.fill(255);
    g3.text("Gryffindor", g2.width/2, 20, 0);
    g3.text(g_num, g2.width/2, 260, 0);  


    g3.endDraw();
  } else if (line_2) {
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5] ;
    angle += 0.01; 
    g3.beginDraw();

    g3.background(20);
    g3.pushMatrix(); 
    g3.translate(g3.width/2, g3.height/2, 0);
    g3.scale(sqrt(g_num)/3);
    g3.rotateY(angle);

    g3.ambientLight(255, 255, 255); 
    g3.pointLight(250, 0, 0, g3.width/2, 0, 0); 
    g3.fill(200); 
    g.setStroke(0); 
    g3.shape(g, 0, 0);
    g3.popMatrix();

    g3.textSize(15);
    g3.fill(255);
    g3.text("Gryffindor", g2.width/2, 20, 0);
    g3.text(g_num, g2.width/2, 260, 0);  


    g3.endDraw();
  } else {
    int g_num = char_list[0] + char_list[1] + char_list[2] + 
      char_list[3] + char_list[4] + char_list[5] + char_list[8] ;
    angle += 0.01; 
    g3.beginDraw();

    g3.background(20);
    g3.pushMatrix(); 
    g3.translate(g3.width/2, g3.height/2, 0);
    g3.scale(sqrt(g_num)/3);
    g3.rotateY(angle);

    g3.ambientLight(255, 255, 255); 
    g3.pointLight(250, 0, 0, g3.width/2, 0, 0); 
    g3.fill(200); 
    g.setStroke(0); 
    g3.shape(g, 0, 0);
    g3.popMatrix();

    g3.textSize(15);
    g3.fill(255);
    g3.text("Gryffindor", g2.width/2, 20, 0);
    g3.text(g_num, g2.width/2, 260, 0);  

    g3.endDraw();
  }
}
