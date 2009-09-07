require 'mcrypt.so'

class Mcrypt

  class << self

    # Returns a hash with the following keys:
    #
    # +:block_algorithm+: true if the algorithm is a block algorithm
    #
    # +:block_size+: the size of blocks the algorithm works with (in bytes)
    #
    # +:key_size+: the maximum key size this algorithm will accept (in bytes)
    #
    # +:key_sizes+: an array containing all the key sizes the algorithm will accept (in bytes)
    #
    def algorithm_info(algorithm_name)
      {
        :block_algorithm   => block_algorithm?(algorithm_name),
        :block_size        => block_size(algorithm_name),
        :key_size          => key_size(algorithm_name),
        :key_sizes         => key_sizes(algorithm_name),
        :algorithm_version => algorithm_version(algorithm_name)
      }
    end

    # Returns a hash with the following keys:
    #
    # +:block_mode+: true if the mode is a block mode
    #
    # +:block_mode+: true if the mode is for use with block algorithms
    #
    # +:mode_version+: an integer identifying the version of the mode implementation
    #
    def mode_info(mode_name)
      {
        :block_mode           => block_algorithm?(mode_name),
        :block_algorithm_mode => block_algorithm_mode?(mode_name),
        :mode_version         => mode_version(mode_name)
      }
    end

    # Converts :rijndael_256 to "rijndael-256".
    # No need to call manually -- it's called for you when needed.
    def canonicalize_algorithm(algo) #:nodoc:
      algo.to_s.gsub(/_/,'-')
    end
  end

  # these are populated in C.
  attr_reader :algorithm, :mode

  private
  
  # if key and iv are passed to new(), they will be passed through
  # here for processing
  def after_init(key=nil,iv=nil) #:nodoc:
  end

end
