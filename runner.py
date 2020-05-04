import os

pid = os.fork()
os.umask(0o177)

os.system('celery -A worker worker --loglevel=info')
