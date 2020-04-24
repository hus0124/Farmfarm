#include <SPI.h>
#include <Ethernet.h>
#include <TextFinder.h>
#include <SimpleTimer.h>
#include <SimpleDHT.h>

//Ethernet info 
byte mac[] = {
  0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED
};
IPAddress ip(192, 168, 33, 3);
EthernetServer server(80);
EthernetClient clientW;
char serverW[] = "iotmit.iptime.org";

//Sensor info
SimpleTimer timer;
SimpleDHT11 dht11(8); //dht11 digital no.8 pin

#define waterLED 9 // watertank led
#define RLED 2 //Remember RGB LED High is off, Low is on!!!
#define GLED 3
#define BLED 4
#define pump 5 // waterpump
#define lightSensor 0 // lightSensor analog no.0 pin
#define groundSensor 1 // groundSensor analog no.1 pin
#define waterSensor 2 // waterSensor analog no.2 pin
int lightValue = 0;
int groundValue = 0;
int waterLevel = 0;
int pumpValue = 100;

void setup() {
 
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  Serial.println("Ethernet WebServer Example");
  Ethernet.begin(mac, ip);
  
  // Check for Ethernet hardware present
  if (Ethernet.hardwareStatus() == EthernetNoHardware) {
    Serial.println("Ethernet shield was not found.  Sorry, can't run without hardware. :(");
    while (true) {
      delay(1); // do nothing, no point running without Ethernet hardware
    }
  }
  if (Ethernet.linkStatus() == LinkOFF) {
    Serial.println("Ethernet cable is not connected.");
  }

  // start the server
  server.begin();
  Serial.print("server is at ");
  Serial.println(Ethernet.localIP());

  //timer setting
  timer.setInterval(30000, farmSensor); // farmSensor timer  10seconds

  //sensor setting
  pinMode(waterLED, OUTPUT);
  digitalWrite(waterLED, LOW);
  pinMode(RLED, OUTPUT);
  digitalWrite(RLED, HIGH);
  pinMode(BLED, OUTPUT);
  digitalWrite(BLED, HIGH);
  pinMode(GLED, OUTPUT);
  digitalWrite(GLED, HIGH);
  pinMode(pump, OUTPUT);
  digitalWrite(pump, LOW);
}

//loop works for webcontroll

void loop() {
  timer.run();
  // listen for incoming clients
  EthernetClient client = server.available();
  if (client) {
    Serial.println("new client");
    TextFinder  finder(client); 
        
    while (client.connected()) {
      if (client.available()) {
       
        if(finder.find("GET /")){
          while(finder.findUntil("LED", "\n\r")){ // if linux maybe "\n"
            //char c = client.read();
            int val = finder.getValue();
              
            switch(val){ // 1=pump on, 2=pump off, 3=RGB on, 4=RGB off
              case 1:
                digitalWrite(pump, HIGH);
                //delay(5000);
               // digitalWrite(pump, LOW);
                break;
              case 2:
                digitalWrite(pump, LOW); 
                break;
              case 3:
                digitalWrite(RLED, LOW); 
                digitalWrite(GLED, LOW);
                digitalWrite(BLED, LOW);
                break;
              case 4:
                digitalWrite(RLED, HIGH);
                digitalWrite(GLED, HIGH);
                digitalWrite(BLED, HIGH);
                break;  
             }

             Serial.print("Controll mode : ");
             Serial.println(val);
                           
           }
         }             
                       
      // send a standard http response header
       client.println("HTTP/1.1 200 OK");
       client.println("Content-Type: text/html");
       client.println("Connection: close");  // the connection will be closed after completion of the response
      //client.println("Refresh: 5");  // refresh the page automatically every 5 sec
       client.println();
       client.println("1234");
       break; 
     }            
    }
    // give the web browser time to receive the data
    delay(1);
    // close the connection:
    client.stop();
    Serial.println("client disconnected");
  }
    
}
   
void farmSensor() {
  
// DHT11 Temp sensor. It needs sampling time, so it's first.
  String Temp = (String)tempMethod();
  
// lightSensor
  lightValue = analogRead(lightSensor);
  lightWork(lightValue);    
  Serial.print("lightValue : ");
  Serial.println(lightValue);
  String Light = (String)lightValue;
  
// groundSensor
  pumpValue = groundWork(); // groundValue = pumpValue is controll point of waterPump
  String Ground = (String)pumpValue;

// waterSensor
  String Water = (String)waterTank();
    
//DB sending as client
  if (clientW.connect(serverW, 3180)){
    Serial.print("connected to ");
    Serial.println(clientW.remoteIP());
    // Make a HTTP request:
    clientW.println("GET /test/dht11db?Temp="+Temp+"&Ground="+Ground+"&Water="+Water+"&Light="+Light+" HTTP/1.1");
    clientW.println("Host: 192.168.3.17");
    clientW.println("Connection: close");
    clientW.println();
  }
  if (!clientW.connect(serverW, 8090)){
    clientW.stop();
  }
  delay(1);

// waterpump working
  if(pumpValue < 5){
    digitalWrite(pump, HIGH);
    delay(8000); // 8 seconds working
    digitalWrite(pump, LOW);
    delay(10);
  }
}

void lightWork(int lightValue){
  if (lightValue > 300) {   
    digitalWrite(BLED, LOW);
    digitalWrite(GLED, LOW);
    digitalWrite(RLED, LOW);
  }
  if (lightValue <= 300) {   
    digitalWrite(BLED, HIGH);
    digitalWrite(GLED, HIGH);
    digitalWrite(RLED, HIGH);    
  }
}

int groundWork(){
  groundValue = analogRead(groundSensor);
  Serial.println("───────────────────────── ");   
   // 습도 값에 따라 출력 처리 다르게 해줌
  if ( groundValue <= 300) {    
    Serial.println("  [ 습함 ! ]");        
  }  if (groundValue > 300 && groundValue <= 380) {
    Serial.println("  [ Good! ]");    
  }  else if ( groundValue > 380){
    Serial.println("  [ 건조함 ]");    
  }  
  
  Serial.print("  Sensor Value= ");
  Serial.println(groundValue);  // 0(습함) ~ 1023(건조)값 출력 
  groundValue = map(groundValue,1023,0,0,100);  // 센서에서 읽어들인 값(최대치 : 1023, 최소치 : 0, 퍼센트값(0~100)으로 매핑
  Serial.print("  습도 : ");  
  Serial.print(groundValue);  
  Serial.println("%");  
  Serial.println("───────────────────────── ");
  Serial.println();
  return groundValue;
}

int tempMethod(){
  // start working...
  Serial.println("=================================");
  Serial.println("Sample DHT11...");
  
  // read without samples.
  byte temperature = 0;
  byte humidity = 0;
  int err = SimpleDHTErrSuccess;
  if ((err = dht11.read(&temperature, &humidity, NULL)) != SimpleDHTErrSuccess) {
    Serial.print("Read DHT11 failed, err="); Serial.println(err);delay(1000);
    return;
  }
  
  Serial.print("Sample OK: ");
  Serial.print((int)temperature); Serial.print(" *C, "); 
  Serial.print((int)humidity); Serial.println(" H");
  
  // DHT11 sampling rate is 1HZ.
  delay(1000);
  return (int)temperature;
}

int waterTank(){
  waterLevel = analogRead(waterSensor);
  Serial.print("water Level : ");
  Serial.println(waterLevel);
  
  if(waterLevel < 50){
    digitalWrite(waterLED, HIGH);
  }
  else {
    digitalWrite(waterLED, LOW);
  }
  return waterLevel;
}
