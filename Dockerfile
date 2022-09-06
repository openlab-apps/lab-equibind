FROM python:3.8-slim 

# installing packages required for installation
RUN echo "downloading basic packages for installation"
RUN apt-get update
RUN apt-get install -y tmux wget curl nano less

WORKDIR /home/

COPY requirements_docker.txt ./

RUN pip install --no-cache-dir -r requirements_docker.txt

COPY . .

#CMD ["bash"]
# run a test
RUN ./run.sh 2pri.pdb test.sdf
CMD ["bash"]
