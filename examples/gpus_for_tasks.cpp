// gpus_for_tasks.cpp
#include <iostream>
#include <stdlib.h>
#include <unistd.h>
#include <string>
#include <cuda_runtime.h>

int main(int argc, char **argv) {
  int deviceCount = 0;

  cudaGetDeviceCount(&deviceCount);

  char hostname[1024];
  gethostname(hostname, 1024);
  printf("host %s: I see %d GPU(s).\n", hostname, deviceCount);

  int dev, len = 15;
  char gpu_id[15];
  cudaDeviceProp deviceProp;

  for (dev = 0; dev < deviceCount; ++dev) {
    cudaSetDevice(dev);
    cudaGetDeviceProperties(&deviceProp, dev);
    cudaDeviceGetPCIBusId(gpu_id, len, dev);
    printf("## %d: %s %s\n", dev, gpu_id, hostname);
  }


  return 0;
}
