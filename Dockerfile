# ultise docker created docker file
FROM python:3.9.17

# initalise working directory
WORKDIR /usr/src/app

# copy dependencies required
COPY flask_application/requirements.txt ./

# install whatever necessary for the OS
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get -y install curl
RUN apt-get install libgomp1
RUN apt-get -y install gcc
RUN apt-get install python3-setuptools -y
RUN apt-get install cmake -y

# install depedencies required for flask application
RUN pip3 install -r requirements.txt

# bundle application source
COPY . .

# port exposure
EXPOSE 8080

# command to run the flask application
CMD ["python","flask_application/app.py"]