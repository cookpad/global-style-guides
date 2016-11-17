## Bad
def index
  @recipes = Recipe.where(published: true).where.not(approved_at: nil)
end

## Good
class Recipe
  scope :published, -> { where(published: true) }
  scope :approved, -> { where.not(approved_at: nil) }
  scope :live, -> { published.approved }
end

def index
  @recipes = Recipe.live
end
