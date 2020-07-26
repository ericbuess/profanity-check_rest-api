# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8.3-slim-buster
#FROM python:3.8.3-buster
#FROM python:3.8
#FROM continuumio/anaconda3
#FROM nvcr.io/nvidia/l4t-ml:r32.4.2-py3
#FROM r32.4.2-py3
#FROM 0b67798283fa
# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE 1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED 1
#ENV PATH="/opt/conda/:$PATH"

#RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

#RUN conda install -c poppy-project bottle 
#RUN conda install youtube_transcript_api
#RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential
#RUN apt-get -y install pyqt4-dev-tools
#RUN /opt/conda/conda install scikit-learn
# Install pip requirements
#RUN python --version
#RUN which python
#RUN python3 --version
#RUN which python3
#RUN python -m pip --version
#RUN which pip
#RUN python -m pip3 --version
#RUN apt-get install -y --no-install-recommends apt-utils
#RUN which pip3

RUN apt-get update
RUN apt-get -y upgrade

#RUN apt-get install -y git
#RUN git clone git://github.com/scikit-learn/scikit-learn.git  # add --depth 1 if your connection is slow
#RUN cd scikit-learn

##RUN apt-get -y install build-essential python3-dev python3-pip
##RUN apt-get -y install cython3 python3-numpy python3-scipy
#RUN apt-get -y install python-numpy python-scipy python-joblib
#RUN pip install numpy
#RUN pip install joblib
#RUN pip install threadpoolctl
#RUN apt-get -y install python-scipy
#RUN pip install scipy


#RUN pip3 install --verbose --no-build-isolation --editable . RUN python -c "import sklearn; 
#sklearn.show_versions()"
##RUN apt-get -y install python3-sklearn python3-sklearn-lib
#RUN pip install scikit-learn
##RUN pip3 install --editable .
#RUN pip3 install --verbose .
#https://scikit-learn.org/0.19/developers/advanced_installation.html#install-by-distribution
#RUN apt-get -y install build-essential python3-dev python3-setuptools python3-numpy python3-scipy libatlas-dev libatlas3gf-base
#RUN apt-get -y install build-essential python3-dev python3-setuptools python3-numpy python3-scipy libatlas-base-dev libatlas3gf-base
##RUN apt-get -y install build-essential python3-dev python3-setuptools python3-numpy python3-scipy libatlas-base-dev

### ISSUE: to get profanity-check working it needs to be installed via pip. Pip installed modules
### aren't seeing modules installed with apt-get. Some modules needed to run scipy have to be installed with apt-get. Scikit needs scipy. So we need a way to make pip find modules installed with apt-get.
### The --no-index and --find-links ../.. tags for pip may help. Find links can be pointed to the
### download file or the extracted path. And it can work inside requirements.txt. Next step is to run
### all the installs through pip that we can, then use apt-get for the others. For all the apt-get ones
### reinstall them with pip by doing a pip install and pointing each to the location where apt-get
### downloaded the compressed file or extracted it (where setup.py can be found). Then try installing
### profanity-check.
### https://stackoverflow.com/questions/50249629/how-to-let-pip-search-dependency-packages-in-local-directory?noredirect=1&lq=1

#ENV PATH="/usr/bin:$PATH"

#RUN apt-get -y install build-essential
#RUN apt-get -y install libatlas-base-dev
#RUN apt-get -y install python3-dev
#RUN apt-get -y install python3-setuptools
#RUN apt-get -y install python3-numpy
#RUN apt-get -y install python3-scipy
#RUN apt-get -y install python3-sklearn python3-sklearn-lib
##RUN apt-get -y install python3-sklearn python3-sklearn-lib

#ENV VIRTUAL_ENV=/opt/venv
#RUN python3 -m venv $VIRTUAL_ENV
#ENV PATH="$VIRTUAL_ENV/bin:/usr/bin:$PATH"


#RUN python -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose
#RUN python -m pip install --user numpy scipy scikit-learn
##RUN python -m pip install --user --no-index --find-links /usr/bin scikit-learn
##RUN python -m pip install --user --no-index --find-links /usr/bin profanity-check

#RUN apt-get -y install build-essential python3-dev python3-setuptools python3-numpy python3-scipy libatlas3gf-base
#RUN apt-get -y install build-essential python3-dev python3-setuptools python3-numpy python3-scipy
#RUN apt-get -y install python-matplotlib
#RUN update-alternatives --set libblas.so.3 /usr/lib/atlas-base/atlas/libblas.so.3
#RUN update-alternatives --set liblapack.so.3 /usr/lib/atlas-base/atlas/liblapack.so.3
#RUN pip install cython

#RUN pip install -U scikit-learn[alldeps]
#RUN python3 -m pip install scikit-learn
#RUN apt-get -y install python-sklearn

# Install dependencies:
#COPY requirements.txt .
#RUN pip install -r requirements.txt

# Run the application:
#COPY app.py .
#CMD ["python", "app.py"]

ADD requirements.txt .
RUN pip install -r requirements.txt


#ls /usr/lib/lib*
#/usr/lib/libident.so.0     /usr/lib/libsigc-1.2.so.5      /usr/lib/libsupp.a
#/usr/lib/libident.so.0.22  /usr/lib/libsigc-1.2.so.5.0.7

#RUN update-alternatives --install /usr/lib/libblas.so.3 libblas.so.3 \                                                                                                                                                  
#        /usr/lib/openblas-base/libblas.so.3 40 \                                                                                                                                                                    
#    --slave /usr/lib/libblas.so.3gf libblas.so.3gf /usr/lib/openblas-base/libblas.so.3
#RUN update-alternatives --install /usr/lib/liblapack.so.3 liblapack.so.3 \                                                                                                                                              
#        /usr/lib/openblas-base/liblapack.so.3 40 \                                                                                                                                                                  
#    --slave /usr/lib/liblapack.so.3gf liblapack.so.3gf /usr/lib/openblas-base/liblapack.so.3 
##RUN pip install --user --install-option="--prefix=" -U scikit-learn
#RUN pip install --user --install-option="--prefix=" -U scikit-learn
#RUN pip install -U scikit-learn
#RUN pip install -U scikit-learn
##RUN python -m pip install -r requirements.txt

#RUN python -m pip install better_profanity

# set the working directory in the container to /app
WORKDIR /app

# add the current directory to the container as /app
#ADD . /app

# Run bottle on port 8080
EXPOSE  8080

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "app.py"]
#CMD ["echo","Hello World"]
