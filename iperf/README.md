# iperf tests

usage:

```bash
# start a server (multiple variants)
./server.sh
PORT="1234"./server.sh
ADDRESS="10.0.0.1" ./server.sh
PORT="1234" ADDRESS="10.0.0.1" ./server.sh

# connect as a client & run benchmark (multiple variants) 
./client-all.sh 10.0.0.1
./client-all.sh 10.0.0.1 1234
```
