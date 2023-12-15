float factor = 0.005;
ArrayList <Bubble> bubsArrayList;
Bubble aBub;
int nob = 100;
int norb = 10;
int meow= 5;
int total;
int filterHeight;
void setup() {
  size(400, 800);
  filterHeight = height/4;
  noStroke();
  textAlign(CENTER, CENTER);
  bubsArrayList = new ArrayList<Bubble>();
  for (int i = 0; i < nob - norb; i++) {
    bubsArrayList.add(new Bubble());
  }
  for (int i = nob-norb; i < nob; i++) {
    bubsArrayList.add(new Bubble(255, 0, 0));
  }
  for (int i = nob -norb-meow; i < nob; i++) {
    bubsArrayList.add(new Bubble((int)(Math.random()*500), (int)(Math.random()*(3*height/4)+(height/4))));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < bubsArrayList.size(); i++) {
    Bubble original = bubsArrayList.get(i);
    bubsArrayList.get(i).move();
    if (original.y + original.sz/2 <= 0) {
      original.y = height + original.sz/2;
    }
    if (original.x - original.sz/2 <= 0) {
      bubsArrayList.remove(i);
    } else if (original.x + original.sz/2 >= width-10) {
      bubsArrayList.remove(i);
    } else {
      bubsArrayList.get(i).show();
      for (int j = 0; j < bubsArrayList.size(); j++) {
        Bubble second = bubsArrayList.get(j);
        if (i != j) {
          if (dist(original.x, original.y, second.x, second.y) <= ((original.sz + second.sz)/2)) {
            bubsArrayList.remove(j);
            if (i < j) {
              bubsArrayList.remove(i);
            } else {
              bubsArrayList.remove(i-1);
            }
          }
        }
      }
    }
  }
  fill(100);
  stroke(255);
  rect(0, 0, 100, 50);
  fill(255);
  textSize(13);
  text("Num Bubbles: " + bubsArrayList.size(), 50, 25);
  stroke(255, 255, 255);
  line(0, filterHeight, width, filterHeight);
  stroke(0);
}

void mouseClicked() {
  for (int i = 0; i < 10; i++) {
    bubsArrayList.add(new Bubble((float)(Math.random()*width), (float)(Math.random()*(height-filterHeight))+filterHeight));
  }
}
