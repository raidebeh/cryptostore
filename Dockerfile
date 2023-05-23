FROM python:3.10-slim-bullseye

RUN apt update
RUN apt install gcc git -y

RUN pip install --no-cache-dir cython
RUN pip install --no-cache-dir git+https://github.com/raidebeh/cryptofeed.git@a648993cacd16cdf354bd0b72ba69c6170501e50
RUN pip install --no-cache-dir "redis>=4.2.0rc1"
RUN pip install --no-cache-dir pymongo[srv]
RUN pip install --no-cache-dir motor
RUN pip install --no-cache-dir asyncpg

COPY cryptostore.py /cryptostore.py

CMD ["/cryptostore.py"]
ENTRYPOINT ["python"]
