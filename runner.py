import os
import sys
from pwd import getpwnam
from grp import getgrnam
from fabric.api import local
pid = os.fork()
os.chdir("/")
os.setsid()
os.setgid(getgrnam('moshe').gr_gid)
os.setuid(getpwnam('moshe').pw_uid)
os.umask(0o177)
local("python /opt/test_billiard.py")