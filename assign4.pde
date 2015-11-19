final
int GAME_START=1,GAME_LOSE=2,GAME_RUN=3; 
int gameState=GAME_START ; 
int fx,fy;
 int tx,ty;
int ex,ey;
 int xb1,xb2;
 int hp;
int I;
 int xx=0; 
int jj=0;
 boolean s;
 int numFrames=5;
 int currentFrame;
 int []x=new int[20];
 int []xs=new int[5]; 
int []ys=new int[5];
PImage []images=new PImage[numFrames]; 
PImage sImg; 
PImage aImg; 
PImage bImg; 
PImage cImg; 
PImage d1Img; 
PImage d2Img; 
PImage hpImg; 
PImage start1Img; 
PImage startyImg; 
PImage end1Img; 
PImage end2Img; 
float V = 5; 
boolean upPressed = false; 
boolean downPressed = false;
 boolean leftPressed = false; 
boolean rightPressed = false;
 boolean ss = false; 
void setup(){ 
size(640,480); 
for(int i=0;i<numFrames;i++){
 images[i]= loadImage("img/flame"+(i+1)+".png");
 } 
xs[0] = -100;
 xs[1] = -100;
 xs[2] = -100;
 xs[3] = -100;
xs[4] = -100; 
xb1=640; 
xb2=0;
 fx=530; 
fy=200; 
ex=-60; 
ey=floor(random(20,400));
 tx=floor(random(3,300));
 ty=floor(random(3,277)); 
hp=40; 
sImg=loadImage("img/shoot.png"); 
aImg=loadImage("img/fighter.png");
 bImg=loadImage("img/treasure.png");
cImg=loadImage("img/enemy.png"); 
d1Img=loadImage("img/bg1.png");
 d2Img=loadImage("img/bg2.png");
 hpImg=loadImage("img/hp.png"); 
start1Img=loadImage("img/start1.png"); 
startyImg=loadImage("img/start2.png"); 
end1Img=loadImage("img/end1.png"); 
end2Img=loadImage("img/end2.png");
 int i;
 for(i=0;i<20;i++){
 x[i]=0;
 }
 } 
void draw(){ 
switch(gameState){ 
case GAME_START:
 image(startyImg,0,0);
 if(mouseX>200&&mouseX<460&&mouseY>375&&mouseY<415){
 image(start1Img,0,0);
 }
 if(mousePressed){ 
gameState=GAME_RUN; 
} break;
 case GAME_RUN: 
if (upPressed) { 
fy -= V;
 if(fy<0){ fy=0; }
 } if (downPressed) {
 fy += V;
 if(fy>430){ fy=430; }
 } if (leftPressed) { 
fx -= V; 
if(fx<0){ fx=0;}
 } if (rightPressed) { 
fx += V;
 if(fx>590){ fx=590; } 
}
xx++;
 if(xx%(5)==0){ 
if (keyPressed) { 
if (key == ' ' || key == ' ') {
 jj++;
 xs[jj%5]=fx;
 ys[jj%5]=fy+10; 
}}} 
int i;
for(i=0;i<5;i++){
 xs[i] -= 6;
 if(xs[i]<-20){ ys[i]=500; }
 }
 if(((fx>=tx && fx<=tx+40) && (fy+25>=ty && fy+25<=ty+40))||((fx+25>=tx && fx+25<=tx+40) && (fy>=ty && fy<=ty+40))||((fx+25>=tx && fx+25<=tx+40) && (fy+50>=ty && fy+50<=ty+40))||((fx+50>=tx && fx+50<=tx+40) && (fy>=ty && fy<=ty+40))||((fx+50>=tx && fx+50<=tx+40) && (fy+50>=ty && fy+50<=ty+40))||((fx+50>=tx && fx+25<=tx+40) && (fy+50>=ty && fy+25<=ty+40))){ 
tx=floor(random(3,300)); 
ty=floor(random(3,277)); 
hp+=20;
 if(hp>200){ hp=200; }
 } 
image(d1Img,xb1-640,0); 
xb1=xb1+1;
 xb1%=1280;
 image(d2Img,xb2-640,0); 
xb2=xb2+1;
 xb2%=1280; 
image(bImg,tx,ty); 
for(i=0;i<5;i++){
 image(sImg,xs[i],ys[i]); } 
if(ex>=3000){ ex=-60; }
 if(ex>-1&&ex<2){ ey=floor(random(3,277)); for(i=0;i<20;i++){ x[i]=0; } } if(ex>935&&ex<938){ ey=floor(random(10,200)); for(i=0;i<20;i++){ x[i]=0; } } if(ex>1979&&ex<1985){ ey=floor(random(100,300)); for(i=0;i<20;i++){ x[i]=0; } } for(i=0;i<15;i++){ 
if(i<5){
 if(((fx>=ex-(60*i)%3000-60 && fx<=ex-(60*i)%3000-60+60) && (fy+25>=ey+x[i] && fy+25<=ey+60+x[i]))||((fx+25>=ex-(60*i)%3000-60 && fx+25<=ex-(60*i)%3000-60+60) && (fy>=ey+x[i] && fy<=ey+60+x[i]))||((fx+25>=ex-(60*i)%3000-60 && fx+25<=ex-(60*i)%3000-60+60) && (fy+50>=ey+x[i] && fy+50<=ey+60+x[i]))||((fx+50>=ex-(60*i)%3000-60 && fx+50<=ex-(60*i)%3000-60+60) && (fy>=ey+x[i] && fy<=ey+x[i]+60))||((fx+50>=ex-(60*i)%3000-60 && fx+50<=ex-(60*i)%3000-60+60) && (fy+50>=ey+x[i] && fy+50<=ey+x[i]+60))||((fx+50>=ex-(60*i)%3000-60 && fx+25<=ex-(60*i)%3000-60+60) && (fy+50>=ey+x[i] && fy+25<=ey+x[i]+60))){ 
x[i]=1000;
 for(int aa=0;aa<100;aa++){ 
int j=(aa)%5;
 image(images[j],ex-(60*i)%3000-60,ey);
 }
 if(hp<=40){ 
gameState=GAME_LOSE;
 }else{ hp-=40; }
} 
for(int iii=0;iii<5;iii++){ 
if(((xs[iii]>=ex-(60*i)%3000-60 && xs[iii]<=ex-(60*i)%3000-60+60) && (ys[iii]+20>=ey+x[i] && ys[iii]+20<=ey+60+x[i]))||((xs[iii]+20>=ex-(60*i)%3000-60 && xs[iii]+20<=ex-(60*i)%3000-60+60) && (ys[iii]>=ey+x[i] && ys[iii]<=ey+60+x[i]))||((xs[iii]+20>=ex-(60*i)%3000-60 && xs[iii]+20<=ex-(60*i)%3000-60+60) && (ys[iii]+20>=ey+x[i] && ys[iii]+20<=ey+60+x[i]))||((xs[iii]+20>=ex-(60*i)%3000-60 && xs[iii]+20<=ex-(60*i)%3000-60+60) && (ys[iii]>=ey+x[i] && ys[iii]<=ey+x[i]+60))||((xs[iii]+20>=ex-(60*i)%3000-60 && xs[iii]+20<=ex-(60*i)%3000-60+60) && (ys[iii]+20>=ey+x[i] && ys[iii]+20<=ey+x[i]+60))||((xs[iii]+20>=ex-(60*i)%3000-60 && xs[iii]+20<=ex-(60*i)%3000-60+60) && (ys[iii]+20>=ey+x[i] && ys[iii]+20<=ey+x[i]+60)))
{
 x[i]=1000; ys[iii]=500;
 for(int aa=0;aa<100;aa++){
 int j=(aa)%5; 
image(images[j],ex-(60*i)%3000-60,ey); } 
}} 
image(cImg,(ex-60*i)%3000-60,ey+x[i]); }
 if(i>=5&&i<10){ 
if(((fx>=(ex-801-51*i)%3000-60 && fx<=(ex-801-51*i)%3000-60+60) && (fy+25>=ey+x[i]+50*(i-5) && fy+25<=ey+x[i]+50*(i-5)+60))||((fx+25>=(ex-801-51*i)%3000-60 && fx+25<=(ex-801-51*i)%3000-60+60) && (fy>=ey+x[i]+50*(i-5) && fy<=ey+x[i]+50*(i-5)+60))||((fx+25>=(ex-801-51*i)%3000-60 && fx+25<=(ex-801-51*i)%3000-60+60) && (fy+50>=ey+x[i]+50*(i-5) && fy+50<=ey+x[i]+50*(i-5)+60))||((fx+50>=(ex-801-51*i)%3000-60 && fx+50<=(ex-801-51*i)%3000-60+60) && (fy>=ey+x[i]+50*(i-5) && fy<=ey+x[i]+50*(i-5)+60))||((fx+50>=(ex-801-51*i)%3000-60 && fx+50<=(ex-801-51*i)%3000-60+60) && (fy+50>=ey+x[i]+50*(i-5) && fy+50<=ey+x[i]+50*(i-5)+60))||((fx+50>=(ex-801-51*i)%3000-60 && fx+25<=(ex-801-51*i)%3000-60+60) && (fy+50>=ey+x[i]+50*(i-5) && fy+25<=ey+x[i]+50*(i-5)+60))){
 x[i]=1000; 
for(int aa=0;aa<100;aa++){
 int j=(aa)%5;
 image(images[j],(ex-801-51*i)%3000-60,ey+50*(i-5));
 }
 if(hp<=40){ gameState=GAME_LOSE;
 }else{ hp-=40; }} 
for(int iii=0;iii<5;iii++){
 if(((xs[iii]>=(ex-801-51*i)%3000-60 && xs[iii]<=(ex-801-51*i)%3000-60+60) && (ys[iii]+20>=ey+50*(i-5)+x[i] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-801-51*i)%3000-60 && xs[iii]+20<=(ex-801-51*i)%3000-60+60) && (ys[iii]>=ey+50*(i-5)+x[i] && ys[iii]<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-801-51*i)%3000-60 && xs[iii]+20<=(ex-801-51*i)%3000-60+60) && (ys[iii]+20>=ey+50*(i-5)+x[i] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-801-51*i)%3000-60 && xs[iii]+20<=(ex-801-51*i)%3000-60+60) && (ys[iii]>=ey+50*(i-5)+x[i] && ys[iii]<=ey+50*(i-5)+x[i]+60))||((xs[iii]+20>=(ex-801-51*i)%3000-60 && xs[iii]+20<=(ex-801-51*i)%3000-60+60) && (ys[iii]+20>=ey+50*(i-5)+x[i] && ys[iii]+20<=ey+50*(i-5)+x[i]+60))||((xs[iii]+20>=(ex-801-51*i)%3000-60 && xs[iii]+20<=(ex-801-51*i)%3000-60+60) && (ys[iii]+20>=ey+50*(i-5)+x[i] && ys[iii]+20<=ey+50*(i-5)+x[i]+60))){
 x[i]=1000;
 ys[iii]=500; 
for(int aa=0;aa<100;aa++){ 
int j=(aa)%5; 
image(images[j],(ex-801-51*i)%3000-60,ey+50*(i-5)); } }} image(cImg,(ex-801-51*i)%3000-60,ey+50*(i-5)+x[i]); }
if(i>=10&&i<=12){ 
if(((fx>=(ex-1602-51*i)%3000-60 && fx<=(ex-1602-51*i)%3000-60+60) && (fy+25>=ey+x[i]+50*(i-10) && fy+25<=ey+x[i]+50*(i-10)+60))||((fx+25>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy>=ey+x[i]+50*(i-10) && fy<=ey+x[i]+50*(i-10)+60))||((fx+25>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i]+50*(i-10) && fy+50<=ey+x[i]+50*(i-10)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+50<=(ex-1602-51*i)%3000-60+60) && (fy>=ey+x[i]+50*(i-10) && fy<=ey+x[i]+50*(i-10)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+50<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i]+50*(i-10) && fy+50<=ey+x[i]+50*(i-10)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i]+50*(i-10) && fy+25<=ey+x[i]+50*(i-10)+60))){
 x[i]=1000; 
for(int aa=0;aa<100;aa++){ 
int j=(aa)%5;
 image(images[j],(ex-1602-51*i)%3000-60,ey+50*(i-10)); }
 if(hp<=40){ 
gameState=GAME_LOSE; 
}else{ hp-=40; }} 
for(int iii=0;iii<5;iii++){ 
if(((xs[iii]>=(ex-1602-51*i)%3000-60 && xs[iii]<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey+50*(i-10)+x[i] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]>=ey+50*(i-10)+x[i] && ys[iii]<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey+50*(i-10)+x[i] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]>=ey+50*(i-10)+x[i] && ys[iii]<=ey+50*(i-10)+x[i]+60))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey+50*(i-10)+x[i] && ys[iii]+20<=ey+50*(i-10)+x[i]+60))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey+50*(i-10)+x[i] && ys[iii]+20<=ey+50*(i-10)+x[i]+60))){ 
if(xs[iii]>0){ x[i]=1000; ys[iii]=500; }
 for(int aa=0;aa<100;aa++){ 
int j=(aa)%5; 
image(images[j],(ex-1602-51*i)%3000-60,ey-100+50*(i-12)); } }} image(cImg,(ex-1602-51*i)%3000-60,ey+50*(i-10)+x[i]);
 if(((fx>=(ex-1602-51*i)%3000-60 && fx<=(ex-1602-51*i)%3000-60+60) && (fy+25>=ey+x[i+3]-50*(i-10) && fy+25<=ey+x[i+3]-50*(i-10)+60))||((fx+25>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy>=ey+x[i+3]-50*(i-10) && fy<=ey+x[i+3]-50*(i-10)+60))||((fx+25>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i+3]-50*(i-10) && fy+50<=ey+x[i+3]-50*(i-10)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+50<=(ex-1602-51*i)%3000-60+60) && (fy>=ey+x[i+3]-50*(i-10) && fy<=ey+x[i+3]-50*(i-10)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+50<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i+3]-50*(i-10) && fy+50<=ey+x[i+3]-50*(i-10)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i+3]-50*(i-10) && fy+25<=ey+x[i+3]-50*(i-10)+60))){
 x[i+3]=1000;
 for(int aa=0;aa<100;aa++){
int j=(aa)%5;
 image(images[j],(ex-1602-51*i)%3000-60,ey-50*(i-10)); } if(hp<=40){ gameState=GAME_LOSE; }else{ hp-=40; }} 
for(int iii=0;iii<5;iii++){ 
if(((xs[iii]>=(ex-1602-51*i)%3000-60 && xs[iii]<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey-50*(i-10)+x[i+3] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]>=ey-50*(i-10)+x[i+3] && ys[iii]<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey-50*(i-10)+x[i+3] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]>=ey-50*(i-10)+x[i+3] && ys[iii]<=ey-50*(i-10)+x[i+3]+60))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey-50*(i-10)+x[i+3] && ys[iii]+20<=ey-50*(i-10)+x[i+3]+60))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey-50*(i-10)+x[i+3] && ys[iii]+20<=ey-50*(i-10)+x[i+3]+60))){
 if(xs[iii]>0){ x[i+3]=1000; ys[iii]=500; } 
for(int aa=0;aa<100;aa++){ 
int j=(aa)%5;
 image(images[j],(ex-1602-51*i)%3000-60,ey-100+50*(i-12)); 
} }} image(cImg,(ex-1602-51*i)%3000-60,ey-50*(i-10)+x[i+3]); } 
 if(i==13){ if(((fx>=(ex-1602-51*i)%3000-60 && fx<=(ex-1602-51*i)%3000-60+60) && (fy+25>=ey+x[19]-100+50*(i-12) && fy+25<=ey+x[19]-100+50*(i-12)+60))||((fx+25>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy>=ey+x[19]-100+50*(i-12) && fy<=ey+x[19]-100+50*(i-12)+60))||((fx+25>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[19]-100+50*(i-12) && fy+50<=ey+x[19]-100+50*(i-12)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+50<=(ex-1602-51*i)%3000-60+60) && (fy>=ey+x[19]-100+50*(i-12) && fy<=ey+x[19]-100+50*(i-12)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+50<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[19]-100+50*(i-12) && fy+50<=ey+x[19]-100+50*(i-12)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[19]-100+50*(i-12) && fy+25<=ey+x[19]-100+50*(i-12)+60))){
 x[19]=1000; 
for(int aa=0;aa<100;aa++){
 int j=(aa)%5; 
image(images[j],(ex-1602-51*i)%3000-60,ey-100+50*(i-12)); } 
if(hp<=40){ 
gameState=GAME_LOSE;
}else{ hp-=40; }}
 for(int iii=0;iii<5;iii++){
 if(((xs[iii]>=(ex-1602-51*i)%3000-60 && xs[iii]<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey-100+50*(i-12)+x[19] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]>=ey-100+50*(i-12)+x[19] && ys[iii]<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey-100+50*(i-12)+x[19] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]>=ey-100+50*(i-12)+x[19] && ys[iii]<=ey-100+50*(i-12)+x[19]+60))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey-100+50*(i-12)+x[19] && ys[iii]+20<=ey-100+50*(i-12)+x[19]+60))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey-100+50*(i-12)+x[19] && ys[iii]+20<=ey-100+50*(i-12)+x[19]+60))){ 
if(xs[iii]>0){ x[19]=1000; 
ys[iii]=500;
 } for(int aa=0;aa<100;aa++){ 
int j=(aa)%5; 
image(images[j],(ex-1602-51*i)%3000-60,ey-100+50*(i-12)); } }} image(cImg,(ex-1602-51*i)%3000-60,ey-100+50*(i-12)+x[19]); }
if(i>=13&&i<15){
 if(((fx>=(ex-1602-51*i)%3000-60 && fx<=(ex-1602-51*i)%3000-60+60) && (fy+25>=ey+x[i+3]+100-50*(i-12) && fy+25<=ey+x[i+3]+100-50*(i-12)+60))||((fx+25>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy>=ey+x[i+3]+100-50*(i-12) && fy<=ey+x[i+3]+100-50*(i-12)+60))||((fx+25>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i+3]+100-50*(i-12) && fy+50<=ey+x[i+3]+100-50*(i-12)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+50<=(ex-1602-51*i)%3000-60+60) && (fy>=ey+x[i+3]+100-50*(i-12) && fy<=ey+x[i+3]+100-50*(i-12)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+50<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i+3]+100-50*(i-12) && fy+50<=ey+x[i+3]+100-50*(i-12)+60))||((fx+50>=(ex-1602-51*i)%3000-60 && fx+25<=(ex-1602-51*i)%3000-60+60) && (fy+50>=ey+x[i+3]+100-50*(i-12) && fy+25<=ey+x[i+3]+100-50*(i-12)+60))){
 x[i+3]=1000;
for(int aa=0;aa<100;aa++){
 int j=(aa)%5;
 image(images[j],(ex-1602-51*i)%3000-60,ey+100-50*(i-12)); }
 if(hp<=40){ 
gameState=GAME_LOSE;
 }else{ hp-=40; }}
for(int iii=0;iii<5;iii++){
 if(((xs[iii]>=(ex-1602-51*i)%3000-60 && xs[iii]<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey+100-50*(i-12)+x[i+3] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]>=ey+100-50*(i-12)+x[i+3] && ys[iii]<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey+100-50*(i-12)+x[i+3] && ys[iii]+20<=ey+50*(i-5)+60+x[i]))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]>=ey+100-50*(i-12)+x[i+3] && ys[iii]<=ey+100-50*(i-12)+x[i+3]+60))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey+100-50*(i-12)+x[i+3] && ys[iii]+20<=ey+100-50*(i-12)+x[i+3]+60))||((xs[iii]+20>=(ex-1602-51*i)%3000-60 && xs[iii]+20<=(ex-1602-51*i)%3000-60+60) && (ys[iii]+20>=ey+100-50*(i-12)+x[i+3] && ys[iii]+20<=ey+100-50*(i-12)+x[i+3]+60))){
 if(xs[iii]>0){ x[i+3]=1000; ys[iii]=500; } 
for(int aa=0;aa<100;aa++){ 
int j=(aa)%5;
 image(images[j],(ex-1602-51*i)%3000-60,ey-100+50*(i-12)); } }} image(cImg,(ex-1602-51*i)%3000-60,ey+100-50*(i-12)+x[i+3]); } } 
ex=ex+3; 
image(aImg,fx,fy); 
colorMode(RGB);
 fill(255,0,0); 
stroke(255,0,0); 
rect(11,16,hp,13); 
image(hpImg,10,10);
 break; 
case GAME_LOSE:
 image(end2Img,0,0); 
if(mouseX>210&&mouseX<440&&mouseY>305&&mouseY<350){ 
image(end1Img,0,0); } 
if(mousePressed){ 
gameState=GAME_RUN; 
xb1=640;
 xb2=0;
 fx=530;
 fy=200; 
ex=-60;
 xs[0] = -100;
 xs[1] = -100;
 xs[2] = -100;
 xs[3] = -100; 
xs[4] = -100; 
ey=floor(random(20,400));
 tx=floor(random(3,300));
 ty=floor(random(3,277)); 
hp=40; } 
for(i=0;i<20;i++){
x[i]=0; } 
break; }} 
void keyPressed() { 
if (key == CODED) { 
 switch (keyCode){
case UP: 
upPressed = true; 
break; 
case DOWN: 
downPressed = true; 
break;
case LEFT: 
leftPressed = true; 
break;
 case RIGHT: 
rightPressed =true;
 break; } } } 
void keyReleased() {
 if (key == CODED) {
 switch (keyCode) {
 case UP: 
upPressed = false; 
break;
 case DOWN:
 downPressed = false;
 break;
 case LEFT: 
leftPressed = false; 
break; 
case RIGHT: 
rightPressed = false; 
break; } } }
