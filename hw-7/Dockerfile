FROM python:3.10-slim
WORKDIR /app
RUN pip install --no-cache-dir pandas numpy
RUN mkdir output && chmod 777 output

RUN mkdir input

COPY generate_data.py .
COPY join_data.py .

RUN python generate_data.py
CMD ["python", "join_data.py"]