require 'machine_learning/version'
require 'machine_learning/example'
require 'machine_learning/classifier'
require 'machine_learning/classifiers/support_vector_machine'

module MachineLearning

	# Use cross validation to train the best classifier. Requires a single code block
	# that instantiates the classifier variable using the given training set.
	def cross_validate(dataset, split_size=4)
		splits = split_dataset(dataset, split_size)
		best_classifier = nil
		high_score = 0.0

		(0..(split_size - 1)).each do |i|
			training = []
			((i + 1)..(split_size)).each { |j| training += splits[j % split_size] }
			testing = splits[i]

			classifier = nil
			yield(classifier, training)
			accuracy = accuracy(classifier, testing)

			if accuracy > high_score
				high_score = accuracy
				best_classifier = classifier
			end
		end

		best_classifier
	end

	# Returns the accuracy of the given classifier and test set
  def accuracy(classifier, test_set)
  	correct = 0.0
  	test_set.each { |e| correct += 1.0 if e.label == classifier.guess_for(e) }
  	correct / test_set.size.to_f
  end

  # Splits the dataset provided into the number of splits requested for cross validation
  def split_dataset(dataset, number_of_splits=4)
  	dataset_split = []
	  per_split = dataset.size / number_of_splits
	  counter = 0
	  split_number = 0

	  dataset.each do |e|
	    dataset_split[split_number] = [] if dataset_split[split_number].nil?
	    dataset_split[split_number] << e

	      counter += 1

	      if counter % per_split == 0 && split_number < number_of_splits - 1
	        counter = 0
	        split_number += 1
	      end
	  end

	  dataset_split
  end
end
