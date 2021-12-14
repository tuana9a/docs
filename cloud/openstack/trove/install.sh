# install python
sudo apt-get install python3.8 python3.8-dev python3.8-distutils python3.8-venv
sudo apt-get install build-essential libxslt1-dev qemu-utils mysql-client git python-dev python-pexpect python-mysqldb libmysqlclient-dev

# create venv
pip install virtualenv --user
virtualenv --system-site-packages env
source env/bin/activate

# install package
pip install -r requirements.txt -r test-requirements.txt
pip install python-cinderclient==7.4.0

# install editable local
PBR_VERSION=1.0 pip install -e .
PBR_VERSION=1.0 python setup.py develop