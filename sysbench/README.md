# sysbench tests

examples:

```bash
# run all
./all.sh 

# run cpu test with threads = hw.ncpu 
./cpu.sh

# run cpu test with 42 threads
./cpu.sh 42
```

Threads number can be passed to any script except [`all.sh`](./all.sh)