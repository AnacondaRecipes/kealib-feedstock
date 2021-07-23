
# just load kealib using ctypes
import os
import sys
import ctypes

if sys.platform == 'win32':
    path = os.path.join(sys.prefix, 'Library', 'bin', 'libkea.dll')
    kealib = ctypes.CDLL(path)
elif sys.platform == 'darwin':
    path = os.path.expandvars('$PREFIX/lib/libkea.dylib')
    kealib = ctypes.CDLL(path)
elif sys.platform.startswith('linux'):
    path = os.path.expandvars('$PREFIX/lib/libkea.so')
    kealib = ctypes.CDLL(path)
else:
    raise Exception('Cannot recognize platform {!r}'.format(sys.platform))

