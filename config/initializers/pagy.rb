require "pagy/extras/overflow"
require "pagy/extras/bootstrap"

# Optionally override some pagy default with your own in the pagy initializer
Pagy::DEFAULT[:limit] = 10 # items per page
Pagy::DEFAULT[:size]  = 9  # nav bar links
# Better user experience handled automatically
Pagy::DEFAULT[:overflow] = :last_page
