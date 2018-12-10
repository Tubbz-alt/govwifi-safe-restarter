module Gateway
  class Delayer
    def initialize
      @retries = 0
    end

    def delay
      sleep(WAIT_TIME)
    end

    def increment_retries
      @retries += 1
    end

    def max_retries_reached?
      @retries >= MAX_RETRIES
    end

    MAX_RETRIES = 4
    WAIT_TIME = 200 # Cloudwatch health checks are 2 mins, 150 seconds is just over 2 mins
  end
end