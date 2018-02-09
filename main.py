#!/home/kaisen/decryptLorawan/env/bin/python3
# coding: utf-8
import json
import falcon
import re
from lora.crypto import loramac_decrypt
class Extends():
    def before_resource(req, resp, resource, param):
        print('Content-type: application/json\n')
        print('Cache-Control: private\n')
@falcon.before(Extends.before_resource)
class DecryptAndEncryptData(object):
    def on_get(self,req,resp):
        try:
            payload = str(req.get_param('payload'))
            #print('Content-type: application/json\n')
            #print('Cache-Control: private\n')
            fcnt = int(req.get_param('fcnt'),10)
            key = str(req.get_param('key'))
            dev_addr = str(req.get_param('dev_addr'))
            direction = str(req.get_param('direction'))
            intDir = 0
            if direction == "UP":
                intDir = 0
            elif direction == "DOWN":
                intDir = 1
            resp.body = json.dumps(loramac_decrypt(payload, fcnt, key, dev_addr, intDir))
        except Exception as e:
            print ('=== error ===')
            print ('type:' + str(type(e)))
            print ('args:' + str(e.args))
            print ('message:' + e.message)
    def on_post(self, req, resp):
        body = req.stream.read()
        body = body.decode("utf-8")
        # data = json.dumps(body)
        data = json.loads(body)
        intDir = 0
        if data['direction'] == "UP":
            intDir = 0
        elif data['direction'] == "DOWN":
            intDir = 1
        resp.body = json.dumps(loramac_decrypt(str(data['payload']), int(data['fcnt'], 10), str(data['key']), str(data['dev_adder']), intDir))

class TypeUtil():
    def ishex(string):
        pattern = '^[0-9A-Fa-f]+$'
        reply = ''
        if not str(re.match(pattern, string)) == 'None':
            reply = 'true'
        else:
            reply = 'false'
        return reply
    def convHexToBd(hexdata):
        print(hexdata)
        if not self.ishex(hexdata) :
            return 'not hex'
        bddata = ""
        for char in hexdata:
            bddata += format(int(char, 16), '04b')
        return bddata
#class TypeCheck():
#   def isint(obj):

#   def




application = falcon.API()
application.add_route("/",DecryptAndEncryptData())
application.add_route("/decrypt/",DecryptAndEncryptData())
application.add_route("/encrypt/",DecryptAndEncryptData())
