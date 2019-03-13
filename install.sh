# Install gcsfuse
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Install cuda-related packages
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt update
sudo apt upgrade -y
sudo apt install build-essential bzip2 tmux htop default-jdk zsh nvidia-410 gcsfuse -y

# Install miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3.sh
cd ~

bash ~/miniconda3.sh -b -p $HOME/miniconda3
echo ". $HOME/miniconda3/etc/profile.d/conda.sh" >> ~/.zshrc
export PATH="$HOME/miniconda3/bin:$PATH"
. $HOME/miniconda3/etc/profile.d/conda.sh

# Create a new environment called sci with useful packages
conda update -n base -c defaults conda -y

conda config --add channels conda-forge
conda config --add channels pytorch
conda create --name tensorflow python=3.6.8 pip tensorflow -y

rm ~/miniconda3.sh
sudo reboot now
