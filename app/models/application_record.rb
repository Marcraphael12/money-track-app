class ApplicationRecord < ActiveRecord::Base
  # In Ruby on Rails, the `self.abstract_class = true` statement is used to indicate that the class is
  # an abstract class. An abstract class is a class that cannot be instantiated directly, but can be
  # inherited by other classes.
  self.abstract_class = true
end
