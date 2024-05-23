FROM python:3-slim
EXPOSE 5000:5000
ENV FLASK_APP=src/main.py


# Install pip requirements
# COPY requirements.txt .
# RUN python -m pip install -r requirements.txt

# This would be the prefered installing method but does not work with pip/docker currently.
COPY pyproject.toml .
RUN python -m pip install .


WORKDIR /src
COPY . /src
CMD ["python" "-X", "dev", "src/main.py"]
