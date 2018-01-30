module MachineLearning

	# A generic classifier. All classifiers must extend this class.
	class Classifier

		# Class variables
		@@random = Random.new
		@@acceptable_labels = nil

		def initialize
			raise RuntimeError, 'Has not been implemented'
		end

		# Returns a guess for a given example
		def guess_for(example)
			raise RuntimeError, "#{example} is not a a member of MachineLearning::Example!" unless example.is_a?(MachineLearning::Example)
			raise RuntimeError, 'acceptable_labels has not been set!' if @@acceptable_labels.nil?
			raise RuntimeError, 'Has not been implemented'
		end

		def self.acceptable_labels=(label_set)
			@@acceptable_labels = label_set
		end

		def self.seed=(seed)
			@@random = Random.new(seed)
		end
	end
end