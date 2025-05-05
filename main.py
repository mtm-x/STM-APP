from PySide6.QtCore import QObject, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
import src.rc_res
import sys
from pathlib import Path
import paramiko
import time

RASPBERRY_PI_IP = "192.168.213.22"  # Replace with your Raspberry Pi's IP address
USERNAME = "rasukutty"              # Replace with your Raspberry Pi's username
PASSWORD = "mjt" 

ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(RASPBERRY_PI_IP, username=USERNAME, password=PASSWORD)

RUNNING_SCRIPT = "testing.py"
SCRIPT_TO_RUN = "/home/rasukutty/Downloads/STM/scripts/green.py"
RUNNIG = "/home/rasukutty/Downloads/STM/scripts/testing.py"
SCRIPT = "green.py"

class Controller(QObject):
    def __init__(self):
        super().__init__()

    @Slot(result=str)
    def change_green(self):
        stdin, stdout, stderr = ssh.exec_command(f"pgrep -f {RUNNING_SCRIPT}")
        pid = stdout.read().decode().strip()
        if pid:
            # Send a SIGTERM signal to the process to stop it
                ssh.exec_command(f"kill -TERM {pid}")
                print("success", pid)
                
        try:
            print("executing.......")
            command1 = f"python {SCRIPT_TO_RUN}"
            stdin, stdout, stderr = ssh.exec_command(command1) 
            print(stdout)
            print(stderr)
            time.sleep(10)
            stdin, stdout, stderr = ssh.exec_command(f"pgrep -f {SCRIPT}")
            pid = stdout.read().decode().strip()
            if pid:
                # Send a SIGTERM signal to the process to stop it
                    ssh.exec_command(f"kill -TERM {pid}")
                    print("success", pid)

            command2 = f"python {RUNNIG}"
            stdin, stdout, stderr = ssh.exec_command(command2) 
        except Exception as e:
            print(e)
        return "green"
    @Slot(result = str)
    def stop(self):
        stdin, stdout, stderr = ssh.exec_command(f"pgrep -f {RUNNING_SCRIPT}")
        pid = stdout.read().decode().strip()
        if pid:
            # Send a SIGTERM signal to the process to stop it
                ssh.exec_command(f"kill -TERM {pid}")
                print("success", pid)
        return "stopped"

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    controller = Controller()
    engine.rootContext().setContextProperty("controller", controller)

    qml_file = Path(__file__).resolve().parent / "qml/Main.qml"
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
