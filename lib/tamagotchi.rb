class Tamagotchi
  max_level = 10
  min_level = 0

  define_method(:initialize) do |name|
    @name = name
    @food_level = max_level
    @sleep_level = max_level
    @activity_level = max_level
  end

  define_method(:name) do
    @name
  end

  define_method(:food_level) do
    @food_level
  end

  define_method(:sleep_level) do
    @sleep_level
  end

  define_method(:activity_level) do
    @activity_level
  end

  define_method(:is_alive) do
    @food_level.>(min_level)
  end

  define_method(:set_food_level) do |new_level|
    if !new_level.>(max_level)
      @food_level = new_level
    end
  end

  define_method(:set_sleep_level) do |new_level|
    if !new_level.>(max_level)
      @sleep_level = new_level
    end
  end

  define_method(:set_activity_level) do |new_level|
    if !new_level.>(max_level)
      @activity_level = new_level
    end
  end

  define_method(:time_passes) do
    @food_level = @food_level.-(1) unless
      @food_level.-(1).<(min_level)
    @activity_level = @activity_level.-(1) unless
      @activity_level.-(1).<(min_level)
    @sleep_level = @sleep_level.-(1) unless
      @sleep_level.-(1).<(min_level)
  end

  define_method(:is_happy) do
    @activity_level.>=(5)
  end

  define_method(:is_tired) do
    @sleep_level.<=(3)
  end

end

