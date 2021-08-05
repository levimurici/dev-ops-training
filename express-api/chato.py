import requests
import time
from datetime import datetime

while 1:
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    print((requests.post('http://127.0.0.1:3000/post', json={"msg: ": "Chato pra baralho", "time: ": current_time}).json()))
    time.sleep(1)