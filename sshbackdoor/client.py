import paramiko
import threading
import subprocess

class CqSSHClient:
    def CqConnectSSH(self):
        client = paramiko.SSHClient()
        client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        client.connect('192.168.0.110', 2332, username='root', password='lovepython')
        chan = client.get_transport().open_session()
        chan.send('Hey i am connected :) ')
        while True:
            #command = chan.recv(1024)
            try:
                command= raw_input("Enter command: ").strip('n')
                #command = 'cd ..'
                if command != '':
                    chan.send(command)
                    print chan.recv(1024)
                
                #CMD = subprocess.check_output(command, shell=True)
                #chan.send(CMD)
            except Exception,e:
                chan.send(str(e))
        print chan.recv(1024)
        client.close
if __name__ == '__main__':
    cq = CqSSHClient()
    cq.CqConnectSSH()
