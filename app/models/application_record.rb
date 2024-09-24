class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  DEFAULT_PAGING = 3
end
