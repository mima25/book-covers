# set base image
FROM python:3.10-slim

# set the working directory in the container
WORKDIR /src

# define environment variableto avoid python printing issues in docker containers

ENV PYTHONONBUFFERED=1

# copy the dependencies file to the working directory

COPY src/requirements.txt .

# install dependencies
RUN python -m pip install --upgrade pip
RUN pip install -U pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# copy the content of the local src directory to the working directory

COPY src/ .

# command to run on container start
CMD [ "python" ]