FROM python:3.10-slim-bullseye

RUN apt update
RUN apt install gcc git -y

RUN pip install --no-cache-dir cython
RUN pip install --no-cache-dir git+https://github.com/raidebeh/cryptofeed.git@4c0c6fff9e6b4c413489eb4cec22b0e69e725748
RUN pip install --no-cache-dir "redis>=4.2.0rc1"
RUN pip install --no-cache-dir pymongo[srv]
RUN pip install --no-cache-dir motor
RUN pip install --no-cache-dir asyncpg

COPY cryptostore.py /cryptostore.py

CMD ["/cryptostore.py"]
ENTRYPOINT ["python"]
