import socket
import paramiko
import threading
import sys
import subprocess
#D:\\pyhacker\\chapter2\\


class Server (paramiko.ServerInterface):
   def _init_(self):
       self.event = threading.Event()
   def check_channel_request(self, kind, chanid):
       if kind == 'session':
           return paramiko.OPEN_SUCCEEDED
       return paramiko.OPEN_FAILED_ADMINISTRATIVELY_PROHIBITED
   def check_auth_password(self, username, password):
       if (username == 'root') and (password == 'lovepython'):
           return paramiko.AUTH_SUCCESSFUL
       return paramiko.AUTH_FAILED

class CqSSHServer:
    def _init_(self):
        self.server = "192.168.0.110"
        self.ssh_port = int("22")
        self.host_key = paramiko.RSAKey(filename='/Users/wen/RSAkey/test_rsa.key')
    def CqCreateServer(self):
        try:
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
            sock.bind(('192.168.0.110', 2332))
            sock.listen(100)
            print '[+] Listening for connection ...'
            client, addr = sock.accept()
        except Exception, e:
            print '[-] Listen/bind/accept failed: ' + str(e)
            sys.exit(1)
        print '[+] Got a connection!'

        try:
            t = paramiko.Transport(client)
            print '[+] paramiko.Transport done!'
            try:
                t.load_server_moduli()
                print '[+] load_server_moduli done!'
            except:
                print '[-] (Failed to load moduli -- gex will be unsupported.)'
                raise
            t.add_server_key(self.host_key)
            print '[+] add_server_key done!'
            server = Server()
            server._init_()
            print '[+] Server done!'
            try:
                t.start_server(server=server)
                print '[+] start_server done!'
            except paramiko.SSHException, x:
                print '[-] SSH negotiation failed.'

            chan = t.accept(20)
            print '[+] Authenticated!'
            print chan.recv(1024)
            while True:
                command = chan.recv(1024)
                CMD = subprocess.check_output(command, shell=True)
                if CMD == '':
                    CMD = 'not find'
                chan.send(CMD)
                #command= raw_input("Enter command: ").strip('n')
                #chan.send(command)
                print 'command ' + command

        except Exception, e:
            print '[-] Caught exception: ' + str(e) + ': ' + str(e)
            try:
                t.close()
            except:
                pass
            sys.exit(1)
if __name__ == '__main__':
    cq = CqSSHServer()
    cq._init_()
    cq.CqCreateServer()            