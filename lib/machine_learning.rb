Dir['machine_learning/*.rb'].each { |f| require f }
# require 'machine_learning/version'

module MachineLearning

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
