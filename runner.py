import os

pid = os.fork()
os.umask(0o177) ## Fails
#os.umask(0o477) ## works
os.system('celery -A worker worker --loglevel=info')
