import os
import aioredis
import json

redis_host = os.environ.get('REDIS_SERVICE_SERVICE_HOST', 'localhost')
redis_port = os.environ.get('REDIS_SERVICE_SERVICE_PORT', '6379')


def get_redis_url():
    # if os.path.exists('/vault/secrets/database-redis.json'):
    #     secret = open('/vault/secrets/database-redis.json')
    #     secret_data = secret.read()
    #     print('\n\n\nredis secret::: ' + secret_data)

    #     data = json.loads(secret_data)
    #     redis_url = 'redis://' +':' + data['password'] + '@' + redis_host + ':' + redis_port
    #     secret.close()
    #     return redis_url
    # else:
    #     redis_url = 'redis://' + redis_host + ':' + redis_port
    #     return redis_url
    # return 'rediss://:0000@000.upstash.io:00000'
    return 'redis://' + redis_host + ':' + redis_port


def get_redis():
    redis = aioredis.from_url(get_redis_url())
    return redis
