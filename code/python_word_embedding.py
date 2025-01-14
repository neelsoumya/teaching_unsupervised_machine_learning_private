# demonstrate word embedding
#  https://www.youtube.com/watch?v=wjZofJX0v4M
#	3blue1brown video
# pip install gensim


import gensim.downloader

model = gensim.downloader.load("glove-wiki-gigaword-50")

print(model["tower"])






