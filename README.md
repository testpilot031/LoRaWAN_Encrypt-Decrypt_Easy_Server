# Read Me

## abstract
This is LoRaWAN Encrypt Decrypt Easy Server.
if you want to use, Docker is need.
I only made a API for the web with some plugins or framework which are already made by another. 
Its are falcon and python-lora.
python-lora is here.
https://github.com/jieter/python-lora

## How to make and run Server
Download all file at `<your dir>`.
  
  ` $ cd _YOUR_DIR_`
  
  ` $ docker build -t lorawan_enc-dec .` 
  
  ` $ docker run -d -p 80:80 lorawan_enc-dec` 

## Usage
$ curl -H 'Content-Type: application/x-www-form-urlencoded' -X GET '__YOUR_URI__/?payload=741a3504&fcnt=1&key=2B7E151628AED2A6ABF7158809CF4F3C&dev_addr=01334E9B&direction=UP'

Now, GET only...

- payload, key, dev_addr => hex

- fCnt => 10　Decimal number

- direction => UP or DOWN

'UP' is uplink

This is Easy Server...

## To Do (pending...) 

- also 'POST'

- function check Parameter 
