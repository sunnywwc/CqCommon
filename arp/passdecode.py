#-*- coding:utf8 -*-

import os
import sys
import base64


dict_code = {
'\xa1\x83': '1', 
'\xa2\x83': '2', 
'\xa3\x83': '3',
'\xa4\x83': '4', 
'\xa5\x83': '5', 
'\xa6\x83': '6',
'\xa7\x83': '7', 
'\xa8\x83': '8', 
'\xa9\x83': '9',
'\xa0\x83': '0', 
'\xa1\x86': 'a', 
'\xa2\x86': 'b',
'\xa3\x86': 'c', 
'\xa4\x86': 'd', 
'\xa5\x86': 'e',
'\xa6\x86': 'f', 
'\xa7\x86': 'g', 
'\xa8\x86': 'h',
'\xa9\x86': 'i', 
'\xaa\x86': 'j', 
'\xab\x86': 'k',
'\xac\x86': 'l', 
'\xad\x86': 'm',
'\xae\x86': 'n', 
'\xaf\x86': 'o', 
'\xa0\x87': 'p', 
'\xa1\x87': 'q', 
'\xa2\x87': 'r',
'\xa3\x87': 's', 
'\xa4\x87': 't', 
'\xa5\x87': 'u',
'\xa6\x87': 'v', 
'\xa7\x87': 'w',
'\xa8\x87': 'x', 
'\xa9\x87': 'y', 
'\xaa\x87': 'z'
}

global password


def CqDecode(value):
    password = "password is "
    n = value.find('%3D')
    if n <> -1:
        value = value[0:n]
    if len(value) % 4 != 0:
        while len(value) % 4 != 0:
            value = value + "="
        req = base64.b64decode(value)
    else:
        req = base64.b64decode(value)

    length = len(req)
    for n in range(0,length/2):
        c = n*2 
        a = req[0+c:2+c]
        v = dict_code[a]
        password += v
    print password


if __name__ == '__main__':

    CqDecode('oYOig6ODpIOlg6aD')
    s = 'wangweichen'
    a = base64.b64encode(s)
    strg1 = 'oYOig6ODo4Ojgw='    
    strg = 'p4ehhq6Gp4anh6WGqYajhqiGpYauhg=='
    value = strg
    if len(value) % 4 != 0:
        while len(value) % 4 != 0:
            value = value + "="
        req = base64.b64decode(value)
    else:
        req = base64.b64decode(value)

    length = len(req)
    for n in range(0,length/2):
        c = n*2 
        a = req[0+c:2+c]
        v = dict_code[a]
        password += v
    print password
    