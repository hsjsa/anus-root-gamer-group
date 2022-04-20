FROM anasty17/mltb:latest
# FROM anasty17/mltb-oracle:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt-get update
RUN apt-get upgrade -y
RUN apt install wget curl -y
RUN wget ${{secrets.CONFIG_FILE_URL}}

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

CMD ["bash", "start.sh"]
