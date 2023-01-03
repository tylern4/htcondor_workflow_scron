import numpy as np
import cupy as cp
from timeit import default_timer as timer
from numba import vectorize

@vectorize(['float32(float32, float32)'], target='cuda')
def power(a, b):
    return a ** b

vec_size = 100000000
a = b = np.array(np.random.sample(vec_size), dtype=np.float32)
c = np.zeros(vec_size, dtype=np.float32)
start = timer()
c = power(a, b)
duration = timer() - start
print(duration)

x = y = cp.array(cp.random.sample(vec_size), dtype=cp.float32)
z = cp.zeros(vec_size, dtype=cp.float32)

start = timer()
z = x**2 + y**2
duration = timer() - start
print(duration)
