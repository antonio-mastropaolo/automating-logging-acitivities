import nltk
from bleu import *
import sys
from rouge_score import rouge_scorer
from nltk import word_tokenize
import numpy as np

def levenshtein_normalized(seq1, seq2):
    size_x = len(seq1) + 1
    size_y = len(seq2) + 1
    matrix = np.zeros ((size_x, size_y))
    for x in range(size_x):
        matrix [x, 0] = x
    for y in range(size_y):
        matrix [0, y] = y

    for x in range(1, size_x):
        for y in range(1, size_y):
            if seq1[x-1] == seq2[y-1]:
                matrix [x,y] = min(
                    matrix[x-1, y] + 1,
                    matrix[x-1, y-1],
                    matrix[x, y-1] + 1
                )
            else:
                matrix [x,y] = min(
                    matrix[x-1,y] + 1,
                    matrix[x-1,y-1] + 1,
                    matrix[x,y-1] + 1
                )
    return matrix[size_x - 1, size_y - 1]/max(size_x, size_y)

def meteor(prediction,reference):
	return (nltk.translate.meteor_score.meteor_score([prediction], reference, gamma=0))

def rouge(prediction,reference,scorer):
	rougeL = scorer.score(prediction,reference)
	precision,recall,fmeasure = rougeL['rougeL'].precision, rougeL['rougeL'].recall, rougeL['rougeL'].fmeasure
	return precision,recall,fmeasure

def main():

	scorer = rouge_scorer.RougeScorer(['rougeL'], use_stemmer=False)

	targets = []
	with open('data/quantitative-data/top5_reference.txt') as f:
		for item in f.readlines():
			current = ' '.join(word_tokenize(' '.join(item.rstrip('\n')[0:-1].split()).strip('"')))
			if len(current)==0:
				current = '""'
			targets.append(current)

	predictions = []
	with open('data/quantitative-data/top5_hypothesis.txt') as f:
		for item in f.readlines():
			current = ' '.join(word_tokenize(' '.join(item.rstrip('\n')[0:-1].split()).strip('"')))
			if len(current)==0:
				current = '""'
			predictions.append(current)

	meteor_score = 0.0
	sentence_bleu_4 = 0.0
	overallPrecision = 0.0
	overallRecall = 0.0
	overallFmeasure = 0.0
	levenshtein_score = 0.0
	for target,prediction in zip(targets,predictions):
		
		meteor_score += meteor(prediction, target)
		precision,recall,fmeasure = rouge(prediction,target,scorer)
		sentence_bleu_4 += score_sentence(prediction,target,4,1)[-1]
		levenshtein_score += levenshtein_normalized(prediction.split(), target.split())
		overallPrecision += precision
		overallRecall += recall
		overallFmeasure += fmeasure
		

	print("Meteor-Score: {}".format(meteor_score/len(predictions)))
	print("BLEU-4: {}".format(sentence_bleu_4/len(predictions)))
	print("Rouge-Precision: {}".format(overallPrecision/len(predictions)))
	print("Rouge-Recall: {}".format(overallRecall/len(predictions)))
	print("Rouge-Fmeasure: {}".format(overallFmeasure/len(predictions)))
	print("Levenshtein Normalized: {}".format(levenshtein_score/len(predictions)))

if __name__ == '__main__':
	main()

