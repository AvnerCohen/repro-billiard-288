from celery import Celery

app = Celery('test_celery',broker= 'memory')
