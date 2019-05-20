mkdir software
cd software

# BASIC STUFF
sudo apt-get update
sudo apt-get install -y build-essential

# JAVA
sudo apt-get install -y default-jre

# DEPENDENCIES FOR SAMTOOLS
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y libncurses5-dev 
sudo apt-get install -y libbz2-dev
sudo apt-get install -y liblzma-dev

# SRA TOOLKIT
wget https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz
tar -xvzf sratoolkit.current-ubuntu64.tar.gz
rm sratoolkit.current-ubuntu64.tar.gz

# FASTQC
wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip
unzip fastqc_v0.11.8.zip 
rm fastqc_v0.11.8.zip
cd FastQC
chmod 755 fastqc
cd ..

# TRIMMMOMATIC
wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip
unzip Trimmomatic-0.39.zip
rm Trimmomatic-0.39.zip

# BOWTIE2
wget https://netcologne.dl.sourceforge.net/project/bowtie-bio/bowtie2/2.3.5.1/bowtie2-2.3.5.1-linux-x86_64.zip
unzip bowtie2-2.3.5.1-linux-x86_64.zip
rm bowtie2-2.3.5.1-linux-x86_64.zip

# PICARD TOOLS
wget https://github.com/broadinstitute/picard/releases/download/2.20.1/picard.jar

# SAMTOOLS
wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
tar -vxjf samtools-1.9.tar.bz2
rm samtools-1.9.tar.bz2
cd samtools-1.9
make
cd ..

# PYTHON 2
wget https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh
bash Miniconda2-latest-Linux-x86_64.sh -b -p ./python2
rm Miniconda2-latest-Linux-x86_64.sh

# NUMPY and MACS: Python2 packages
./python2/bin/pip install numpy
./python2/bin/pip install macs2

# DEEPTOOLS
./python2/bin/conda install -c bioconda deeptools

# IGV
wget http://data.broadinstitute.org/igv/projects/downloads/2.5/IGV_Linux_2.5.2.zip
unzip IGV_Linux_2.5.2.zip
rm IGV_Linux_2.5.2.zip

# MEME
wget http://meme-suite.org/meme-software/5.0.5/meme-5.0.5.tar.gz
tar -zxvf meme-5.0.5.tar.gz
rm meme-5.0.5.tar.gz
cd meme-5.0.5
mkdir memebin
curdir=`pwd`
parentdir="$(dirname "$curdir")"
./configure --prefix=$curdir/memebin --with-url=http://meme-suite.org/ --enable-build-libxml2 --enable-build-libxslt --with-python=$parentdir/python2/bin/python
make
make install

# BEDTOOLS
wget https://github.com/arq5x/bedtools2/releases/download/v2.28.0/bedtools-2.28.0.tar.gz
tar -zxvf bedtools-2.28.0.tar.gz
rm bedtools-2.28.0.tar.gz
cd bedtools2
make

