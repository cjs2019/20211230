# create conda virtual environment
conda create -y --force -n ag python=3.8

# activate virtual environment
conda activate ag

# install packages(mxnet, autogluon, kaggle)
pip install "mxnet<2.0.0"
pip install autogluon
pip install kaggle

# set configuration for kaggle and download datas
# manually download kaggle.json and move it to ~/.kaggle/
        # cd ****
        # mv kaggle.json ~/.kaggle/
kaggle c download titanic
unzip -o titanic.zip

# train
python run.py

kaggle competitions submit -c titanic -f submission.csv -m "AutoML"
