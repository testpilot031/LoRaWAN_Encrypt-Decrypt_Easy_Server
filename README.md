# Read Me

## abstract
This is LoRaWAN Encrypt Decrypt Easy Server.
if you want to use, Docker is need.
I only made a API for the web with some plugins or framework which are already made by another. 
Its are falcon and python-lora.
python-lora is here.
https://github.com/jieter/python-lora

## How to make and run Server
  ` $ cd <your download dir>`
  
  ` $ docker build -t lorawan_enc-dec .` 
  
  ` $ docker run -d -p 80:80 lorawan_enc-dec` 

## Usage
http://<your ip address>?payload=11111111&fCnt=1&key=2B7E151628AED2A6ABF7158809CF4F3C&dev_addr=0000009B

payload, key, dev_addr => hex
fCnt => 10　Decimal number


This is Easy Server...
